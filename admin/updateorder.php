<?php
session_start();

include_once 'include/config.php';
if(strlen($_SESSION['alogin'])==0)
  { 
header('location:index.php');
}
else{
$oid=intval($_GET['oid']);
if(isset($_POST['submit2'])){
$status=$_POST['status'];
$delive = !empty($_POST['delive'])?$_POST['delive']:0;
$sql=mysqli_query($con,"UPDATE orders set orderStatus='$status' where idorder='$oid'");
if($delive !=0){
  $sql=mysqli_query($con,"UPDATE orders set orderdelive='$delive' where idorder='$oid'");

}
echo "<script>alert('Order updated sucessfully...');</script>";
//}
}

 ?>
<script language="javascript" type="text/javascript">
function f2()
{
window.close();
}ser
function f3()
{
window.print(); 
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Compliant</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="anuj.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
<link type="text/css" href="css/theme.css?v=<?php echo time(); ?>" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<!-- icon -->
<link rel="shortcut icon" href="Img/favicon.png">
</head>
<body id="body">
	<?php 
		include("../admin/include/sidebar.php");
		
	?>
<div style="margin-left:50px;">
<form name="updateticket" id="updateticket" method="post"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr height="50">
      <td colspan="2" class="fontkink2" style="padding-left:0px;"><div class="fontpink2"> <h2>Xử Lý Đơn Hàng</h2></div></td>
    </tr>
    <tr height="30">
      <td  class="fontkink1"><b>Mã Đơn Hàng:</b></td>
      <td  class="fontkink"><?php echo $oid;?></td>
    </tr>
    <?php 
      $ret = mysqli_query($con,"SELECT * FROM orders WHERE idorder='$oid'");
      while($row=mysqli_fetch_array($ret)){
    ?>
    <tr height="20">
      <td class="fontkink1" ><b>Thời gian đặt hàng:</b></td>
      <td  class="fontkink"><?php echo htmlentities(date("H:i d-m-Y",strtotime($row['orderDate'])));?></td>
    </tr>
    <?php
      $status=$row['orderStatus'];
      if($status == 2){
    ?>
    <tr height="20">
      <td class="fontkink1" ><b>Thời gian giao hàng:</b></td>
      <td  class="fontkink"><?php echo htmlentities(date("H:i d-m-Y",strtotime($row['orderdelive'])));?></td>
    </tr>
    <?php }?>
    <tr height="20">
      <td  class="fontkink1"><b>Trạng thái đơn hàng:</b></td>
      <td  class="fontkink"><?php $status=$row['orderStatus'];
                                  if($status ==0){
                                    echo "Chưa được xử lý";
                                  }else if($status == 1){
                                    echo "Đang được xử lý";
                                  }else if($status == 2){
                                    echo "Đã giao hàng";
                                  }
      ?></td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    <?php } ?>
    <?php 
      if($status==2){ 
    ?>
      <tr><td colspan="2"><b>Sản Phẩm Đã Được Giao </b></td>
    <?php }else  { ?>
    <tr height="50">
      <td class="fontkink1">Trạng Thái: </td>
      <td  class="fontkink"><span class="fontkink1" >
        <select name="status" class="fontkink" required="required" >
          <option value="">Chọn Trạng Thái</option>
          <option value="1">Đang Xử Lý</option>
          <option value="2">Đã Giao Hàng</option>
        </select></span></td>
    </tr>
      <?php
        if($status==1){
      ?>
      <tr id="giaohang">
      <td class="fontkink1" >Ngày Giao Hàng:</td>
      <td class="fontkink" align="justify" ><span class="fontkink">
        <input type="datetime-local" name="delive" id="delive">
        </span></td>
    </tr>
      <?php }?>
    <tr>
      <td class="fontkink1">&nbsp;</td>
      <td  >&nbsp;</td>
    </tr>
    <tr>
      <td class="fontkink"></td>
      <td  class="fontkink"> <input type="submit" name="submit2"  value="Cập Nhật"   size="40" style="cursor: pointer;" /> &nbsp;&nbsp;   
      <input name="Submit2" type="submit" class="txtbox4" value="Đóng Tab " onClick="return f2();" style="cursor: pointer;"  /></td>
    </tr>
<?php } ?>
</table>
 </form>
</div>
<script src="../admin/scripts/sidebar.js"></script>									
<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
</body>
</html>
<?php } ?>

     