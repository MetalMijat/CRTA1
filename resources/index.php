<?php
require 'vendor/autoload.php';
//require 'celina/Pojedinacno.php'

Flight::set('flight.log_errors', true);

Flight::path(dirname(__FILE__) . '/controllers');
Flight::set('flight.views.path', 'public');

$myfile = fopen("sifra.txt", "r") or die("Unable to open file!");
$sifra = fgets($myfile).'';
fclose($myfile);

Flight::register('db', 'PDO', array('mysql:host=localhost;port=3306;dbname=crta', 'root', $sifra), function($db) {
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
});


/*Flight::map('notFound', function() {
    echo '<h1>404 Not found</h1>';

    Flight::stop(404);
});*/

# Ruotes #
# https://github.com/mikecao/flight/issues/34
Flight::route('/ime/@name', function($name) {
        $conn = Flight::db();
        $data = $conn->query("SELECT * FROM poslanik WHERE ime LIKE '%$name%' LIMIT 0, 30", PDO::FETCH_ASSOC/*PDO::FETCH_NUM*/);
        		
        		 print_r(json_encode($data));
        foreach($data as $row) {
               
        }
});

$id ="";

Flight::route('/poslanici', array('Poslanik','sviPoslanici'), Flight::request()->query);
Flight::route('/nov', array('Poslanik','novPoslanik'));
Flight::route('/izbrisi/@id', array('Poslanik','izbrisi'), $id );
Flight::route('/izaberi/@id', array('Poslanik','select'), $id );


Flight::route('/la/@nesto',function ($nesto=""){

	
	$dbh = Flight::db();
	$sth = $dbh->prepare("SELECT * FROM poslanik");
	$sth->execute();

	//ceo niz
	$result = $sth->fetchAll(PDO::FETCH_ASSOC);
			echo json_encode($result);

});

//read, update, delete, join

//Flight::register("po","Pojedinacno")

Flight::route('/', function(){
    echo 'hello world!';
    echo dirname(__FILE__);

});

Flight::route('/req', function(){
    var_dump(Flight::request());
});



Flight::route('/pojedin', array('Pojedinacno','hello'));
//Test metode za server
Flight::route('/poslanik', array('Poslanik','testMetoda'));
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
//var_dump(debug_backtrace());

Flight::start();


?>
