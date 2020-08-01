
<aside class="main">	<img class="joystick" src="slike/joystic.jpg" width="168" height="168"  alt="x"/>
	
<?php  
if(isset($_SESSION[`korisnik`]) && je_korisnik()){include "widgets/w_korisnik.php";}

  else if(isset($_SESSION[`admin`])&& je_admin()){include "widgets/w_admin.php";}

	 else {?>	
		
	<form id="form2" name="form2" method="post" action="index.php">
	<h3>Pridruži nam se</h3>
	  <br>
	  <input type="submit" name="register" id="submit" value="Pridruži se">
	  <br><br>
	</form>


	<form id="form1" name="form1" method="post" action="login.php">

	<h3>Uloguj se</h3>

	<label for="username" ></label>
	  <input type="text"  class="ne" name="username1" onkeyup="validacija1(this)" id="username1" placeholder="Unesite korisnicko ime" /><p id="LUsername"></p>
	  <br /><br />
	<label for="password" ></label>
	  <input type="password" class="ne" name="password1" onkeyup="validacija1(this)" id="password1" placeholder="Unesite sifru" /><p id="LPassword"></p>
	  <br><br>
	  <input type="submit" id="buttonId1"  value="Uloguj se"/>



	  
	</form>

	<?php } ?>


                    

</aside> <div class="form">