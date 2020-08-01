<?php include "delovi/init.php";?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ZX</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>


<body>

<div id="wrapper" class="side">

<header>

<div class="zaglavlje"> </div>

<div class="hederOstale">

<a href="zx.php?cid=1"> <img src="slike/ZX Spectrum.png" width="300" height="200"  alt="x"/></a>


<a href="index.php">	
<img src="slike/RGS.png" width="300" height="200"  alt="x"/>
</a>

<img src="slike/logo/ZXLogo.png" class="logomargine" width="300" height="45"  alt="z"/>


</div>
</header>


<main>


<?php
require "config.php";

$category = isset($_GET['cid'])&&is_numeric($_GET['cid'])?$_GET['cid']:0;

$vesti = $conn->query("SELECT * FROM vesti where ID_KATEGORIJE ='$category' ORDER BY VEST_ID DESC LIMIT 1 ");

while ($vest=$vesti->fetch(PDO::FETCH_ASSOC))
	echo "{$vest['NASLOV_VESTI']} <br /> {$vest['SADRZAJ_VESTI']} <br />";


?>


</main>


<?php require "delovi/aside_category.php";?>



<footer>
<a href="https://www.facebook.com/xstefanxcz" >
<img src="slike/Facebook.png" width="184" height="72" class="facebook" alt="x"/>
</a>

<a href="https://www.youtube.com/channel/UCwvxVsSwudOR7XDeGruoFiA/">
<img src="slike/youtube_0.png" width="200" height="72" class="youtube" alt="x"/>
</a>


</footer>








</div>

</body>
</html>
