<?php
session_start();
error_reporting(0);
include('include/config.php');
// Xử lý đăng ký người dùng
if(isset($_POST['submit']))
{
    $name=$_POST['fullname'];
    $email=$_POST['emailid'];
    $contactno=$_POST['contactno'];
    $password=md5($_POST['password']);
    $query=mysqli_query($con,"insert into users(name,email,contactno,password) values('$name','$email','$contactno','$password')");
    if($query)
    {
        
        sleep(2);
        header("location: login.php");
        echo "<script>alert('Chúc mừng bạn đã đăng kí tài khoản thành công');</script>";
    }
    else
    {
        echo "<script>alert('Bạn chưa đăng nhập, có lỗi gì đó đang xảy ra');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">
        <link rel="stylesheet" href="CSS_extra/login.css?v=<?php echo time(); ?>">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
        <title>Đăng ký</title>
        <link rel="stylesheet" href="assets/css/font-awesome.min.css?v=<?php echo time(); ?>">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link rel="shortcut icon" href="/Img/favicon.png">
        <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
        <script type="text/javascript">
            function valid()
            {
                if(document.register.password.value != document.register.confirmpassword.value)
                {
                    alert("Mật khẩu và Xác nhận mật khẩu không khớp !!");
                    document.register.confirmpassword.focus();
                    return false;
                }
                return true;
            }
        </script>
        <script>
            function userAvailability() {
                $("#loaderIcon").show();
                jQuery.ajax({
                    url: "checkEmail.php",
                    data:'email='+$("#email").val(),
                    type: "POST",
                    success:function(data){
                        $("#user-availability-status1").html(data);
                        $("#loaderIcon").hide();
                    },
                    error:function (){}
                });
            }
        </script>
    </head>
    <body >
        <div class="header">
            <div class="header__navbar" style="position: fixed;top: 0;left: 0;width: 100%;padding: 5px 70px;display: flex;align-items:center ;z-index: 20;background-color: transparent;">
                <div class="header__navbar__avatar" >
                    <a href="Home.php"><img style="max-height: 75px;border-radius:50%;" src="Img/Service _ Repair_edited1.jpg" ></a>
                </div>
            </div>
        </div>
        <div class="wrapper">
            <h1>Đăng ký</h1>
            <form class="register-form outer-top-xs" role="form" method="post" name="register" onSubmit="return valid();">
                <div class="input-box">
                    <input type="text" id="fullname" name="fullname" placeholder="Họ và tên" required="required">
                    <span class="material-symbols-sharp">account_circle</span>
                </div>
                <div class="input-box">
                    <input type="email" id="email" onBlur="userAvailability()" name="emailid" placeholder="Email">
                    <span class="material-symbols-sharp">mail</span>
                    <p id="user-availability-status1" style="font-size:12px;"></p>
                </div>
                <div class="input-box">
                    <input type="text" id="contactno" name="contactno" placeholder="Số điện thoại" maxlength="10" required >
                </div>
                <div class="input-box">
                    <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
                    <span class="material-symbols-sharp">lock</span>
                </div>
                <div class="input-box">
                    <input type="password" id="confirmpassword" placeholder="Xác nhận mật khẩu" name="confirmpassword" required>
                    <span class="material-symbols-sharp">lock</span>
                </div>
                <button type="submit" name="submit" class="btn-upper btn btn-primary checkout-page-button" id="submit">Đăng ký</button>
               
            </form>
        </div>

        <!-- For demo purposes – can be removed on production -->
        <script src="switchstylesheet/switchstylesheet.js"></script>
        <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".changecolor").switchstylesheet( { seperator:"color"} );
                $('.show-theme-options').click(function(){
                    $(this).parent().toggleClass('open');
                    return false;
                });
            });

            $(window).bind("load", function() {
                $('.show-theme-options').delay(2000).trigger('click');
            });
        </script>
        <!-- For demo purposes – can be removed on production : End -->
    </body>
</html>
