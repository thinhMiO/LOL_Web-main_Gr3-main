
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

if(isset($_GET['del']))
		  {
		          mysqli_query($con,"delete from products where id = '".$_GET['id']."'");
                  $_SESSION['delmsg']="Product deleted !!";
		  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Manage Products</title>
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
	<link type="text/css" href="css/css.css?v=<?php echo time(); ?>" rel="stylesheet">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	
</head>
<body id="body">
	<?php 
		include("../admin/include/sidebar.php");
		
	?>


		<h2>Quản Lý Sản Phẩm</h2>
		<?php if(isset($_GET['del']))
		{?>
			<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
			</div>
		<?php } ?>
		<br />
		<table class="table mytable" border="1" align="center"   cellspacing="0">
			<thead>
				<tr>
					<th>Id</th>
					<th>Tên Sản Phẩm</th>
					<th>Thể Loại </th>
					<th>Loại Sản Phẩm</th>
			
					<th>Ngày Tạo Sản Phẩm</th>
					<th>Tùy Chỉnh</th>
				</tr>
			</thead>
			<tbody>

				<?php $query=mysqli_query($con,"select products.*,category.categoryName,subcategory.subcategory from products join category on category.id=products.category join subcategory on subcategory.id=products.subCategory order by products.postingDate desc ");
				$cnt=1;
				while($row=mysqli_fetch_array($query))
				{
				?>									
				<tr>
					<td><?php echo htmlentities($cnt);?></td>
					<td><?php echo htmlentities($row['productName']);?></td>
					<td><?php echo htmlentities($row['categoryName']);?></td>
					<td> <?php echo htmlentities($row['subcategory']);?></td>
					
					<td><?php echo htmlentities($row['postingDate']);?></td>
					<td>
					<a href="edit-products.php?id=<?php echo $row['id']?>" ><i class="icon-edit"></i></a>
					<a href="manage-products.php?id=<?php echo $row['id']?>&del=delete" onClick="return confirm('Are you sure you want to delete?')"><i class="icon-remove-sign"></i></a></td>
				</tr>
				<?php $cnt=$cnt+1; } ?>
				
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