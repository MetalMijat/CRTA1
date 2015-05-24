<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

[
  {
    "stranka": "urs",
    "brojPol": [
      {
        "pol": "m",
        "broj": 14
      },
      {
        "pol": "z",
        "broj": 7
      }
    ]
  },
  {
    "stranka": "sdp",
    "brojPol": [
      {
        "pol": "m",
        "broj": 27
      },
      {
        "pol": "z",
        "broj": 15
      }
    ]
  },
  {
    "stranka": "ns",
    "brojPol": [
      {
        "pol": "m",
        "broj": 17
      },
      {
        "pol": "z",
        "broj": 25
      }
    ]
  },
  {
    "stranka": "ldp",
    "brojPol": [
      {
        "pol": "m",
        "broj": 25
      },
      {
        "pol": "z",
        "broj": 9
      }
    ]
  },
Ovo je jedan niz,
za svaku stranku
ide parametar ime sttranke: vrijednost
niz "brojpol"
podniz 1 sa parametrima
podniz2 sa parametrima
  {
    "stranka": "sps",
    "brojPol": [
      {
        "pol": "m",
        "broj": 16
      },
      {
        "pol": "z",
        "broj": 28
      }
    ]
  }
]
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        class Polovi {

        public static function helloE(){
          echo "Hello everyone!!!";
        }
        public static function izlistajPolove(){
        $db = Flight::db();
        $a=0;
        foreach($db->query('SELECT * FROM stranka') as $row) {
            $a++;
        $nazivstranke = $row['Naziv'];
        $id_stranke=$row['StrankaID'];
        $polz = 1;
        $polm = 0;
        $stmt = $db->prepare("SELECT * FROM poslanik WHERE StrankaID=:stranka_id AND Pol=:pol");
        $stmt->bindValue(':stranka_id', $id_stranke, PDO::PARAM_INT);
        $stmt->bindValue(':pol', $polz, PDO::PARAM_INT);
        $stmt->execute();
        $row_countz = $stmt->rowCount();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt1 = $db->prepare("SELECT * FROM poslanik WHERE StrankaID=:stranka_id AND Pol=:pol");
        $stmt1->bindValue(':stranka_id', $id_stranke, PDO::PARAM_INT);
        $stmt1->bindValue(':pol', $polm, PDO::PARAM_INT);
        $stmt1->execute();
        $row_countm = $stmt1->rowCount();
        $rows1 = $stmt1->fetchAll(PDO::FETCH_ASSOC);
        $arraypolz=array(
            "Pol" => 'z',
            "broj" =>  $row_countz
        );
        $arraypolm=array(
            "Pol" => 'm',
            "broj" => $row_countm
        );
        $arraypol = array(
            $arraypolm,$arraypolz
        );
        $array[/*$a*/] = array(
    "Stranka" => $nazivstranke,
    "brojpol" => $arraypol,
);


 /*
U suštini za svaku stranku selekttovati poslanike,pol gdje je vrijednost z i izbrjati
U suštini za svaku stranku selekttovati poslanike,pol gdje je vrijednost m i izbrjati
                   */
}
$jsonencode = json_encode($array, true);
        echo $jsonencode;
      }
    }

        ?>
       <script> 
        var json = <?php echo $jsonencode; ?>
        </script> 
    </body>
</html>
