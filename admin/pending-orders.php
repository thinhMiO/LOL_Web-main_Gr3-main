
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
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Pending Orders</title>
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time();?>">
    <link rel="stylesheet" href="../admin/css/css.css?v=<?php echo time(); ?>">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	
	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>
</head>
<body id="body" >
	<?php 
		include("../admin/include/sidebar.php");
	?>
	<h3>Đơn Hàng Đang Xử Lý</h3>
	<?php if(isset($_GET['del']))
	{?>
		<div class="alert alert-error">
			<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
		</div>
	<?php } ?>
	<br />
	<table class="table mytable" border="1" align="center"   cellspacing="0" >
			<thead>
				<tr>
					<th>#</th>
					<th> Tên</th>
					<th width="50">Email</th>
					<th>Số Điện Thoại</th>
					<th>Địa Chỉ</th>
					<th>Ngày Đặt</th>
					<th>Xử Lý</th>
				</tr>
			</thead>
		
			<tbody>
				<?php 
				$query=mysqli_query($con,"SELECT u.*,o.* from orders as o inner join users as u on o.userId = u.id where o.orderStatus =1  ORDER by o.orderDate DESC");
				$cnt=1;
				while($row=mysqli_fetch_array($query))
				{
				?>										
				<tr>
					<td><?php echo htmlentities($cnt);?></td>
					<td><?php echo htmlentities($row['name']);?></td>
					<td><?php echo htmlentities($row['email']);?></td>
					<td><?php echo htmlentities($row['contactno']);?></td>
					<td><?php echo htmlentities($row['shippingAddress'].",".$row['shippingCity'].",".$row['shippingState']."-".$row['shippingPincode']);?></td>
					<td><?php echo htmlentities(date("H:i d-m-Y",strtotime($row['orderDate'])));?></td>
					<td>    
						<a href="updateorder.php?oid=<?php echo htmlentities($row['idorder']);?>" title="Update order" target="_blank"><i class="icon-edit"></i></a>
						<a href="orderdetail.php?oid=<?php echo htmlentities($row['idorder']);?>" title="Update order" target="_blank"><i class="icon-file"></i></a>
					</td>
				</tr>
				<?php $cnt=$cnt+1; } ?>
			</tbody>
		</table>
	<script src="../admin/scripts/sidebar.js"></script>		
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			
            $('.mytable').dataTable();
		} );
        
	</script>
</body>
<?php } ?>