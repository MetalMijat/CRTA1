<?php
require 'vendor/autoload.php';
//require 'celina/Pojedinacno.php'


Flight::path(dirname(__FILE__) . '/celina');
Flight::set('flight.views.path', 'public');

//Flight::register("po","Pojedinacno")

Flight::route('/', function(){
    echo 'hello world!';
});



Flight::route('/pojedin', array('Pojedinacno','hello'));
Flight::route('/dva', function (){
	//echo "joj";
	Flight::render('index.html');
});


Flight::start();


?>
