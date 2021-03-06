<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
// +----------------------------------------------------------------------+
// | Automne (TM)                                                         |
// +----------------------------------------------------------------------+
// | Copyright (c) 2000-2007 WS Interactive                               |
// +----------------------------------------------------------------------+
// | This source file is subject to version 2.0 of the GPL license.       |
// | The license text is bundled with this package in the file            |
// | LICENSE-GPL, and is available at through the world-wide-web at       |
// | http://www.gnu.org/copyleft/gpl.html.                                |
// +----------------------------------------------------------------------+
// | Author: Sébastien Pauchet <sebastien.pauchet@ws-interactive.fr>      |
// +----------------------------------------------------------------------+
//
// $Id: xapianDB.php,v 1.13 2010/03/18 10:53:58 sebastien Exp $

/**
  * Class CMS_XapianDB
  *
  * represent a Xapian Database
  * Xapian is an Open Source Probabilistic Information Retrieval library, 
  * released under the GPL. It's written in C++, and bindings are under 
  * development to allow use from other languages. See http://www.xapian.org for more.
  * 
  * It requires the Xapian PHP module to be loaded. To do this simply
  * download the Xapian core and SWIG bindings and compile or use distributed packages for your system.
  * 
  * @package CMS
  * @subpackage module
  * @author Sébastien Pauchet <sebastien.pauchet@ws-interactive.fr>
  */

class CMS_XapianDB extends CMS_grandFather {
	
	var $_isWritable = false;
	
	var $_dsn;
	
	var $_module;
	
	/**
	 * Database handle
	 * @var		XapianDatabase or XapianWritableDatabase
	 * @access	private
	 */
	var $_db = null;
	
	/**
	 * Remove lockfile if exists
	 * @var		bool
	 * @access	private
	 */
	var $_removelock = null;
	
	function CMS_XapianDB($module, $writable = false, $timeout = 60) {
		//module
		$this->_module = $module;
		//open DB
		if ($writable) {
			//if we need a writable DB, try to open it before timeout
			if (!$this->_loadWritableDatabase($timeout)) {
				$this->raiseError('can not load writable database ...');
				return;
			}
		} else {
			if ($this->dbExists()) {
				if (!$this->_loadDatabase()) {
					$this->raiseError('can not load database ...');
					return;
				}
			} else {
				//we need to create DB, try to create it
				if (!$this->_loadWritableDatabase($timeout)) {
					$this->raiseError('can not create database ...');
					return;
				}
				//remove lock
				$this->_removeLock();
			}
		}
		//writable
		$this->_isWritable = ($writable) ? true : false;
	}
	
	function reindex() {
		//first erase DB files
		CMS_file::deltree($this->_getDSN(), true);
		
		//get module interface
		if (!($moduleInterface = CMS_ase_interface_catalog::getModuleInterface($this->_module))) {
			$this->raiseError('no interface for module '.$this->_module);
			return false;
		}
		
		//then query complete module reindexation
		return $moduleInterface->reindexModule();
	}
	
	function getDocCount() {
		if (is_object($this->_db)) {
			return $this->_db->get_doccount();
		} else {
			return 0;
		}
	}
	
	function isWritable() {
		return $this->_isWritable;
	}
	
	function replaceDocument($xid, &$doc) {
		if (!$this->_isWritable) {
			$this->raiseError('can not replace document on non writable DB');
			return false;
		}
		return $this->_db->replace_document($xid, $doc);
	}
	
	function addDocument(&$doc) {
		if (!$this->_isWritable) {
			$this->raiseError('can not add document on non writable DB');
			return false;
		}
		return $this->_db->add_document($doc);
	}
	
	/**
	  * remove document(s) indexed with given term
	  *
	  * @param string $term : the term for documents deletion
	  * @return boolean true on success, false on failure
	  * @access private
	  */
	function deleteDocuments($term) {
		if (!$this->_isWritable) {
			$this->raiseError('can not add document on non writable DB');
			return false;
		}
		$this->_db->delete_document($term);
		return true;
	}
	
	function addDatabase($db) {
		if ($this->_isWritable) {
			$this->raiseError('can not add database on writable DB');
			return false;
		}
		$this->_db->add_database($db->getDatabase());
		return true;
	}
	
	function &getDatabase() {
		return $this->_db;
	}
	
	function endTransaction() {
		if ($this->_isWritable) {
			//flush
			try {
				$this->_db->flush();
			} catch (Exception $e) {
				$this->raiseError('Can not flush database : '.$e->getMessage());
			}
			try{
				foreach ( new DirectoryIterator($this->_getDSN()) as $file) {
					if ($file->isFile()) {
						@chmod($file->getPathname(),octdec(FILES_CHMOD));
					}
				}
			} catch(Exception $e) {}
			//remove lock
			$this->_removeLock();
			unset($this->_db);
		}
		unset($this);
		return true;
	}
	
	function _removeLock() {
		//remove lock
		$lock = $this->_dsn.'/db_lock';
		@unlink($lock);
		clearstatcache();
		return true;
	}
	
	/**
	  * Get database DSN for document (using his module codename and dbtype)
	  *
	  * @return string : the database dsn path relative to file system
	  * @access private
	  */
	function _getDSN() {
		if ($this->_dsn) {
			return $this->_dsn;
		}
		$this->_dsn = PATH_MAIN_FS.'/'.MOD_ASE_CODENAME.'/databases/'.io::strtolower($this->_module).'_flint';
		if (!is_dir($this->_dsn)) {
			$dsnFolder = new CMS_file($this->_dsn, CMS_file::FILE_SYSTEM, CMS_file::TYPE_DIRECTORY);
			if (!$dsnFolder->writeToPersistence()) {
				$this->raiseError('can not create DB DSN : '.$this->_dsn);
				return false;
			}
		}
		return $this->_dsn;
	}
	
	function _loadDatabase() {
		if (!$this->_getDSN()) {
			$this->raiseError('can not get DB DSN');
			return false;
		}
		try {
			$this->_db = Xapian::flint_open($this->_getDSN());
		} catch (Exception $e) {
			$this->raiseError('Can not open database : '.$e->getMessage());
		}
		if (!$this->_db) {
			$this->raiseError('can not get database ...');
			return false;
		}
		return true;
	}
	
	function _loadWritableDatabase($timeout = 60) {
		@set_time_limit(((int) $timeout) + 60);
		if (!$this->_getDSN()) {
			$this->raiseError('can not get DB DSN');
			return false;
		}
		//check for DB lock before opening in writing mode
		$starttime = getmicrotime();
		$lock = $this->_dsn.'/db_lock';
		while (is_file($lock)) {
			if ((getmicrotime()-$starttime) >= $timeout) {
				//if we can't get DB at the end of the timeout, assume, previous indexation has failed so force remove lock
				$this->_removeLock();
				//$starttime = getmicrotime();
			} else {
				usleep(50000); //.05s
				clearstatcache();
			}
		}
		try{
			foreach ( new DirectoryIterator($this->_getDSN()) as $file) {
				if ($file->isFile()) {
					@chmod($file->getPathname(),octdec(FILES_CHMOD));
				}
			}
		} catch(Exception $e) {}
		try {
			$this->_db = Xapian::flint_open($this->_getDSN(), Xapian::DB_CREATE_OR_OPEN);
		} catch (Exception $e) {
			$this->raiseError('Can not open database : '.$e->getMessage());
		}
		if (!$this->_db) {
			$this->raiseError('can not get writable database ...');
			return false;
		}
		//create lock file
		$lockfile = new CMS_file($lock);
		$lockfile->setContent((string) mktime());
		$lockfile->writeToPersistence();
		return true;
	}
	
	function getDBSize() {
		if (!$this->_getDSN()) {
			$this->raiseError('can not get DB DSN');
			return false;
		}
		$dbSize = 0;
		$db_dir = dir($this->_getDSN());
		while (false !== ($file = $db_dir->read())) {
			if ($file != '.' && $file != '..') {
				$dbSize += filesize($this->_getDSN().'/'.$file);
			}
		}
		//convert in KB or MB
		if ($dbSize > 1048576) {
			$dbSize = round(($dbSize/1048576),2).' M';
		} else {
			$dbSize = round(($dbSize/1024),2).' K';
		}
		return $dbSize;
	}
	
	function dbExists() {
		if (!$this->_getDSN()) {
			$this->raiseError('can not get DB DSN');
			return false;
		}
		$db_dir = dir($this->_getDSN());
		while (false !== ($file = $db_dir->read())) {
			if ($file != '.' && $file != '..') {
				return true;
			}
		}
		return false;
	}
}
?>