<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['login'] 								= 'user/login';
$route['admin'] 								= 'user/dashboard';
$route['admin/posts'] 							= 'user/posts';
$route['admin/gallery'] 						= 'user/snapshots';
$route['admin/priests'] 						= 'user/priest_new';







$route['search']									= 'search';
$route['priest']					    			= 'priests';
$route['parish']					    			= 'parish';
$route['administration']							= 'administration';
$route['commission']								= 'commission';
$route['circular']					  				= 'circular';
$route['circular/(:any)']					  		= 'circular/view';
$route['posts']										= 'posts';
$route['snapshots']									= 'snapshots';
$route['openletters']								= 'openletters';
$route['openletters/(:any)']					    = 'openletters/view';
$route['tv']										= 'tv';
$route['pages']										= 'pages';
$route['users']										= 'users';
$route['timeline']									= 'user';
$route['updates/(:any)']							= 'updates';
$route['sitemap\.xml']								= 'sitemap';
$route['(:any)']									= 'user';
$route['(:any)/(:num)']								= 'user';
$route['(:any)/(:num)/(:num)']				        = 'user';
$route['(:any)/followers']						    = 'user';
$route['(:any)/following']						    = 'user';
$route['(:any)/friends']							= 'user';
$route['default_controller'] 					    = 'user';
$route['404_override'] 								= 'error';
$route['translate_uri_dashes'] 				        = FALSE;

