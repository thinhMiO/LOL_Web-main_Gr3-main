<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
require_once("../database/upload.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["b1"])==FALSE)//nếu chưa submit form
 die("<h3> Chưa nhập form</h3>");
$title = $_REQUEST["title"];
$anh = UploadAnh("anhdaidien","../Uploads/images-Post");
$slug = to_slug($_REQUEST["title"]);
$content = $_REQUEST["content"];
$mota = $_REQUEST["motapost"];
$time = $_REQUEST["time"];
$status="";
if(isset($_REQUEST["trangthai"])==TRUE)
	$status = $_REQUEST["trangthai"];
//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$ketqua = addPost($title,$anh,$slug,$content,$mota,$time,$status);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../Post.php');
		// echo "<h3> thành công</h3>";
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>