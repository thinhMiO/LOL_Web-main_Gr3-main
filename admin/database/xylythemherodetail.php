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
$chieu1 = UploadVideo("chieuq","../Uploads/videos");
$chieu2 = UploadVideo("chieuw","../Uploads/videos");
$chieu3 = UploadVideo("chieue","../Uploads/videos");
$chieu4 = UploadVideo("chieur","../Uploads/videos");
$combo = UploadAnh("combo","../Uploads/images");
$idh1 = $_REQUEST["idh1"];
$idh2 = $_REQUEST["idh2"];
$idh3 = $_REQUEST["idh3"];
$idh4 = $_REQUEST["idh4"];
//lấy mã phòng từ select
//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$ketqua = addHerodetail($id,$winrate,$pickrate,$banrate,$match,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$motaNT,$motaQ,$motaW,$motaE,$motaR,$combo,$idh1,$idh2,$idh3,$idh4);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../hero.php');
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>