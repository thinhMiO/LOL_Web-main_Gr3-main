<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );


?>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="../admin/css/css.css?v=<?php echo time(); ?>">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
	<title>Document</title>
</head>
<body id="body" >
	<?php
		include("../admin/include/sidebar.php");
        require_once("../admin/database/connectdb.php");
        require_once("../admin/database/function.php");
	?> 
    <h2>Thêm Bài Viết Mới</h2>
    <form action="../admin/database/xylythemPost.php" name="f1" id="formpost" method="post" enctype="multipart/form-data">
		<div style="posts" >
			<div>
				<div class="titles">
					<input type="text" name="title" id="title" placeholder="Thêm tiêu đề">
				</div>
				<div style="width: 80%;height: 150px;display:flex">
					<div style="width: 50%; height: 100%;">
						<textarea style="width: 100%; height: 100%;" name="motapost" id="motapost" cols="50" rows="5" placeholder="Mô tả bài viết..."></textarea>
					</div>
					<div style="width: 30%;height: 150px;margin-left: 50px;">
						<div>
							<label for="">Ảnh đại diện</label>
							<input style="width: 250px !important" type="file" name="anhdaidien" id="anhdaidien">
						</div>
						<div style="margin-top: 10px;" >
							<label for="">Ngày đăng</label>
							<input type="date" name="time" id="time">
						</div>
					</div>
					<div style="margin-top: 10px;" >
						<label>Trạng thái bài viết</label><br>
						<span>Hiển thị</span>
						<input type="radio" name="trangthai" id="r1" value="0" checked>
						&nbsp;
						<span>Ẩn</span>
						<input type="radio" name="trangthai" id="r2" value="1">
					</div>
				</div>
				
				<div class="content">
					<div style="width: 100%; height:50%;margin-top: 10px;" >
						<textarea class="ckeditor" name="content" id="content"></textarea>
					</div>
				</div>
			</div>
			<div style="display:flex;width: 80%; margin-top: 40px;justify-content: flex-end;">
				<input class="btn btn-primary" type="submit" name="b1" id="b1" value="Đăng Bài">
			</div>
		</div>
    </form>
	<script src="../admin/scripts/sidebar.js"></script>
	<script src="../admin/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../admin/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../admin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../admin/scripts/flot/jquery.flot.js" type="text/javascript"></script>
    <script src="../admin/scripts/datatables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
</body>
</html>
<?php } ?>