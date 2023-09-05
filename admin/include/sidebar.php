<div class="header" id="myheader" style="display: flex;justify-content: space-between;" >
		<div>
			<a href="#" class="nav_logo">
				<img src="Uploads/images/Service _ Repair_edited1.png" alt="" class="nav_logo-icon">
			</a>
		</div>
		<div class="header-rigt" >
		<ul class=" pull-right" >
			<li class="nav-user dropdown">
				<a  href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="images/user.png" class="nav-avatar" />
					<i class='bx bxs-chevron-down'style=""></i>
				</a>
				<ul class="dropdown-menu">
					<li><a href="register-admin.php">Đăng ký</a></li>
					<li class="divider"></li>
					<li><a href="change-password.php">Đổi Mật Khẩu</a></li>
					<li class="divider"></li>
					<li><a href="logout.php">Đăng Xuất</a></li>
				</ul>
			</li>
			<li><a style=" color: #fff; margin-right: 10px; font-weight: 800;" href="#">
				Admin
			</a></li>
					</ul>
		</div>
</div>
	<div class="l-navbar" id="navbar">
		<div class="nav">
			<div>
				<ul class="nav_list">
					<li>
						<a href="../admin/welcome.php" class="nav_link ">
							<i class='bx bx-grid-alt nav_icon'></i>	
							<span class="nav_text">Dashboard</span>
						</a>
					</li>
					<li>
						<a class="nav_link" data-toggle="collapse" href="#togglePages">
							<i class='bx bxs-pin nav_icon' ></i>	
							<span class="nav_text">Bài Viết</span>
							<i class='bx bxs-chevron-down'style="margin-left:84px;"></i>
						</a>
						<ul class="collapse sub-menu" id="togglePages">
							<a href="../admin/post.php" class="nav_link sub-link">
								<i class='bx bx-paste nav_icon-sub' ></i>
								<span class="nav_text">Tất cả bài viết</span> 
							</a>
							<a href="../admin/addPost.php" class="nav_link sub-link">
								<i class='bx bx-add-to-queue nav_icon-sub' ></i>
								<span class="nav_text">Thêm bài viết mới</span>
							</a>
						</ul>
					</li>
					<li>
						<a class="nav_link " data-toggle="collapse" href="#togglePage">
							<i class='bx bxs-group nav_icon'></i>	
							<span class="nav_text">Quản Lý Anh Hùng</span>
							<i class='bx bxs-chevron-down'style="margin-left:14px;"></i>
						</a>
						<ul class="collapse sub-menu" id="togglePage">
							<a href="../admin/hero.php" class="nav_link sub-link">
								<i class='bx bx-paste nav_icon-sub' ></i>
								<span class="nav_text">Tất cả tướng</span>
							</a>
							<a href="../admin/addhero.php" class="nav_link sub-link">
								<i class='bx bx-add-to-queue nav_icon-sub' ></i>
								<span class="nav_text">Thêm tướng mới</span>
							</a>
						</ul>
					</li>
					<li>
						<a class="nav_link "data-toggle="collapse" href="#togglePagee">
							<i class='bx bxs-spreadsheet nav_icon'></i>	
							<span class="nav_text">Quản Lý Sản Phẩm</span>
							<i class='bx bxs-chevron-down'style="margin-left:10px;"></i>
						</a>
						<ul class="collapse sub-menu" id="togglePagee">
							<a href="../admin/manage-products.php" class="nav_link sub-link">
								<i class='bx bx-paste nav_icon-sub' ></i>
								<span class="nav_text">Tất cả sản phẩm</span>
							</a>
							<a href="../admin/insert-product.php" class="nav_link sub-link">
								<i class='bx bx-add-to-queue nav_icon-sub' ></i>
								<span class="nav_text">Thêm sản phẩm mới</span>
							</a>
							<a href="../admin/category.php" class="nav_link sub-link">
								<i class='bx bx-task nav_icon-sub' ></i>
								<span class="nav_text">Thể loại</span>
							</a>
							<a href="../admin/subcategory.php" class="nav_link sub-link">
								<i class='bx bx-task nav_icon-sub' ></i>
								<span class="nav_text">Loại sản phẩm</span>
							</a>
						</ul>	
					</li>
					<li>
						<a class="nav_link" data-toggle="collapse" href="#togglePagess">
							<i class='bx bxl-product-hunt nav_icon'></i>	
							<span class="nav_text">Quản lý đơn hàng</span>
							<i class='bx bxs-chevron-down'style="margin-left:20px;"></i>
						</a>
						<ul class="collapse sub-menu" id="togglePagess">
							<a href="../admin/todays-orders.php" class="nav_link sub-link">
								<i class='bx bx-paste nav_icon-sub' ></i>
								<span class="nav_text">Đơn hàng chưa xử lý</span> 
							</a>
							<a href="../admin/pending-orders.php" class="nav_link sub-link">
								<i class='bx bx-add-to-queue nav_icon-sub' ></i>
								<span class="nav_text">Đơn hàng đang xử lý</span>
							</a>
							<a href="../admin/delivered-orders.php" class="nav_link sub-link">
								<i class='bx bx-add-to-queue nav_icon-sub' ></i>
								<span class="nav_text">Đơn hàng đã giao</span>
							</a>
						</ul>
					</li>
					<li>
						<a href="../admin/manage-users.php" class="nav_link ">
							<i class='bx bx-user nav_icon'></i>	
							<span class="nav_text">Quản Lý Tài Khoản</span>
						</a>
					</li>
				</ul>
				<div class="nav_toggle" id="nav-toggle">
					<i class='bx bxs-chevron-right'></i>	
				</div>
			</div>
			<a href="../admin/logout.php" class="nav_link " style="margin-bottom: 40px;" >
				<i class='bx bx-log-out nav_icon'></i>	
				<span class="nav_text">Đăng Xuất</span>
			</a>
		</div>
	</div>