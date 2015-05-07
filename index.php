<?php
require 'vendor/autoload.php';
//require 'celina/Pojedinacno.php'


Flight::path(dirname(__FILE__) . '/celina');

//Flight::register("po","Pojedinacno")

Flight::route('/', function(){
    echo 'hello world!';
});



Flight::route('/pojedin', array('Pojedinacno','hello'));


Flight::start();


?>
