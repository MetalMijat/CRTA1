<?php
	class stranka {
	   public static function hello() {
	        echo "Mi smo stranka";
	    }
	public static function sveStranke ($param){

		$conn = Flight::db();
        $data = $conn->prepare("SELECT * FROM `Stranka` as s inner join PoslanickiKlub as pk on s.poslKlubId = pk.poslKlubId ");
        $data->execute();
        $result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 	print_r('<pre>');
		 	print_r($param->pass['as']);
		 	print_r('</pre>');
		 				
		print_r("<br>");
		print_r(json_encode($result));
	}
	public static function novaStranka($param = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `crta`.`Stranka` (`StrankaID`, `Naziv`, `DatumOsnivanja`) VALUES ('1', 'SNS', '2008-10-21')");*/
        	$data = $conn->prepare("INSERT INTO `Stranka` values(null, 'srpska napredna stranka','2008-10-21') ");
        	$res = $data->execute();
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }
	public static function izbrisi($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `crta`.`Stranka` (`StrankaID`, `Naziv`, `DatumOsnivanja`) VALUES ('1', 'SNS', '2008-10-21') ");*/
        	$data = $conn->prepare("DELETE FROM `Stranka` where strankaId = ? ");
        	$res = $data->execute( array($id));
        	/*$result = $data->fetchAll(PDO::FETCH_ASSOC);*/
		 				
		 		
		 	print_r(json_encode($res));
        
	    }
	 public static function select($id = "")
	    {
	    	$conn = Flight::db();

	    	//treba  uzeti podatke i srediti ih
        	/*$data = $conn->prepare("INSERT INTO `crta`.`Stranka` (`StrankaID`, `Naziv`, `DatumOsnivanja`) VALUES ('1', 'SNS', '2008-10-21')");*/
        	$data = $conn->prepare("SELECT * from `Stranka` where strankaId = ? ");
        	$res = $data->execute( array($id));
        	$result = $data->fetchAll(PDO::FETCH_ASSOC);
		 				
		 		
		 	print_r(json_encode($result));
        
	    }
	 public static function prosecnaPlata(){
	 		$conn = Flight::db();

	 		$data = $conn->prepare("SELECT * ")

	 }
}

?>