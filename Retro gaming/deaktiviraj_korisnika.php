<?php
include_once 'delovi/init.php';
if(!je_admin()) header ('Location: index.php');
if(isset($_GET['idd'])){
    $id = (int)$_GET['idd'];
     if(aktivacija($id, 0)){?>
        <img src='slike/x.png'>
		<p>Nalog korisnika je uspesno deaktiviran.</p>
    <?php }else{
        echo "Doslo je do greske prilikom deaktivacije korisnika. ";
    }
}
?><br />
<a href="http://localhost/vesti-root/admin/korisnici.php"><img src="slike/nazad.png"></a>
