<?php
require_once("../database/connectdb.php");
require_once("../database/function.php");
require_once("../database/upload.php");
//lấy dữ liệu từ form
if(isset($_REQUEST["b1"])==FALSE)//nếu chưa submit form
 die("<h3> Chưa nhập form</h3>");
 $id = $_REQUEST["idpost"];
$title = $_REQUEST["title"];
$anh = UploadAnh("anhdaidien","../Uploads/images-Post");
if($anh == ""){
	$anh = $_REQUEST["anhDDcu"];
}
$slug = to_slug($_REQUEST["title"]);
$content = $_REQUEST["content"];
$mota = $_REQUEST["motapost"];
$time = $_REQUEST["time"];
$status="";
if(isset($_REQUEST["trangthai"])==TRUE)
	$status = $_REQUEST["trangthai"];
//THỰC HIỆN CÂU LỆNH INSERT,UPDATE, DELETE
$conn = ConnectDB();
if($conn == null){
	return null;
}
$sql = "UPDATE tbpost 
					Set title = '$title',anhmota = '$anh',slug = '$slug',content = '$content', descpost = '$mota', time = '$time',status = '$status' WHERE idpost = $id ";
$pdo_stm = $conn->prepare($sql);
$ketqua = $pdo_stm->execute();
// $ketqua = addPost($id,$title,$anh,$slug,$content,$mota,$time,$status);
if($ketqua==TRUE)
	{
		sleep(2);
		header('location:../updatePost.php?id='.$id);
		echo "<h3> thành công</h3>";
	}
else
	echo "<h3> LỖI THÊM DỮ LIỆU</h3>";
?>