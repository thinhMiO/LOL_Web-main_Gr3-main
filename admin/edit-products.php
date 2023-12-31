
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
	$pid=intval($_GET['id']);// product id
if(isset($_POST['submit']))
{
	$category=$_POST['category'];
	$subcat=$_POST['subcategory'];
	$productname=$_POST['productName'];

	$productprice=$_POST['productprice'];

	$productdescription=$_POST['productDescription'];
	$productavailability=$_POST['productAvailability'];
	
$sql=mysqli_query($con,"update  products set category='$category',subCategory='$subcat',productName='$productname',productPrice='$productprice',productDescription='$productdescription',productAvailability='$productavailability'where id='$pid' ");
$_SESSION['msg']="Sản Phẩm Đã Được Cập Nhật Thành Công !!";

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Sửa Sản Phẩm</title>
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
	<link type="text/css" href="css/theme.css?v=<?php echo time(); ?>" rel="stylesheet">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	

<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>

   <script>
function getSubcat(val) {
	$.ajax({
	type: "POST",
	url: "get_subcat.php",
	data:'cat_id='+val,
	success: function(data){
		$("#subcategory").html(data);
	}
	});
}
function selectCountry(val) {
$("#search-box").val(val);
$("#suggesstion-box").hide();
}
</script>	


</head>
<body id="body">
	<?php 
		include("../admin/include/sidebar.php");
		
	?>	<div class="wrapper">
		<div class="container">
			<div class="row">
			<div class="span9"style="width:970px;">
					<div class="content">

						<div class="module">
							<div class="module-head">
								<h3>Insert Product</h3>
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
									<strong>Ôi Không !!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

			<form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">

<?php 

$query=mysqli_query($con,"select products.*,category.categoryName as catname,category.id as cid,subcategory.subcategory as subcatname,subcategory.id as subcatid from products join category on category.id=products.category join subcategory on subcategory.id=products.subCategory where products.id='$pid' ");
$cnt=1;
while($row=mysqli_fetch_array($query))
{
  


?>


<div class="control-group">
<label class="control-label" for="basicinput">Thể Loại</label>
<div class="controls">
<select name="category" class="span8 tip" onChange="getSubcat(this.value);"  required>
<option value="<?php echo htmlentities($row['cid']);?>"><?php echo htmlentities($row['catname']);?></option> 
<?php $query=mysqli_query($con,"select * from category");
while($rw=mysqli_fetch_array($query))
{
	if($row['catname']==$rw['categoryName'])
	{
		continue;
	}
	else{
	?>

<option value="<?php echo $rw['id'];?>"><?php echo $rw['categoryName'];?></option>
<?php }} ?>
</select>
</div>
</div>

									
<div class="control-group">
<label class="control-label" for="basicinput">Loại Sản Phẩm</label>
<div class="controls">

<select   name="subcategory"  id="subcategory" class="span8 tip" required>
<option value="<?php echo htmlentities($row['subcatid']);?>"><?php echo htmlentities($row['subcatname']);?></option>
</select>
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Tên Sản Phẩm</label>
<div class="controls">
<input type="text"    name="productName"  placeholder="Enter Product Name" value="<?php echo htmlentities($row['productName']);?>" class="span8 tip" >
</div>
</div>






<div class="control-group">
<label class="control-label" for="basicinput">Giá Sản Phẩm</label>
<div class="controls">
<input type="text"    name="productprice"  placeholder="Enter Product Price" value="<?php echo htmlentities($row['productPrice']);?>" class="span8 tip" required>
</div>
</div>

<div class="control-group">
<label class="control-label" for="basicinput">Mô Tả Sản Phẩm</label>
<div class="controls">
<textarea  name="productDescription"  placeholder="Enter Product Description" rows="6" class="span8 tip">
<?php echo htmlentities($row['productDescription']);?>
</textarea>  
</div>
</div>



<div class="control-group">
<label class="control-label" for="basicinput">Trạng Thái Sản Phẩm</label>
<div class="controls">
<select   name="productAvailability"  id="productAvailability" class="span8 tip" required>
<option value="<?php echo htmlentities($row['productAvailability']);?>"><?php echo htmlentities($row['productAvailability']);?></option>
<option value="Còn Hàng">Còn Hàng</option>
<option value="Hết Hàng">Hết Hàng</option>
</select>
</div>
</div>



<div class="control-group">
<label class="control-label" for="basicinput">Ảnh Sản Phẩm Chính</label>
<div class="controls">
<img src="productimages/<?php echo htmlentities($row['productImage1']);?>" width="200" height="100"> <a href="update-image1.php?id=<?php echo $row['id'];?>">Thay Đổi Ảnh</a>
</div>
</div>


<div class="control-group">
<label class="control-label" for="basicinput">Ảnh Sản Phẩm</label>
<div class="controls">
<img src="productimages/<?php echo htmlentities($row['productImage2']);?>" width="200" height="100"> <a href="update-image2.php?id=<?php echo $row['id'];?>">Thay Đổi Ảnh</a>
</div>
</div>



<div class="control-group">
<label class="control-label" for="basicinput">Ảnh Sản Phẩm</label>
<div class="controls">
<img src="productimages/<?php echo htmlentities($row['productImage3']);?>" width="200" height="100"> <a href="update-image3.php?id=<?php echo $row['id'];?>">Thay Đổi Ảnh</a>
</div>
</div>
<?php } ?>
	<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn">Cập Nhật </button>
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