<?php
require 'vendor/autoload.php';
//require 'celina/Pojedinacno.php'

Flight::set('flight.log_errors', true);

Flight::path(dirname(__FILE__) . '/celina');
Flight::set('flight.views.path', 'public');


Flight::register('db', 'PDO', array('mysql:host=localhost;port=3306;dbname=chat', 'root', ''), function($db) {
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
});


Flight::map('notFound', function() {
    echo '<h1>404 Not found</h1>';

    Flight::stop(404);
});

# Ruotes #
# https://github.com/mikecao/flight/issues/34
Flight::route('/username/@name', function($name) {
        $conn = Flight::db();
        $data = $conn->query("SELECT * FROM ajax_chat_messages WHERE userName LIKE '%$name%' LIMIT 0, 30", PDO::FETCH_ASSOC/*PDO::FETCH_NUM*/);
        		/*print_r('<pre>');
        		print_r($data);
        		print_r('</pre>');
        		die();*/
        		 print_r(json_encode($data));
        foreach($data as $row) {
               
        }
});

Flight::route('/la/@nesto',function ($nesto=""){

	
	$dbh = Flight::db();
	$sth = $dbh->prepare("SELECT * FROM ajax_chat_messages");
	$sth->execute();

	
	$result = $sth->fetchAll(PDO::FETCH_ASSOC);
			echo json_encode($result);

});

//read, update, delete, join

//Flight::register("po","Pojedinacno")

Flight::route('/', function(){
    echo 'hello world!';
});

Flight::route('/req', function(){
    var_dump(Flight::request());
});



Flight::route('/pojedin', array('Pojedinacno','hello'));
Flight::route('/dva', function (){
	//echo "joj";
	Flight::render('index.html');
});


Flight::route('POST /cetiri', function (){
	
	print_r(Flight::request()->data);

	
	///Content-Type: multipart/form-data; 
	///radi samo sa hederima form data, valjda je to ok
	///radi i aplication/json
	
});


Flight::start();


?>
