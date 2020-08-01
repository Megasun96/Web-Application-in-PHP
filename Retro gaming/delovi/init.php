<?php
session_start();

require_once 'config.php';
include 'funkcije/funkcije.php';

if(isset($_SESSION['korisnik_id'])){
    $status = info_korisnika($_SESSION['korisnik_id'], 'status');
    if($status['status']==0 ){
      header('Location: logout.php');}
        
;}
?>

