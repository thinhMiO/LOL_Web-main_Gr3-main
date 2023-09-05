<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["id"])==false)
	die("<p>chưa có id tướng</p>");
$id = $_REQUEST["id"];
if($id=="" || is_numeric($id)==false)
	die("<p>id không được rỗng và phải là số</p>");
$ketqua = deletehero($id);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../hero.php');
	}
else
	echo "<h3> LỖI Xóa DỮ LIỆU</h3>";
?>
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