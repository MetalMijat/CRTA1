<?php
class NepokretnaImovina {

	public static function povrsinaStambenihJedinica(){

		$conn = Flight::db();

		/*select Poslanik.Ime, Poslanik.Prezime, sum(Povrsina) from NepokretnaImovina 
		INNER JOIN Poslanik ON Poslanik.PoslanikID = NepokretnaImovina.PoslanikID
		where (NepokretnaImovina.Tip  like "ku%a") or (NepokretnaImovina.Tip like "stan") 
		GROUP BY Poslanik.PoslanikID*/

		$data = $conn->prepare(
			"SELECT Poslanik.Ime, Poslanik.Prezime, sum(Povrsina) FROM NepokretnaImovina 
		 INNER JOIN Poslanik ON Poslanik.PoslanikID = NepokretnaImovina.PoslanikID
		 WHERE (NepokretnaImovina.Tip  like 'ku%a') OR (NepokretnaImovina.Tip like 'stan') 
		 GROUP BY Poslanik.PoslanikID ");
		$res = $data->execute();
		$result = $data->fetchAll(PDO::FETCH_ASSOC);

		print_r(json_encode($result));

		//sjhadkjshd
	}



}

?>