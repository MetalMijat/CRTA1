<?php
require 'vendor/autoload.php';
Flight::set('flight.log_errors', true);
//Postavljena putanja do template-a.
Flight::set('flight.views.path', 'templates');

Flight::route('/', function(){
    //echo 'hello world!';
    //Postavljanje Super Globalne promenljive (Ili promenljive koja ima slican efekat)!!!
    Flight::view()->set('name', 'CRTA');

	Flight::render('hello_world.php');

	Flight::render('hello_world2.php', array('var1' => 'Aleksandar Vucic', 'var2' => '100000 din'));
});


Flight::start();


?>
