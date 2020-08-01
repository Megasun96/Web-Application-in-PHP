<?php
session_start();
if(!isset($_SESSION['admin'])){
	header("location: ../index.php");
} 

require "../config.php";

$selected_id = -1;
$selected_category= "";
$selected_link = "";
$selected_picture="";


if(isset($_GET['cid']) && is_numeric($_GET['cid'])){
	$kategorije=$conn->query("select * from kategorije where KATEGORIJA_ID = {$_GET['cid']}");
	$kat=$kategorije->fetchAll(PDO::FETCH_ASSOC);
	foreach($kat as $kategorija){
	
		$selected_id = $kategorija['KATEGORIJA_ID'];
		$selected_category= $kategorija['NAZIV_KATEGORIJE'];
		$selected_link = $kategorija['link'];
		$selected_picture = $kategorija['slika'];
		
	}
		
 }
//*********************************************
if(isset($_POST['btn_insert'])){
	$selected_category = $_POST['tb_category'];
	$selected_link = $_POST['tb_link'];
		
	if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_picture = $_FILES['fup_image']['name'];
		} 
	
	$dodaj = $conn->prepare("INSERT INTO kategorije (naziv_kategorije,link,slika) VALUES (:naziv,:link,:slika)");
    $dodaj->bindParam(':naziv', $selected_category);
    $dodaj->bindParam(':link', $selected_link);
    $dodaj->bindParam(':slika', $selected_picture);

	if($dodaj->execute()){echo "Uspesno ste dodali kategoriju";}
}

//************************************************

if(isset($_POST['btn_update'])){
	$selected_category = $_POST['tb_category'];
	$selected_link = $_POST['tb_link'];
	$selected_id = $_POST['sel_category'];
	
	if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_picture = $_FILES['fup_image']['name'];
		} 

	$izmeni = $conn->prepare("update kategorije set naziv_kategorije=:kategorija,link=:link,slika=:slika where KATEGORIJA_ID=:kategorija_id");
    $izmeni->bindParam(':kategorija', $selected_category);
    $izmeni->bindParam(':link',$selected_link);
    $izmeni->bindParam(':slika', $selected_picture);
    $izmeni->bindParam(':kategorija_id', $selected_id);
 
if($izmeni->execute()){echo "Uspesno ste prepravili kategoriju";}
}

//**************************************************

if(isset($_POST['btn_delete'])){
	$selected_category = $_POST['tb_category'];
	$selected_link = $_POST['tb_link'];
	$selected_id = $_POST['sel_category'];
	
	if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_picture = $_FILES['fup_image']['name'];
		} 
	 	
	$obrisi = $conn->prepare("DELETE FROM kategorije WHERE kategorija_id = :id");
    $obrisi->bindParam(':id', $selected_id);
	
if($obrisi->execute()){echo "Uspesno ste obrisali kategoriju";}
}


//*******************************************
?>

<?php 
$kategorije=$conn->query("select * from kategorije ");	

?>

<form action="" method="POST" enctype="multipart/form-data" align="center"">

<select  onchange="window.location='?cid='+this.value" name="sel_category">
<option value="-1">Select category</option>

<?php 
while($kateg=$kategorije->fetch(PDO::FETCH_ASSOC)){
echo "<option " . ($selected_id==$kateg[KATEGORIJA_ID]?"selected":"") . " value='{$kateg[KATEGORIJA_ID]}'>{$kateg[NAZIV_KATEGORIJE]}</option>";}
?>

</select>
<br /><br />
KATEGORIJA:<br /><br />
<input type="text" name="tb_category" value="<?php echo $selected_category; ?>" />
<br /><br />
LINK: <br />
<input type="text" name="tb_link" value="<?php echo $selected_link; ?>" />
<br /> <br /> 

SLIKA: <br />
<img src="../slike/<?php echo $selected_picture; ?>" width="300" height="200" />
<input type="file" name="fup_image" />
 

<br /> <br /> 
<input type="submit" name="btn_insert" value="Add new" />
<input type="submit" name="btn_update" value="Update" />
<input type="submit" name="btn_delete" value="Delete" />
</form>

<a href="http://localhost/retro_gaming/"><img src="../slike/nazad.png"></a>