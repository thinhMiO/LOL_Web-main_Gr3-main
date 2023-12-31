
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


if(isset($_POST['submit']))
{
	$category=$_POST['category'];
$sql=mysqli_query($con,"insert into category(categoryName) values('$category')");
$_SESSION['msg']="Đã Thêm Được Thể Loại Mới !!";

}

if(isset($_GET['del']))
		  {
		          mysqli_query($con,"delete from category where id = '".$_GET['id']."'");
                  $_SESSION['delmsg']="Đã Xóa Thể!!";
		  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Category</title>
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time();?>">
    <!-- <link rel="stylesheet" href="../admin/css/css.css?v=<?php echo time(); ?>"> -->
	<link rel="stylesheet" href="../admin/css/theme.css?v=<?php echo time(); ?>">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	
</head>
<body id="body">
	<?php 
		include("../admin/include/sidebar.php");
		
	?>
	<div class="wrapper">
		<div class="container">
			<div class="row"  style="margin-left: -60px !important;">
			<div class="span9" style="width:970px;" >
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Thể Loại</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Chúc Mừng!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Ôi Không!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

			<form class="form-horizontal row-fluid" name="Category" method="post" >
									
<div class="control-group">
<label class="control-label" for="basicinput">Tên Thể Loại</label>
<div class="controls">
<input type="text" placeholder="Enter category Name"  name="category" class="span8 tip" required>
</div>
</div>



	<div class="control-group">
		<div class="controls">
			<button type="submit" name="submit" class="btn">Tạo Mới</button>
		</div>
	</div>
</form>
	</div>
</div>


	<div class="module">
							<div class="module-head">
								<h3>Quản Lý Thể Loại</h3>
							</div>
							<div class="module-body table">
								<table class="table mytable" border="1" align="center"   cellspacing="0">
									<thead>
										<tr>
											<th>#</th>
											<th>Tên Thể Loại</th>
											<th>Ngày Tạo</th>
											<th>Ngày Đã Sửa</th>
											<th>Tùy Chỉnh</th>
										</tr>
									</thead>
									<tbody>

							<?php $query=mysqli_query($con,"select * from category");
							$cnt=1;
							while($row=mysqli_fetch_array($query))
							{
							?>									
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($row['categoryName']);?></td>
											<td> <?php echo htmlentities($row['creationDate']);?></td>
											<td><?php echo htmlentities($row['updationDate']);?></td>
											<td>
											<a href="edit-category.php?id=<?php echo $row['id']?>" ><i class="icon-edit"></i></a>
											<a href="category.php?id=<?php echo $row['id']?>&del=delete" onClick="return confirm('Are you sure you want to delete?')"><i class="icon-remove-sign"></i></a></td>
										</tr>
										<?php $cnt=$cnt+1; } ?>
										
								</table>
							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

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