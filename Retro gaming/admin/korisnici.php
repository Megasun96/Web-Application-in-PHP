<?Php
session_start();

require_once '../config.php';
include '../funkcije/funkcije.php';

if(isset($_SESSION['korisnik_id'])){
    $status = info_korisnika($_SESSION['korisnik_id'], 'status');
    if($status['status']==0 ){
      header('Location: logout.php');}
        
;}

if(!isset($_SESSION['admin'])){
	header("location: ../index.php");
} 

?><div align="center">
<h1>Upravljanje korisnicima</h1>
      
      <?php
        $korisnici = svi_korisnici();
        if($korisnici){
            ?>
            <table class="admin_table">
                <tr>
                    <th>Ime</th>
                    <th>Prezime</th>
					 <th>EMAIL</th>
                </tr>
            <?php
            foreach($korisnici as $korisnik){
                ?>
                <tr>
                    <td><?php echo $korisnik['IME'] ?></td>
                    <td><?php echo $korisnik['PREZIME'] ?></td>
					 <td><?php echo $korisnik['EMAIL'] ?></td>
					   
					    <?php
                        if($korisnik['STATUS'] == 0){
                            ?>
                                <td><a href="../aktiviraj_korisnika.php?id=<?php echo $korisnik['KORISNIK_ID'] ?>"><img src="../slike/ok.png"></a></td>
								<?php if(isset($_GET['id'])){include "../aktiviraj_korisnika.php";}?>
                            <?php
                        }else{
                            ?>
                                <td><a href="../deaktiviraj_korisnika.php?idd=<?php echo $korisnik['KORISNIK_ID'] ?>"><img src="../slike/x.png"></a></td>
                            <?php
                        }
                    ?>
                    <td><a href="../izbrisi_korisnika.php?idk=<?php echo $korisnik['KORISNIK_ID'] ?>"><img src="../slike/kanta.png"></a></td>

                </tr>
                
                <?php
            }
             ?>
            </table>
            <?php
        }
      ?>
    


</div>
<a href="http://localhost/retro_gaming/"><img src="../slike/nazad.png"></a>
