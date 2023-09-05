<?php
session_start();
error_reporting(0);
include('includes/config.php');
// Code cho đăng nhập người dùng
if(isset($_POST['login']))
{
   $email=$_POST['email'];
   $password=md5($_POST['password']);
   $query=mysqli_query($con,"SELECT * FROM users WHERE email='$email' and password='$password'");
   $num=mysqli_fetch_array($query);
   if($num>0)
   {
      $extra="index.php";
      $_SESSION['login']=$_POST['email'];
      $_SESSION['id']=$num['id'];
      $_SESSION['username']=$num['name'];
      $uip=$_SERVER['REMOTE_ADDR'];
      $status=1;
      $log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('".$_SESSION['login']."','$uip','$status')");
      $host=$_SERVER['HTTP_HOST'];
      $uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
      header("location:http://$host$uri/$extra");
      exit();
   }
   else
   {
      $extra="login1.php";
      $email=$_POST['email'];
      $uip=$_SERVER['REMOTE_ADDR'];
      $status=0;
      $log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
      $host  = $_SERVER['HTTP_HOST'];
      $uri  = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
      header("location:http://$host$uri/$extra");
      $_SESSION['errmsg']="Sai email hoặc mật khẩu";
      exit();
   }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <!----------STYLESHEET---------->
    <link rel="stylesheet" href="../CSS_extra/login.css?v=<?php echo time(); ?>">
    <!---------ICON----------------->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!---------MONTSERATT----------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css?v=<?php echo time(); ?>">
    <!-- Fonts --> 
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
    <!-- icon -->
    <link rel="shortcut icon" href="../Img/favicon.png">
    <script type="text/javascript">
        function valid()
        {
            if(document.register.password.value!= document.register.confirmpassword.value)
            {
                alert("Mật khẩu và Xác nhận mật khẩu không khớp!!");
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
                url: "check_availability.php",
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
<body>
    <div class="header" >
        <div class="header__navbar" style="  position: fixed;top: 0;left: 0;width: 100%;padding: 5px 70px;display: flex;align-items:center ;z-index: 20;background-color: transparent;">
            <div class="header__navbar__avatar" >
                <a href="index.php"><img  style=" max-height: 75px;border-radius:50%;" src="../Img/Service _ Repair_edited1.jpg" ></a>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <form class="register-form outer-top-xs" method="post">
            <h1>Đăng nhập</h1>
            <span style="color:red; margin-left:20px;">
            <?php
                echo htmlentities($_SESSION['errmsg']);
            ?>
            <?php
                echo htmlentities($_SESSION['errmsg']="");
            ?></span>
            <div class="input-box">
                <input type="email" name="email" placeholder="Tên tài khoản"  id="exampleInputEmail1" >
                <span class="material-symbols-sharp">account_circle</span>
            </div>
            <div class="input-box">
                <input type="password" name="password" placeholder="Mật khẩu"  id="exampleInputPassword1" >
                <span class="material-symbols-sharp">lock</span>
            </div>
            <div class="remember-forgot">
                <a href="forgot-password1.php">Quên mật khẩu?</a>
            </div>
            <button type="submit" class="btn" name="login">Đăng Nhập</button>
            <div class="register-link">
                <p>Chưa có tài khoản? <a href="register1.php">Đăng ký</a></p>
            </div>
        </form>    
    </div>
    <!-- For demo purposes – can be removed on production -->
    <script src="switchstylesheet/switchstylesheet.js"></script>      
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
