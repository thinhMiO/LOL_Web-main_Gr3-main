<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
require_once("../database/upload.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["b1"])==FALSE)//nếu chưa submit form
 die("<h3> Chưa nhập form</h3>");
$id = $_REQUEST["idtuong"];
$winrate = $_REQUEST["winrate"];
$pickrate = $_REQUEST["pickrate"];
$banrate = $_REQUEST["banrate"];
$match = $_REQUEST["match"];
$motaNT = $_REQUEST["motaNT"];
$motaQ = $_REQUEST["motaQ"];
$motaW = $_REQUEST["motaW"];
$motaE = $_REQUEST["motaE"];
$motaR = $_REQUEST["motaR"];	
$noitai = UploadVideo("noitai","../Uploads/videos");
if($noitai == ""){
	$noitai = $_REQUEST["noitaicu"];
}
$chieu1 = UploadVideo("chieuq","../Uploads/videos");
if($chieu1 == ""){
	$chieu1 = $_REQUEST["Qcu"];
}
$chieu2 = UploadVideo("chieuw","../Uploads/videos");
if($chieu2 == ""){
	$chieu2 = $_REQUEST["Wcu"];
}
$chieu3 = UploadVideo("chieue","../Uploads/videos");
if($chieu3 == ""){
	$chieu3 = $_REQUEST["Ecu"];
}
$chieu4 = UploadVideo("chieur","../Uploads/videos");
if($chieu4 == ""){
	$chieu4 = $_REQUEST["Rcu"];
}
$combo = UploadAnh("combo","../Uploads/images");
if($combo == ""){
	$combo = $_REQUEST["combocu"];
}
$idcount1 = $_REQUEST["idcount1"];
$idcount2 = $_REQUEST["idcount2"];
$idcount3 = $_REQUEST["idcount3"];
$idcount4 = $_REQUEST["idcount4"];
$idh1 = $_REQUEST["idh1"];
$idh2 = $_REQUEST["idh2"];
$idh3 = $_REQUEST["idh3"];
$idh4 = $_REQUEST["idh4"];

//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$ketqua = updateherodetail($id,$winrate,$pickrate,$banrate,$match,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$motaNT,$motaQ,$motaW,$motaE,$motaR,$combo,$idcount1,$idcount2,$idcount3,$idcount4,$idh1,$idh2,$idh3,$idh4);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../updateherodetail.php?id='.$id);
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>