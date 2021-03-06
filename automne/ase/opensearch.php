<?php
/* vim: set expandtab tabstop=4 shiftwidth=4: */
// +----------------------------------------------------------------------+
// | Automne (TM)                                                         |
// +----------------------------------------------------------------------+
// | Copyright (c) 2000-2005 WS Interactive                               |
// +----------------------------------------------------------------------+
// | This source file is subject to version 2.0 of the GPL license,       |
// | or (at your discretion) to version 3.0 of the PHP license.           |
// | The first is bundled with this package in the file LICENSE-GPL, and  |
// | is available at through the world-wide-web at                        |
// | http://www.gnu.org/copyleft/gpl.html.                                |
// | The later is bundled with this package in the file LICENSE-PHP, and  |
// | is available at through the world-wide-web at                        |
// | http://www.php.net/license/3_0.txt.                                  |
// +----------------------------------------------------------------------+
// | Author: Sébastien Pauchet <sebastien.pauchet@ws-interactive.fr>      |
// +----------------------------------------------------------------------+

/**
  * PHP page : generate  OpenSearch description document
  *
  * @package CMS
  * @subpackage admin
  * @author Sébastien Pauchet <sebastien.pauchet@ws-interactive.fr>
  */

require_once(dirname(__FILE__).'/../../cms_rc_frontend.php');

//Get parameters
$error = 0;
$search = io::request('search');
$websiteId = io::request('website', 'sensitiveIO::isPositiveInteger');

if (!$search || !$websiteId || !(substr($search, 0, 1) == '/' || sensitiveIO::isPositiveInteger($search))) {
	$error = 1;
}

if (!$error) {
	$website = CMS_websitesCatalog::getByID($websiteId);
	if ($website && !$website->hasError()) {
		$searchURL = (sensitiveIO::isPositiveInteger($search)) ? CMS_tree::getPageValue($search,'url') : $website->getURL().$search;
		if ($searchURL) {
			$title = APPLICATION_LABEL;
			if (!$website->isMain()) {
				$title .= ' ('.$website->getLabel().')';
			}
			
			$content = 
			'<?xml version="1.0" encoding="'.APPLICATION_DEFAULT_ENCODING.'"?>'."\n".
			'<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">'."\n".
			'	<ShortName>'.$title.'</ShortName>'."\n".
			'	<Description>Search on '.$title.' website.</Description>'."\n".
			'	<Url type="text/html" '."\n".
			'		template="'.$searchURL.'?q={searchTerms}"/>'."\n".
			'</OpenSearchDescription>';
			
			//send RSS content
			if (!isset($_REQUEST['previz']) || !$_REQUEST['previz']) {
				header('Content-type: text/xml; charset='.APPLICATION_DEFAULT_ENCODING);
				echo $content;
			} else {
				echo '<pre>'.htmlspecialchars($content).'</pre>';
			}
		}
	}
}
?>