<?php include_once "config.php"; ?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<?php /*<script type="text/javascript" src="js/validacija.js"></script> */?>


<title>RETROGAMING</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>


<body onload="">

<div id="wrapper">

<header id="index">

<div class="zaglavlje"> </div>

<div class="heder">

<?php


$kat=$conn->query('select * from kategorije');

while ($red=$kat->fetch(PDO::FETCH_ASSOC)){

?>
<a href="<?php echo $red['link']; ?>?cid=<?php echo $red['KATEGORIJA_ID']; ?>"> <img src="slike/<?php echo $red['slika']; ?>" width="300" height="200"  alt="x"/></a>

<?php } ?>


</div>

 


</header>

