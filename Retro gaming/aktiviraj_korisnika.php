<?php
include_once 'delovi/init.php';
if(!je_admin()) header ('Location: index.php');
if(isset($_GET['id'])){
    $id = (int)$_GET['id'];
    if(aktivacija($id, 1)){ ?>
        <img src='slike/ok.png'>
		<p>Nalog korisnika je uspesno aktiviran.</p>
    <?php }else{
        echo "Doslo je do greske prilikom aktivacije korisnika. ";
    }
}
?><br />
<a href="http://localhost/retro_gaming/admin/korisnici.php"><img src="slike/nazad.png"></a>