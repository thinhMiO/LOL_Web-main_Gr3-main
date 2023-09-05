<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["id"])==false)
	die("<p>chưa có id bài viết</p>");
$id = $_REQUEST["id"];
if($id=="" || is_numeric($id)==false)
	die("<p>id không được rỗng và phải là số</p>");
	$conn = ConnectDB();
	if($conn == null){
		return null;
	}
	$sql = "DELETE from tbpost where idpost = $id";
	$pdo_stm = $conn->prepare($sql);
	$ketqua = $pdo_stm->execute();
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../post.php');
	}
else
	echo "<h3> LỖI Xóa DỮ LIỆU</h3>";
?>