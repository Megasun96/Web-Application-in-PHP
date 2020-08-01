<?php

try{
    $conn = new PDO('mysql:host=localhost;dbname=retrogaming;charset=utf8','root','');
}catch(PDOException $err){
    echo $err->getMessage();
}
?>