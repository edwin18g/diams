<?php


if($_SERVER['HTTP_HOST'] == 'dio.local'){
	define('HOSTNAME', 'localhost');
	define('USERNAME', 'root');
	define('PASSWORD', 'root');
	define('DATABASE', 'dio');
}elseif($_SERVER['HTTP_HOST'] == 'dio.local.com'){
	define('HOSTNAME', 'localhost');
	define('USERNAME', 'root');
	define('PASSWORD', 'root');
	define('DATABASE', 'dio');
}else{
	define('HOSTNAME', 'localhost');
		define('USERNAME', 'edwinpok_Stream');
		define('PASSWORD', '12345678');
		define('DATABASE', 'edwinpok_kuzhithuraidiocese');
}
	// Database Connection


	
		
	
	