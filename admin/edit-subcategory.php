
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
	$subcat=$_POST['subcategory'];
	$id=intval($_GET['id']);
$sql=mysqli_query($con,"update subcategory set categoryid='$category',subcategory='$subcat',updationDate='$currentTime' where id='$id'");
$_SESSION['msg']="Loại Sản Phẩm Đã Được Cập Nhật !!";

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Sửa Loại Sản Phẩm</title>
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
	<link type="text/css" href="css/theme.css?v=<?php echo time(); ?>" rel="stylesheet">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	
</head>
<body id="body">
	<?php 
		include("../admin/include/sidebar.php");
		
	?>
	<div class="wrapper">
		<div class="container">
			<div class="row">
			<div class="span9"style="width:970px;">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Sửa Loại Sản Phẩm</h3>
							</div>
							<div class="module-body">

									<?php if(isset($_POST['submit']))
{?>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Chúc Mừng!</strong>	<?php echo htmlentities($_SESSION['msg']);?><?php echo htmlentities($_SESSION['msg']="");?>
									</div>
<?php } ?>


									<br />

			<form class="form-horizontal row-fluid" name="Category" method="post" >
<?php
$id=intval($_GET['id']);
$query=mysqli_query($con,"select category.id,category.categoryName,subcategory.subcategory from subcategory join category on category.id=subcategory.categoryid where subcategory.id='$id'");
while($row=mysqli_fetch_array($query))
{
?>		

<div class="control-group">
<label class="control-label" for="basicinput">Thể Loại</label>
<div class="controls">
<select name="category" class="span8 tip" required>
<option value="<?php echo htmlentities($row['id']);?>"><?php echo htmlentities($catname=$row['categoryName']);?></option>
<?php $ret=mysqli_query($con,"select * from category");
while($result=mysqli_fetch_array($ret))
{
echo $cat=$result['categoryName'];
if($catname==$cat)
{
	continue;
}
else{
?>
<option value="<?php echo $result['id'];?>"><?php echo $result['categoryName'];?></option>
<?php } }?>
</select>
</div>
</div>




<div class="control-group">
<label class="control-label" for="basicinput">Tên Loại Sản Phẩm</label>
<div class="controls">
<input type="text" placeholder="Enter category Name"  name="subcategory" value="<?php echo  htmlentities($row['subcategory']);?>" class="span8 tip" required>
</div>
</div>


									<?php } ?>	

	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">Cập Nhật</button>
											</div>
										</div>
									</form>
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
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>