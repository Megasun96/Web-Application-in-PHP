<?php

function info_korisnika($korisnik_id){
    global $conn;
    
    $arg_num = func_num_args();
    $arg_arr = func_get_args();
    $id = $korisnik_id;
    unset($arg_arr[0]);
    
    $col = implode(', ', $arg_arr);
    
    
    $upit = $conn->prepare("SELECT $col FROM korisnici WHERE korisnik_id = :id");
    $upit->bindParam(":id", $id);
    $upit->execute();
    if($upit->rowCount() == 1){
        return $upit->fetch(PDO::FETCH_ASSOC);
    }else{
        return false;
    }
}

function info_kategorije($kategorija_id){
    global $conn;
    
    $arg_num = func_num_args();
    $arg_arr = func_get_args();
    $id = $kategorija_id;
    unset($arg_arr[0]);
    
    $col = implode(', ', $arg_arr);
    
    
    $upit = $conn->prepare("SELECT $col FROM kategorije WHERE kategorija_id = :id");
    $upit->bindParam(":id", $id);
    $upit->execute();
    if($upit->rowCount() == 1){
        return $upit->fetch(PDO::FETCH_ASSOC);
    }else{
        return false;
    }
}

function komentari($kategorija_id){
    global $conn;
    $upit = $conn->prepare("SELECT komentari.KOMENTAR_ID,komentari.SADRZAJ_KOMENTARA, 
	komentari.VREME, korisnici.IME,korisnici.KORISNIK_ID,kategorije.link,kategorije.KATEGORIJA_ID from komentari 
	INNER JOIN korisnici on korisnici.KORISNIK_ID=komentari.ID_KORISNIKA 
	INNER JOIN kategorije on kategorije.KATEGORIJA_ID=komentari.ID_KATEGORIJE WHERE ID_KATEGORIJE=:c_id");
    $upit->bindParam(':c_id', $kategorija_id);
    $upit->execute();
    if($upit->rowCount() > 0){
        return $upit->fetchAll(PDO::FETCH_ASSOC);
    }else{
        return false;
    }
}
function linkovi($kategorija_id){
	global $conn;
    $upit = $conn->prepare("SELECT link from kategorije WHERE KATEGORIJA_ID=:c_id");
    $upit->bindParam(':c_id', $kategorija_id);
    $upit->execute();
    if($upit->rowCount() > 0){
        return $upit->fetchAll(PDO::FETCH_ASSOC);
    }else{
        return false;
    }
}
	


function ubaci_komentar($korisnik_id, $kategorija_id, $komentar1){
    global $conn;
    $upit = $conn->prepare('INSERT INTO komentari (ID_KORISNIKA, ID_KATEGORIJE, SADRZAJ_KOMENTARA) VALUES (:kor_id, :kat_id, :komentar)');
    $upit->bindParam(':kor_id', $korisnik_id);
    $upit->bindParam(':kat_id', $kategorija_id);
    $upit->bindParam(':komentar', $komentar1);
    if($upit->execute()){
        return true;
    }else{
        return false;
    }
}


function izbrisi_komentar($komentar_id){
    global $conn;
    $upit = $conn->prepare('DELETE FROM komentari WHERE KOMENTAR_ID = :id');
    $upit->bindParam(':id', $komentar_id);
    if($upit->execute()){
        return true;
    }else{
        return false;
    }
}

function izbrisi_korisnika($korisnik_id){
    global $conn;
    $upit = $conn->prepare('DELETE FROM korisnici WHERE KORISNIK_ID = :korisnik_id');
    $upit->bindParam(':korisnik_id', $korisnik_id);
    if($upit->execute()){
        return true;
    }else{
        return false;
    }
}

function je_admin(){
    if(isset($_SESSION['admin']) AND $_SESSION['admin'] == true){
        return true;
    }else{
        return false;
    }
}

function je_korisnik(){
    if(isset($_SESSION['korisnik']) AND $_SESSION['korisnik'] == true){
        return true;
    }else{
        return false;
    }
}
function je_neaktiviran(){
    if(isset($_SESSION['status']) && $_SESSION['status'] == 0){
        return true;
    }else{
        return false;
    }
}

function je_ulogovan(){
    if(isset($_SESSION['korisnik_id'])){
        return true;
    }else{
        return false;
    }
}

function username_postoji($username){
    global $conn;
    $upit = $conn->prepare('SELECT korisnik_id FROM korisnici WHERE username = :name');
    $upit->bindParam(':name', $username);
    $upit->execute();
    if($upit->rowCount() > 0){
        return true;
    }else{
        return false;
    }
}

function novi_korisnik($username, $password, $ime, $prezime, $email){
    global $conn;
    $md5Password = md5($password);
    $upit = $conn->prepare('INSERT INTO korisnici(username, password, ime, prezime, email) VALUES (?, ?, ?, ?, ?)');
    $upit->bindParam(1, $username);
    $upit->bindParam(2, $md5Password);
    $upit->bindParam(3, $ime);
    $upit->bindParam(4, $prezime);
    $upit->bindParam(5, $email);
    if($upit->execute()){
        return true;
    }else{
        return false;
    }
}
function email_postoji($email){
    global $conn;
    $upit = $conn->prepare('SELECT korisnik_id FROM korisnici WHERE email = :email');
    $upit->bindParam(':email', $email);
    $upit->execute();
    if($upit->rowCount() > 0){
        return true;
    }else{
        return false;
    }
}

function aktivacija($id,$status){
	global $conn;
	$upit=$conn->prepare('UPDATE korisnici SET status=:status WHERE korisnik_id=:id');
	$upit->bindParam(':status', $status);
    $upit->bindParam(':id', $id);
    if($upit->execute()){
        return true;
    }else{
        return false;
    }
	
}
function svi_korisnici(){
    global $conn;
    if($upit= $conn->query('SELECT * FROM korisnici')){
        return $upit->fetchAll(PDO::FETCH_ASSOC);
        }else{
        return false;
    }
}

function korisnik_postoji($username, $password){
    global $conn;
    $md5Password = md5($password);
    $upit = $conn->prepare('SELECT korisnik_id, username, ime, prezime, email, status FROM korisnici WHERE username = :name AND password = :pass');
    $upit->bindParam(':name', $username);
    $upit->bindParam(':pass', $md5Password);
    $upit->execute();
    if($upit->rowCount() == 1){
        $_SESSION['info_korisnika'] = $upit->fetch();
        return true;
    }else{
        return false;
    }
}
