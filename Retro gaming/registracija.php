<?php 
session_start();	
if(isset($_SERVER['HTTP_REFERER'])!="http://localhost//RETRO_GAMING/index.php") die("Nepoznati izvor");

require_once 'config.php';
include 'funkcije/funkcije.php';
	
include 'delovi/header.php';
include 'delovi/aside.php';



if(je_ulogovan() ) header ('Location: index.php');
    $polja = array('username','password','ime','prezime','email');
	
    foreach($polja as $polje){
        if(!isset($_POST[$polje]) || empty(trim($_POST[$polje]))){
            switch($polje){
                case 'username': $f = 'Korisničko ime'; break;
                case 'password': $f = 'Lozinka'; break;
				case 'email': $f = 'E-mail adresa'; break; 
                case 'ime': $f = 'Ime'; break;
                case 'prezime': $f = 'Prezime'; break;
				}
            $errors[] = 'Polje <b>' . $f . '</b> mora biti upisano.';
                
        }else{
            $$polje = trim($_POST[$polje]);
        }
    }
    $errors=array();
    if(isset($username)){
        if(username_postoji($username)) $errors[] = 'Korisničko ime već postoji u bazi. Odaberite drugo.';
        if(strlen($username) < 3) $errors[] = 'Korisničko ime mora imati najmanje 3 karaktera.';
        if(!ctype_alnum($username)) $errors[] = 'Korisničko ime može sadržati samo slova i brojeve.';
    }
    if(isset($ime)){
        if(strlen($ime) < 3) $errors[] = 'Ime mora imati najmanje 3 karaktera.';
        if(!ctype_alpha($ime)) $errors[] = 'Ime mora sadržati samo slova.';
    }
    if(isset($prezime)){
        if(strlen($prezime) < 3) $errors[] = 'Prezime mora imati najmanje 3 karaktera.';
        if(!ctype_alpha($prezime)) $errors[] = 'Prezime mora sadržati samo slova.';
    }
    if(isset($password)){
        if(strlen($password) < 3) $errors[] = 'Lozinka mora imati najmanje 3 karaktera.';
        
    }
    if(isset($email)){
        if(email_postoji($email)) $errors[] = 'Već postoji korisnik sa ovom E-mail adresom.';
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = 'Unesite validnu E-mail adresu.';
    }
    
    if(count($errors) == 0){
        if(@novi_korisnik($username, $password, $ime, $prezime, $email)){
            $_SESSION['status'] = 0;?>
			<h2>Uspesna registracija, <br /><br />sacekajte aktivaciju od strane administratora</h2>
           <?php
        }else{
            $errors[] = 'Došlo je do greške prilikom registracije. Obratite se tehničkoj podršci.';
        }
    }

if(isset($errors)){
    ?>
	
    <ul><li><?php echo implode('</li><li>', $errors) ?></li></ul>
	
    <?php
    }else {echo "Uspesna registracija, sacekajte aktivaciju od strane administratora";
        //header('Location: index.php');
        };

    
include 'delovi/footer.php'; ?>