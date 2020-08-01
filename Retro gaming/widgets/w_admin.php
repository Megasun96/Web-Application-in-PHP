
<div class="widget">
                <h2>Administrator</h2>
                <div class="form">
                    <?php
                          $info_korisnika = info_korisnika($_SESSION['korisnik_id'], 'username', 'ime', 'prezime', 'email');
                    ?><br><br>
                    <b>Ime:</b>
                          <?php echo $info_korisnika['ime'] ?><br><br>
                  
                    
                         <b>Prezime:</b>
                        <?php echo $info_korisnika['prezime'] ?><br><br>
                  

                 
					<br><br>
					<button type="button" onclick="location.href='admin/korisnici.php';">Upravljanje korisnicima</button><br><br>
					<button type="button" onclick="location.href='admin/kategorije.php';">Upravljanje kategorijama</button><br><br>
					<button type="button" onclick="location.href='admin/vesti.php';">Dodavanje i uklanjanje vesti</button><br><br><br>
					<button type="button" onclick="location.href='logout.php';">Odjava</button>
                </div>
</div>