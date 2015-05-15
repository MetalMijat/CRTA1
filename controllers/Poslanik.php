<?php
	class Poslanik {
	    public static function hello() {
	        echo 'hello world dva!';
	    }

	    public static function sviPoslanici($param)
	    {
	    	$conn = Flight::db();
        	$data = $conn->prepare("SELECT * FROM `Poslanik` as p inner join PoslanickiKlub as pk on p.poslKlubId = pk.poslKlubId  ");
        	$data->execute();
        	$result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 				print_r('<pre>');
		 				print_r($param->pass['as']);
		 				print_r('</pre>');
		 				
		 	print_r("<br>");
		 	print_r(json_encode($result));
        
	    }

	    public static function novPoslanik($param = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `Poslanik`(poslanikId, izvorPodataka,Drzava, Ime, prezime) values(1,'ne znam','srbija','tomislav','nikolic') ");*/
        	$data = $conn->prepare("INSERT INTO `Poslanik` values(null, 'ne znam','srbija','tomislav','nikolic', null, null, null, null, null, null) ");
        	$res = $data->execute();
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }

	    public static function izbrisi($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `Poslanik`(poslanikId, izvorPodataka,Drzava, Ime, prezime) values(1,'ne znam','srbija','tomislav','nikolic') ");*/
        	$data = $conn->prepare("DELETE FROM `Poslanik` where poslanikId = ? ");
        	$res = $data->execute( array($id));
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }

	    public static function select($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `Poslanik`(poslanikId, izvorPodataka,Drzava, Ime, prezime) values(1,'ne znam','srbija','tomislav','nikolic') ");*/
        	$data = $conn->prepare("SELECT * from `Poslanik` where poslanikId = ? ");
        	$res = $data->execute( array($id));
        	$result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 		
		 	print_r(json_encode($result));
        
	    }
	    public static function brojPoslanikaPoPolu($pol){
	    	$conn = Flight::db();

	    	/*select * from poslanik where pol = 2*/
	    	$data = $conn->prepare("SELECT * FROM poslanik WHERE pol = ?");
	    	$res = $data->execute(array($pol));
	    	$result = $data->fetchAll(PDO::FETCH_ASSOC);

	    	print_r(json_encode($result));

	    }
	    public static function prosecanPrihod(){
	    	$conn = Flight::db();
	    	
	    	/*select avg(prihodi) from funkcija
			inner join poslanik on poslanik.poslanikID = funkcija.poslanikID*/
			$data = $conn->prepare("SELECT avg(prihodi) FROM funkcija
			INNER JOIN poslanik ON poslanik.poslanikID = funkcija.poslanikID");
			$res = $data->execute();
			$result = $data->fetchAll(PDO::FETCH_ASSOC);

			print_r(json_encode($result));
	    }
	    public static function prosecanPrihodPoPolu($pol){
	    	$conn = Flight::db();

	    	/*select avg(prihodi) from funkcija
			inner join poslanik on poslanik.poslanikID = funkcija.poslanikID
			where pol = 1*/
			$data = $conn->prepare("SELECT avg(prihodi) FROM funkcija
			INNER JOIN poslanik ON poslanik.poslanikID = funkcija.poslanikID
			WHERE pol = ?");
			$res = $data->execute($pol);
			$result = $data->fetchAll(PDO::FETCH_ASSOC);

			print_r(json_encode($result));

	    }
	    public static function ukupanPrihodPoslanika(){
	    	$conn = Flight::db();

	    	/*select sum(prihodi) from funkcija
			inner join poslanik on poslanik.poslanikID = funkcija.poslanikID*/
	    	$data = $conn->prepare("SELECT sum(prihodi) FROM funkcija
			INNER JOIN poslanik ON poslanik.poslanikID = funkcija.poslanikID");
			$res = $data->execute();
			$result = $data->fetchAll(PDO::FETCH_ASSOC);

			print_r(json_encode($result));

	    }
	    public static function ukupanPrihodPoslanikaPoPolu($pol){
	    	$conn = Flight::db();

	    	/*select sum(prihodi) from funkcija
			inner join poslanik on poslanik.poslanikID = funkcija.poslanikID
			where pol =1*/
			$data = $conn->prepare("SELECT sum(prihodi) FROM funkcija
			INNER JOIN poslanik ON poslanik.poslanikID = funkcija.poslanikID
			WHERE pol = ?");
			$res = $data->execute();
			$result = $data->fetchAll(PDO::FETCH_ASSOC);

			print_r(json_encode($result));
	    }
	}

?>