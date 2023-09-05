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
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="../admin/css/css.css?v=<?php echo time(); ?>">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	<title>Document</title>
</head>
<body id="body" >
	<?php
		include("../admin/include/sidebar.php");
        require_once("../admin/database/connectdb.php");
        require_once("../admin/database/function.php");
        if(isset($_REQUEST["oid"]) == false){
            die('<h3>Chưa Có Tướng</h3>');
        }
        $id = $_REQUEST["oid"];
        if($id == "" || is_numeric($id)==false){
            die('<p>ID không được để trống và phải là số</p>');
        }
	?>
    <h2>Tất Cả Sản Phẩm</h2>
    <table class="table mytable" border="1" align="center"   cellspacing="0" >
        <thead>
            <tr>
                <th width="50" >Id</th>
                <th width="70" >Id Hóa Đơn</th>
                <th width="70" >Ảnh</th>
                <th width="80" >Tên Sản Phẩm</th>
                <th width="80" >Số lượng</th>
                <th width="80" >Giá sản phẩm</th>
                <th width="80" >Tổng</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $conn = ConnectDB();
                $sql = "SELECT o.*,p.* from orders_detail as o join products as p on o.productId = p.id WHERE idorder =$id";
                $pdo_stm = $conn->prepare($sql);
                $ketqua = $pdo_stm->execute();
                $row = $pdo_stm->fetchAll(PDO::FETCH_BOTH);
                $tongtien =0;
                foreach($row as $row)
                {
                    $tongtien += $row["price"]*$row['quantity'];
            ?>
            <tr>
                <td><?=$row["idod"]?></td>
                <td><?=$id?></td>
                <td><img src="../admin/productimages/<?=$row['productImage1']?>" alt="" width="84" height="146"></td>
                <td><?=$row["productName"]?></td>
                <td><?=($qty=$row["quantity"])?></td>
                <td><?php echo number_format($price=$row['price'],0,',','.') ; ?></td>
                <td><?php echo number_format(($qty*$price),0,',','.');?></td>

            </tr>
            <?php } ?>
            </tbody>
        
    </table>
    <div style="width: 35%; border:2px solid black;margin-top: 20px; margin:auto" >
        <div  class="dai">
			<span style="width: 170px;display: inline-block;margin: 10px 0 5px 50px;">Tổng Tiền Hàng:</span> <span class="t_price"><?php echo number_format($tongtien,0,',','.')."<sup>đ</sup>"; ?></span>
		</div>
		<div class="dai">
			<span style="width: 170px;display: inline-block;margin: 10px 0 5px 50px;">Phí Giao Hàng:</span> <span class="t_price" >30.000<sup>đ</sup></span>
		</div>
		<hr>
		<div class="dai">
			<span style="width: 170px;display: inline-block;margin: 10px 0 5px 50px;">Tổng Hóa Đơn:</span>
			<span class="t_price"><?php echo number_format(($tongtien+30000),0,',','.'). "<sup>đ</sup>"; ?></span>
		</div>
    </div>
	<script src="../admin/scripts/sidebar.js"></script>
	<script src="../admin/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../admin/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../admin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../admin/scripts/flot/jquery.flot.js" type="text/javascript"></script>
    <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			
            $('.mytable').dataTable();
		} );
        
	</script>
</body>
</html>
<?php }?>