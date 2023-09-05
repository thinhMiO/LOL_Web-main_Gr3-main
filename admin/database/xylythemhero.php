<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
require_once("../database/upload.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["b1"])==FALSE)//nếu chưa submit form
 die("<h3> Chưa nhập form</h3>");
$name = $_REQUEST["name"];
$idrole = $_REQUEST["marole"];
$idtier = $_REQUEST["matier"];
$hard = $_REQUEST["dokho"];
$anh = UploadAnh("anhtuong","../Uploads/images");
$noitai = UploadAnh("noitai","../Uploads/images");
$chieu1 = UploadAnh("chieuq","../Uploads/images");
$chieu2 = UploadAnh("chieuw","../Uploads/images");
$chieu3 = UploadAnh("chieue","../Uploads/images");
$chieu4 = UploadAnh("chieur","../Uploads/images");
$upskill = UploadAnh("upskill","../Uploads/images");
$bangngoc = UploadAnh("bangngoc","../Uploads/images");
$trangbi = UploadAnh("trangbi","../Uploads/images");
//lấy mã phòng từ select
//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$ketqua = addHero($name,$idrole,$idtier,$anh,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$upskill,$hard,$bangngoc,$trangbi);
if($ketqua==TRUE)
	{	
		sleep(2);
		header('location:../addherodetail.php?id='.$ketqua);
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>