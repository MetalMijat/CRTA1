<?php
	class poslanickiKlub {
	   public static function hello() {
	        echo "Mi smo stranka";
	    }
	public static function sviKlubovi ($param){

		$conn = Flight::db();
        $data = $conn->prepare("SELECT * FROM `PoslanickiKlub`");
        $data->execute();
        $result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 	print_r('<pre>');
		 	print_r($param->pass['as']);
		 	print_r('</pre>');
		 				
		print_r("<br>");
		print_r(json_encode($result));
	}
	public static function noviKlub($param = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `crta`.`PoslanickiKlub` (`PoslKlubID`, `Naziv`, `StrankaID`, `Saziv`) VALUES ('1', 'Srpska napredna stranka', '1', '2012 - 2014')");*/
        	$data = $conn->prepare("INSERT INTO `PoslanickiKlub` values(null, 'srpska napredna stranka','1', '2012 - 2014') ");
        	$res = $data->execute();
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }
	public static function izbrisi($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("DELETE FROM `PoslanickiKlub` WHERE `PoslKlubID`= 2");*/
        	$data = $conn->prepare("DELETE FROM `PoslanickiKlub` where PoslKlubID = ? ");
        	$res = $data->execute( array($id));
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }
	 public static function select($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `crta`.`Stranka` (`StrankaID`, `Naziv`, `DatumOsnivanja`) VALUES ('1', 'SNS', '2008-10-21')");*/
        	$data = $conn->prepare("SELECT * FROM `PoslanickiKlub` WHERE `PoslKlubID` = ? ");
        	$res = $data->execute( array($id));
        	$result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 		
		 	print_r(json_encode($result));
        
	    }

	 public static function pretraga($param){
	 		$conn = Flight::db();

	 		$data = $conn->prepare("SELECT * FROM `PoslanickiKlub` WHERE $param ");
	 		$res = $data->execute( array($param));
	 		$result = $data->fetchAll(PDO::FETCH_ASSOC);

	 		print_r(json_encode($result));

	 }
	 public static function poslaniciUKlubu($id){
	 		$conn = Flight::db();
	 		//select Ime, Prezime from Poslanik 
   /*inner join PoslanickiKlub on Poslanik.PoslKlubID = PoslanickiKlub.PoslKlubID
   where PoslanickiKlub.PoslKlubID = 1;*/
	 		$data = $conn->prepare("SELECT * FROM `Poslanik` INNER JOIN `PoslanickiKlub` ON Poslanik.PoslKlubID = PoslanickiKlub.PoslKlubID WHERE PoslanickiKlub.PoslKlubID = ?");
	 		$res = $data->execute (array($id));
	 		$result = $data->fetchAll(PDO::FETCH_ASSOC);

	 		print_r(json_encode($result));

	 }
}

?>