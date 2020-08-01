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


//**********************************

$selected_id = -1;
$selected_title="";
$selected_description = "";
$selected_image="";
$selected_category=0;


if(isset($_GET['vid']) && is_numeric($_GET['vid'])){
	$news=$conn->query("select * from vesti where VEST_ID = {$_GET['vid']}");
	$vesti=$news->fetchAll(PDO::FETCH_ASSOC);
	foreach($vesti as $vest){

		$selected_id = $vest['VEST_ID'];
		$selected_title= $vest['NASLOV_VESTI'];
		$selected_description = $vest['SADRZAJ_VESTI'];
		$selected_image = $vest['slike'];
		$selected_category= $vest['ID_KATEGORIJE'];
	
	}
		
} 

//**********************************************
if(isset($_POST['btn_insert'])){
	$selected_title = $_POST['tb_title'];
	$selected_description = $_POST['tb_description'];
	
	if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_image = $_FILES['fup_image']['name'];
		} 
	
	$selected_category=$_POST['sel_category'];
	
$dodaj = $conn->prepare("INSERT INTO vesti (naslov_vesti,sadrzaj_vesti,slike,id_kategorije) VALUES (:naslov, :sadrzaj, :slike, :id_kategorije)");
    $dodaj->bindParam(':naslov', $selected_title);
    $dodaj->bindParam(':sadrzaj', $selected_description);
    $dodaj->bindParam(':slike', $selected_image);
	$dodaj->bindParam(':id_kategorije',$selected_category);
       
    if($dodaj->execute()){echo "Uspesno ste dodali vest";}

}
//********************************************
if(isset($_POST['btn_update'])){
	$selected_title = $_POST['tb_title'];
	$selected_description = $_POST['tb_description'];
		if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_image = $_FILES['fup_image']['name'];
		} 
	$selected_category=$_POST['sel_category'];
	
	$izmeni = $conn->prepare("update vesti set NASLOV_VESTI=:naslov, SADRZAJ_VESTI=:sadrzaj, slike=:slike, ID_KATEGORIJE=:id_kategorije where VEST_ID=:vest_id");
    $izmeni->bindParam(':naslov', $selected_title);
    $izmeni->bindParam(':sadrzaj',$selected_description);
    $izmeni->bindParam(':slike', $selected_image);
    $izmeni->bindParam(':id_kategorije', $selected_category);
    $izmeni->bindParam(':vest_id', $selected_id);
      
    if($izmeni->execute()){echo "Uspesno ste prepravili vest";}
}	

//*******************************************************	
if(isset($_POST['btn_delete'])){
	$selected_title = $_POST['tb_title'];
	$selected_description = $_POST['tb_description'];
		if(isset($_FILES['fup_image'])){
			move_uploaded_file($_FILES['fup_image']['tmp_name'],"../slike/".$_FILES['fup_image']['name']);
			$selected_image = $_FILES['fup_image']['name'];
		} 
	$selected_category=$_POST['sel_category'];
	
	$obrisi = $conn->prepare("DELETE FROM vesti WHERE vest_id = :vest_id");
    $obrisi->bindParam(':vest_id', $selected_id);
	
	if($obrisi->execute()){echo "Uspesno ste obrisali vest";}
}
//*******************************************************	
?>

<form action="" method="post" enctype="multipart/form-data" align="center">
VEST: <br />
<select onchange="window.location='?vid='+this.value" name="sel_vest">
<option value="-1">Selektuj vest</option>
<?php

$selektuj=$conn->query("select * from vesti");


	while($selektovano=$selektuj->fetch(PDO::FETCH_ASSOC)){ 
		echo "<option " . ($selected_id==$selektovano[VEST_ID]?"selected":"") . " value='{$selektovano[VEST_ID]}'>{$selektovano[NASLOV_VESTI]}</option>";	
	}	
	

?>
</select>
<br/><br/>

KATEGORIJA: <br />

<select  name="sel_category">
<option value="-1">Selektuj kategoriju</option>

<?php
$selektujK=$conn->query("select * from kategorije");

	while($selektovanoK=$selektujK->fetch(PDO::FETCH_ASSOC)){ 
		echo "<option " . ($selected_category==$selektovanoK[KATEGORIJA_ID]?"selected":"") . " value='{$selektovanoK[KATEGORIJA_ID]}'>{$selektovanoK[NAZIV_KATEGORIJE]}</option>";}
		
?>
</select>

<br /><br />
NASLOV VESTI:<br />
<input type="text" name="tb_title" value="<?php echo $selected_title; ?>" />
<br /><br />
OPIS: <br />
<textarea rows="12" cols="60" name="tb_description" value="<?php echo $selected_description;?>" placeholder="Mozete upisati vest"></textarea>
<br /> <br /> 

SLIKA: <br />
<img src="../slike/<?php echo $selected_image; ?>" width="150" height="100" />
<input type="file" name="fup_image" />
<br />
<br />  



<br /> <br /> 
<input type="submit" name="btn_insert" value="Add new" />
<input type="submit" name="btn_update" value="Update" />
<input type="submit" name="btn_delete" value="Delete" />
</form>

<a href="http://localhost/retro_gaming/"><img src="../slike/nazad.png"></a>
