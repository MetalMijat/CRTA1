<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Hello World2!!!</title>
</head>
<body>
	<?php
		class Politicar {
			public $name1;
			public $earnings;

			public function __construct($name1, $earnings){
				$this -> earnings = $earnings;
				$this -> name1 = $name1; 
			}
			public function truth(){
				echo "I, am ". $this->name1." and i earn ".$this->earnings."!!!";
			}			
		}
			$politicar1 = new Politicar($var1, $var2);
			$politicar1 -> truth();
	?>
</body>
</html>