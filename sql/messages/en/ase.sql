#----------------------------------------------------------------
#
# Messages content for module ase
# English Messages
#
#----------------------------------------------------------------
# $Id: ase.sql,v 1.1 2010/01/25 16:31:57 sebastien Exp $

DELETE FROM messages WHERE module_mes = 'ase' and language_mes = 'en';

INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(1, 'ase', 'en', 'Search Engine');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(2, 'ase', 'en', 'ASE : Automne Search Engine');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(3, 'ase', 'en', 'Xapian librairie does not exists on your system, module is not running ... Please contact your <a href="mailto:%s" class="admin">system administrator</a>.');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(4, 'ase', 'en', 'Xapian version: %s');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(5, 'ase', 'en', 'Active content filters:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(6, 'ase', 'en', 'Microsoft Word');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(7, 'ase', 'en', 'Microsoft Excel');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(8, 'ase', 'en', 'PDF');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(9, 'ase', 'en', 'Open Office');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(10, 'ase', 'en', 'Microsoft PowerPoint');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(11, 'ase', 'en', 'HTML');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(12, 'ase', 'en', 'Plain text');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(13, 'ase', 'en', 'Unknown filter');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(14, 'ase', 'en', 'Filter');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(15, 'ase', 'en', 'Supported extensions');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(16, 'ase', 'en', 'Inactive');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(17, 'ase', 'en', 'Active Indexing');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(18, 'ase', 'en', 'Inactive');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(19, 'ase', 'en', 'Index size');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(20, 'ase', 'en', 'Number of indexed documents');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(21, 'ase', 'en', 'Reindex');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(22, 'ase', 'en', 'Do you confirm content reindexation for module?<br /><br />Attention, during the reindexing the engine will not provide relevant results for the module.');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(23, 'ase', 'en', 'Search engine : Query element ''%s''');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(24, 'ase', 'en', 'Search engine : Indexing element ''%s''');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(25, 'ase', 'en', 'Search engine : Delete element ''%s''');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(26, 'ase', 'en', 'Minimum version needed: %s');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(27, 'ase', 'en', 'Search');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(28, 'ase', 'en', 'Results %s - %s of about %s for your query');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(29, 'ase', 'en', 'Did you mean:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(30, 'ase', 'en', 'Results:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(31, 'ase', 'en', 'Indexed on');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(32, 'ase', 'en', 'Published on');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(33, 'ase', 'en', 'Expand your query:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(34, 'ase', 'en', 'Help');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(35, 'ase', 'en', 'Pages :');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(36, 'ase', 'en', 'Your search did not match any documents...<br />Suggestions: Make sure all words are spelled correctly, try different keywords, try more general keywords.');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(37, 'ase', 'en', 'Your search involved an error, thank you to modify it...');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(38, 'ase', 'en', 'Relevance percentage:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(39, 'ase', 'en', 'Refine search using this document');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(40, 'ase', 'en', 'Refine search using this document');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(41, 'ase', 'en', '<p>Accents, capital letters as well as words with no proper meaning (the, that, of, a, etc.) will not be taken into account. The engine uses <a href="http://en.wikipedia.org/wiki/Stemming" target="_blank" alt="See Wikipedia definition" title="See Wikipedia definition">stemming</a> search (horse equals horses, documentation equals documents and vice versa). Words beginning with a capital letter will be considered as proper nouns.</p>\n	<h3>Refine your search:</h3>\n	<p>The terms suggested to refine your search are important words from the first documents resulting from your search.</p>\n	<p>The link "Refine your search from this document" enables you to identify the most relevant documents and launch a new search taking them into account.</p>\n	<p>If the terms you use for your search include words in a foreign language, select this language to enable a better lexical analysis of your demand, hence better results.</p>\n	<h3>Operators:</h3>\n	<table>\n		<tr>\n			<th>AND : </th>\n			<td>The resulting documents will respond to both terms.</td>\n		</tr>\n		<tr>\n			<th>OR : </th>\n			<td>The resulting documents will respond to one of the terms.</td>\n		</tr>\n		<tr>\n			<th>NOT : </th>\n			<td>The resulting documents will only respond to the word on the left.</td>\n		</tr>\n		<tr>\n			<th>XOR : </th>\n			<td>The resulting documents will respond to one of the words but not to both.</td>\n		</tr>\n		<tr>\n			<th>( and ) : </th>\n			<td>Allows you to use a group of words.</td>\n		</tr>\n		<tr>\n			<th>+ et - : </th>\n			<td>The resulting documents will respond to all the terms preceeded by + and to no term preceeded by a -. Example: +horse -car</td>\n		</tr>\n		<tr>\n			<th>NEAR : </th>\n			<td>The resulting documents will include both terms separated by no more than 10 words.<br />Exemple: horse NEAR car</td>\n		</tr>\n		<tr>\n			<th>" " : </th>\n			<td>Allows to search for an exact sentence.</td>\n		</tr>\n		<tr>\n			<th>* : </th>\n			<td>Wildcard: Attention, the use of this sign may slow down your search.</td>\n		</tr>\n	</table>\n	<h3>Prefixes :</h3>\n	<p>The following prefixes enable you to limit your search to some characteristics of documents. The word has to follow the prefix immediately, with no space between them. You can combine these prefixes with any kind of classic keyword search.</p>\n	<table>\n		<tr>\n			<th>"title:" : </th>\n			<td>The word following this prefix will be part of the document''s title.<br />Example: title:horse</td>\n		</tr>\n		<tr>\n			<th>"filetype:" : </th>\n			<td>This defines the type of document that will respond your search.<br />The available types of documents are: %s<br />Example: filetype:pdf</td>\n		</tr>\n		<tr>\n			<th>"language:" : </th>\n			<td>This defines the language used in the documents that will respond your search. The available languages are: fr, en<br />Example: language:fr</td>\n		</tr>\n		<!--<tr>\n			<th>"page:" : </th>\n			<td>The resulting documents will be located within the specified page.<br />Example: page:12</td>\n		</tr>\n		<tr>\n			<th>"root:" : </th>\n			<td>The resulting documents will be located within sub-pages of the specified root page.<br />Example : root:12</td>\n		</tr>-->\n	</table>');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(43, 'ase', 'en', 'Microsoft Word 2007');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(44, 'ase', 'en', 'Microsoft Excel 2007');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(45, 'ase', 'en', 'Japanese text support');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(46, 'ase', 'en', 'Missing binary');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(47, 'ase', 'en', 'Indexed modules');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(48, 'ase', 'en', 'Consult modules indexed and reindex module');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(49, 'ase', 'en', 'Configuration');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(50, 'ase', 'en', 'Engine Configuration');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(51, 'ase', 'en', 'Consult the operating condition of engine filters and active documents');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(52, 'ase', 'en', 'Refresh index informations');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(53, 'ase', 'en', 'Reindex the module: In case of problems on the search results (incomplete or incorrect), it may be necessary to re-index the contents of a module update all informations of the search engine.');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(54, 'ase', 'en', 'Pages used for Open Search:');
INSERT INTO `messages` (`id_mes`, `module_mes`, `language_mes`, `message_mes`) VALUES(55, 'ase', 'en', 'Pages roots of trees excluded from indexing:');