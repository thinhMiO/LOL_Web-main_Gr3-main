<?php
session_start();
error_reporting(0);
include('include/config.php');

if(isset($_POST['submit']))
{
    $username=$_POST['username'];
    $password = md5($_POST['password']);

    $query = mysqli_query($con,"INSERT INTO admin (username, password) VALUES ('$username', '$password')");
    
    if($query)
    {
        sleep(2);
        header("location: index.php");
        echo "<script>alert('Chúc mừng bạn đã đăng ký tài khoản quản trị viên thành công');</script>";
    }
    else
    {
        echo "<script>alert('Đã xảy ra lỗi khi đăng ký, vui lòng thử lại sau');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Các thẻ meta và liên kết đến các tệp CSS và JS -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Shopping Portal | Admin login</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css?v=<?php echo time(); ?>" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	>
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>

	
        <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
</head>
<body>
    <!-- ... Mã HTML giao diện ... -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="manage-users.php">
			  		 Admin
			  	</a>
				<!-- /.nav-collapse -->
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->


    <div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="module module-login span4 offset4">
					<form class="form-vertical" method="post">
						<div class="module-head">
							<h3>Đăng ký quản trị viên</h3>
						</div>
						<div class="module-body">
							<div class="control-group">
								<div class="controls row-fluid">
									<input class="span12" type="text" id="inputEmail" name="username" placeholder="Username">
								</div>
							</div>
							<div class="control-group">
								<div class="controls row-fluid">
						<input class="span12" type="password" id="inputPassword" name="password" placeholder="Mật Khẩu">
								</div>
							</div>
						</div>
						<div class="module-foot">
							<div class="control-group">
								<div class="controls clearfix">
									<button type="submit" class="btn btn-primary pull-right" name="submit">Đăng ký</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
    <!-- ... Các thẻ script và mã JavaScript ... -->
	<div class="footer">
		<div class="container">
		<h3>Handcrafted with <i class="fa fa-heart" style="color: red;"></i> by gamers for gamers </h3>
                <h5>Copyright <i class="fa fa-copyright"></i> 2023 . Gamers net, Inc</h5>
		</div>
	</div>
</body>
</html>
