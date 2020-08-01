<?php include_once "delovi/init.php";?>
<aside>

<?php

if(isset($_GET['izbrisi_komentar']) AND je_admin()){
    $komentar_id = (int)$_GET['izbrisi_komentar'];
	if(!izbrisi_komentar($komentar_id)) die('Greška pri brisanju komentara.');}


if(isset($_POST['btn_posalji'])){
	if(isset($_POST['komentar1']) AND isset($_GET['cid']) AND isset($_GET['korisnik_id'])){
		$korisnik_id= $_GET['korisnik_id'];
		$kategorija_id= $_GET['cid'];
		$komentar1 = htmlentities($_POST['komentar1'], ENT_QUOTES); 
		
			
	if(!ubaci_komentar($korisnik_id, $kategorija_id, $komentar1)){echo "Greska pri unosu komentara";}
		
	}
	else{ echo "<b>Greška pri unosu komentara u bazu.</b>";}
}
?>	
	
<?php
if((isset($_SESSION['admin'])) OR (isset($_SESSION['korisnik']))) {?>

	<?php 
	if(isset($_GET['cid'])){
		
		$kategorija_id = (int)$_GET['cid'];
		$komentari = komentari($kategorija_id);
		$brojac=0;
		if($komentari){
			$limit = 0;
			$brojac =1;
			?>
			<h3>Komentari o clanku</h3>
			<?php
			foreach ($komentari as $komentar){
				
                 $limit++;
				?>
					<h4><?php echo $komentar['IME'] ?></h4>
					<small><?php echo $komentar['VREME'] ?></small>
					<p><?php echo $komentar['SADRZAJ_KOMENTARA'] ?></p>
					
				<?php  if (je_admin()) {?>
				   <a href="<?php echo $komentar['link'] ?>?cid=<?php echo $kategorija_id ?>&izbrisi_komentar=<?php echo $komentar['KOMENTAR_ID'] ?>" style="color:red;">Izbrisi komentar</a>
				<?php }?>
				<hr>
				
				<?php if (($limit==max(array_keys($komentari))+1) OR ($brojac==0)) {?>
				
				<form action="<?php echo $komentar['link'] ?>?cid=<?php echo $kategorija_id ?>&korisnik_id=<?php echo $_SESSION['korisnik_id'] ?>" method="POST">
				<textarea rows="7" cols="38" name="komentar1" value="<?php echo $_SESSION['korisnik_id'];?>" placeholder="Mozete upisati komentar"></textarea>
				<br /> <br />
				<input type="submit" name="btn_posalji" value="Posalji" />

				</form>
				<?php }?>
			
				<?php
				
			}
			}else if ($brojac==0){
					
				$koment=linkovi($_GET['cid']);
				if($koment){
				foreach ($koment as $kom){?>
				<form action="<?php echo $kom['link'] ?>?cid=<?php echo $kategorija_id ?>&korisnik_id=<?php echo $_SESSION['korisnik_id'] ?>" method="POST">
				<textarea rows="7" cols="38" name="komentar1" value="<?php echo $_SESSION['korisnik_id'];?>" placeholder="Mozete upisati komentar"></textarea>
				<br /> <br />
				<input type="submit" name="btn_posalji" value="Posalji" />

				</form>
				<?php } 
				
				} 
				
			} else {echo "Greska sa komentarima";}?>
		
<?php	}

	?>


			
<?php  }?>


</aside>


