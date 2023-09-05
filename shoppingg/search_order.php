<?php 
session_start();
error_reporting(0);
include('includes/config.php');
require_once('includes/Ketnoi.php');
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Order History</title>
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css?v=<?php echo time(); ?>">
	    <link rel="stylesheet" href="assets/css/main.css?v=<?php echo time(); ?>">
	    <link rel="stylesheet" href="assets/css/green.css?v=<?php echo time(); ?>">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css?v=<?php echo time(); ?>">
		<link rel="stylesheet" href="assets/css/owl.transitions.css?v=<?php echo time(); ?>">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css?v=<?php echo time(); ?>" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css?v=<?php echo time(); ?>">
		<link rel="stylesheet" href="assets/css/rateit.css?v=<?php echo time(); ?>">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css?v=<?php echo time(); ?>">

		<!-- Demo Purpose Only. Should be removed in production -->
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css?v=<?php echo time(); ?>" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css?v=<?php echo time(); ?>" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css?v=<?php echo time(); ?>" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css?v=<?php echo time(); ?>" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css?v=<?php echo time(); ?>" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.png">
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
    <body class="cnt-home">
	
		
	
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="index.php">Home</a></li>
				<li >Đơn Hàng</li>
				<li class='active'> Chi Tiết Đơn Hàng</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-xs">
	<div class="container">
		<div class="row inner-bottom-sm">
			<div class="shopping-cart">
				<div class="col-md-12 col-sm-12 shopping-cart-table ">
					<div class="table-responsive">
						<form name="cart" method="post">	

							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="cart-romove item">#</th>
										<th class="cart-description item">Ảnh</th>
										<th class="cart-product-name item">Tên Sản Phẩm</th>
										<th class="cart-qty item">Số lượng</th>
										<th class="cart-sub-total item">Giá sản phẩm</th>
										<th class="cart-sub-total item">Tổng</th>
                                        <th class="cart-sub-total item">Trạng thái đơn hàng</th>
									</tr>
								</thead>
							
							<tbody>
                            <?php
					$orderid=$_POST['orderid'];
					$email=$_POST['email'];
					$ret = mysqli_query($con,"SELECT t.email,t.idorder from (select usr.email,odrs.idorder from users as usr join orders as odrs on usr.id=odrs.userId) as t where  t.email='$email' and (t.idorder='$orderid')");
					$num=mysqli_num_rows($ret);
				   if($num>0){
					$query=mysqli_query($con,"SELECT o.*,p.*, od.orderStatus from orders_detail as o join products as p on o.productId = p.id join orders as od on o.idorder=od.idorder WHERE o.idorder =$orderid ");
					$cnt=0;
					while($row=mysqli_fetch_array($query))
					{
                        $tongtien += $row["price"]*$row['quantity'];
					?>
									<tr>
									<td><?php echo ++$cnt;?></td>
									<td class="cart-image">
										<a class="entry-thumbnail" href="">
											<img src="../admin/productimages/<?=$row['productImage1']?>" alt="" width="84" height="146">
										</a>
									</td>
									<td class="cart-product-name-info">
										<h4 class='cart-product-description'><a href="product-details.php?pid=<?php echo $row['opid'];?>">
										<?=$row['productName'];?></a></h4>
										
										
									</td>
									<td class="cart-product-quantity">
										<?php echo $qty=$row['quantity']; ?>   
									</td>
									<td class="cart-product-sub-total"><?php echo number_format($price=$row['price'],0,',','.')."<sup>đ</sup>" ; ?>  </td>
									<?php $shippcharge=30000; ?> 
									<td class="cart-product-grand-total"><?php echo number_format(($qty*$price),0,',','.')."<sup>đ</sup>";?></td>					
								    <td>
                                    <?php $status=$row['orderStatus'];
                                            if($status ==0){
                                                echo "Chưa được xử lý";
                                            }else if($status == 1){
                                                echo "Đang được xử lý";
                                            }else if($status == 2){
                                                echo "Đã giao hàng";
                                            }
                                            ?>
                                    </td>
                                </tr>
                                </tbody><!-- /tbody -->
							</table><!-- /table -->
						</form>
					</div>
					<div class="tong">
						<div  class="dai">
							<span class="text">Tổng Tiền Hàng:</span> <span class="t_price"><?php echo number_format($tongtien,0,',','.')."<sup>đ</sup>"; ?></span>
						</div>
						<div class="dai">
							<span class="text">Phí Giao Hàng:</span> <span class="t_price" >30.000<sup>đ</sup></span>
						</div>
						<hr>
						<div class="dai">
							<span class="text">Tổng Hóa Đơn:</span>
							<span class="t_price"><?php echo number_format(($tongtien+30000),0,',','.'). "<sup>đ</sup>"; ?></span>
						</div>
					</div>
                                <?php } } else { ?>
                <tr><td colspan="8">Either order id or  Registered email id is invalid</td></tr>
                            </tbody><!-- /tbody -->
							</table><!-- /table -->
                <?php } ?>
					
				</div>
			</div><!-- /.shopping-cart -->
		</div> <!-- /.row -->
	</div><!-- /.container -->
</div><!-- /.body-content -->


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
