<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
require_once("../database/upload.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["b1"])==FALSE)//nếu chưa submit form
 die("<h3> Chưa nhập form</h3>");
$id = $_REQUEST["idtuong"];
$name = $_REQUEST["name"];
$idrole = $_REQUEST["marole"];
$idtier = $_REQUEST["matier"];
$hard = $_REQUEST["dokho"];
$anh = UploadAnh("anhtuong","../Uploads/images");
if($anh == ""){
	$anh = $_REQUEST["anhtuongcu"];
}
$noitai = UploadAnh("noitai","../Uploads/images");
if($noitai == ""){
	$noitai = $_REQUEST["noitaicu"];
}
$chieu1 = UploadAnh("chieuq","../Uploads/images");
if($chieu1 == ""){
	$chieu1 = $_REQUEST["chieuqcu"];
}
$chieu2 = UploadAnh("chieuw","../Uploads/images");
if($chieu2 == ""){
	$chieu2 = $_REQUEST["chieuwcu"];
}
$chieu3 = UploadAnh("chieue","../Uploads/images");
if($chieu3 == ""){
	$chieu3 = $_REQUEST["chieuecu"];
}
$chieu4 = UploadAnh("chieur","../Uploads/images");
if($chieu4 == ""){
	$chieu4 = $_REQUEST["chieurcu"];
}
$upskill = UploadAnh("upskill","../Uploads/images");
if($upskill == ""){
	$upskill = $_REQUEST["upskillcu"];
}
$bangngoc = UploadAnh("bangngoc","../Uploads/images");
if($bangngoc == ""){
	$bangngoc = $_REQUEST["bangngoccu"];
}
$trangbi = UploadAnh("trangbi","../Uploads/images");
if($trangbi == ""){
	$trangbi = $_REQUEST["trangbicu"];
}
//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$ketqua = updatehero($id,$name,$idrole,$idtier,$anh,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$upskill,$hard,$bangngoc,$trangbi);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../hero.php');
		// echo "<h3> thành công</h3>";
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>