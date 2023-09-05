<?php
session_start();
error_reporting(0);
include('include/config.php');

if(isset($_POST['change']))
{
   $email=$_POST['email'];
    $contact=$_POST['contact'];
    $password=md5($_POST['password']);
$query=mysqli_query($con,"SELECT * FROM users WHERE email='$email' and contactno='$contact'");
$num=mysqli_fetch_array($query);
if($num>0)
{
$extra="login.php";
mysqli_query($con,"update users set password='$password' WHERE email='$email' and contactno='$contact' ");
$host=$_SERVER['HTTP_HOST'];
$uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
$_SESSION['errmsg']="Mật khẩu đã được thay đổi thành công";
exit();
}
else
{
$extra="forgot-password.php";
$host  = $_SERVER['HTTP_HOST'];
$uri  = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
$_SESSION['errmsg']="Email hoặc số điện thoại không hợp lệ";
exit();
}
}
?>

<!DOCTYPE html>
<html lang="vi">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Quên Mật Khẩu</title>

	    <!----------STYLESHEET---------->
  		<link rel="stylesheet" href="CSS_extra/login.css?v=<?php echo time(); ?>">
    
		<!---------ICON----------------->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	    <link rel="stylesheet"href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	    <!---------MONTSERATT----------->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="assets/css/font-awesome.min.css?v=<?php echo time(); ?>">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- icon -->
		<link rel="shortcut icon" href="Img/favicon.png">
		
		<script type="text/javascript">
			function valid()
			{
				if(document.register.password.value != document.register.confirmpassword.value)
				{
					alert("Mật khẩu và Mật khẩu xác nhận không khớp !!");
					document.register.confirmpassword.focus();
					return false;
				}
				return true;
			}
		</script>
	</head>
	
	<body>
		<div class="header">
			<div class="header__navbar" style="position: fixed;top: 0;left: 0;width: 100%;padding: 5px 70px;display: flex;align-items:center ;z-index: 20;background-color: transparent;">
				<div class="header__navbar__avatar">
					<a href="Home.php"><img style="max-height: 75px;border-radius:50%;" src="Img/Service _ Repair_edited1.jpg"></a>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<h1>Quên Mật Khẩu</h1>
			<form class="register-form outer-top-xs" name="register" method="post">
				<span style="color:green;">
					<?php
					echo htmlentities($_SESSION['errmsg']);
					?>
					<?php 
					echo htmlentities($_SESSION['errmsg'] = "");
					?>
				</span>
				<div class="input-box">
					<input type="email" name="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" required placeholder="Email">
					<span class="material-symbols-sharp">mail</span>
				</div>
				<div class="input-box">
					<input type="text" name="contact" class="form-control unicase-form-control text-input" id="contact" required placeholder="Số điện thoại">
				</div>
				<div class="input-box">
					<input type="password" class="form-control unicase-form-control text-input" id="password" name="password"  required placeholder="Mật khẩu">
					<span class="material-symbols-sharp">lock</span>
				</div>
				<div class="input-box">
					<input type="password" class="form-control unicase-form-control text-input" id="confirmpassword" name="confirmpassword" required placeholder="Nhập lại mật khẩu">
					<span class="material-symbols-sharp">lock</span>
				</div>
				<button type="submit" class="btn-upper btn btn-primary checkout-page-button" name="change">Thay Đổi</button>
			</form>
		</div>

		<script src="assets/js/jquery-1.11.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/echo.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/bootstrap-slider.min.js"></script>
	    <script src="assets/js/jquery.rateit.min.js"></script>
	    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
	    <script src="assets/js/bootstrap-select.min.js"></script>
	    <script src="assets/js/wow.min.js"></script>
			<script src="assets/js/scripts.js"></script>
	</body>
</html>
