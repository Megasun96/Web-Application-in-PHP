<?php
if(isset($_SERVER['HTTP_REFERER'])!="http://localhost//Vesti-root/index.php") die("Nepoznati izvor");

require_once "config.php";
require_once "delovi/init.php";
include 'delovi/header.php';
include 'delovi/aside.php';

		if(!isset($_POST['username1'])||!isset($_POST['password1'])){
		die("Nepostojeci parametri");
		}
		else if(isset($_POST['username1'])||isset($_POST['password1'])){

		$username= trim($_POST['username1']);
		$password= trim($_POST['password1']);

		$username = str_replace("<","",$username);
		$username = str_replace(">","",$username);
		$username = str_replace("'","",$username);
		$username = str_replace("-","",$username);

		$password = str_replace("'","",$password);
		$password = str_replace("-","",$password);
		$password = str_replace("<","",$password);
		$password = str_replace(">","",$password);

		$md5Password=md5($password);

		$upit= $conn->prepare('SELECT korisnik_id, username, ime, prezime, email, status FROM korisnici WHERE username = :ime AND password = :pass');
		$upit->bindParam(':ime', $username);
		$upit->bindParam(':pass', $md5Password);
		$upit->execute();
		if($upit->rowCount() == 1){
		$_SESSION['info_korisnika'] = $upit->fetch();}

		if(korisnik_postoji($username, $password) !== true){
            echo "Nepostojeći korisnik. Da li ste se registrovali?";
       }
		else if(@$_SESSION['info_korisnika']['status'] ==1){
			$_SESSION['korisnik_id'] = $_SESSION['info_korisnika']['korisnik_id'];
			$_SESSION['korisnik']=true;
			echo "Dobordosao korisnice {$_SESSION['info_korisnika']['ime']}";
			header("location: index.php");

		}
		else if(@$_SESSION['info_korisnika']['status'] ==2){
			$_SESSION['korisnik_id'] = $_SESSION['info_korisnika']['korisnik_id'];
			$_SESSION['admin']=true;
			echo "Dobordosao administratore {$_SESSION['info_korisnika']['ime']}";
			header("location: index.php");
		}
		else if($_SESSION['info_korisnika']['status'] == 0){
            $_SESSION['status'] = 0;
		header('Location: index.php');}
		}

			else{echo "Niste nas clan, proverite da li ste se validno registrovali";}

include 'delovi/footer.php';


?>
