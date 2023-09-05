<?php 
//session_start();

?>

<div class="top-bar animate-dropdown">
	<div class="container">
		<div class="header-top-inner">
			<div class="cnt-account">
				<ul class="list-unstyled">

<?php if(strlen($_SESSION['login']))
    {   ?>
				<li><a href="#"><i class="icon fa fa-user"></i>Welcome -<?php echo htmlentities($_SESSION['username']);?></a></li>
				<?php } ?>
				<li><a href="../Home.php">Home page</a></li>
					<li><a href="my-account.php"><i class="icon fa fa-user"></i>Tài Khoản</a></li>
					<li><a href="my-wishlist.php"><i class="icon fa fa-heart"></i>Danh Dách Yêu Thích</a></li>
					
					<?php if(strlen($_SESSION['login'])==0)
    {   ?>
<?php }
else{ ?>
	
				
				<?php } ?>	
				</ul>
			</div><!-- /.cnt-account -->

<div class="cnt-block">
				<ul class="list-unstyled list-inline">
					<li class="dropdown dropdown-small">
						<a href="track-orders.php" class="dropdown-toggle" ><span class="key">Kiểm Tra Đơn Hàng</b></a>
						
					</li>

				
				</ul>
			</div>
			
			<div class="clearfix"></div>
		</div><!-- /.header-top-inner -->
	</div><!-- /.container -->
</div><!-- /.header-top -->