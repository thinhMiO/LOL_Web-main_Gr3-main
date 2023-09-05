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
	<link rel="stylesheet" href="../admin/css/sidebar.css?v=<?php echo time();?>">
    <link rel="stylesheet" href="../admin/css/css.css?v=<?php echo time(); ?>">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../admin/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
	<title>Document</title>
</head>
<body id="body" style="" >
    <?php
		include("../admin/include/sidebar.php");
        require_once("../admin/database/connectdb.php");
        require_once("../admin/database/function.php");
	?>  
    <h2>Tất Cả Bài Viết</h2>

    <table class="table mytable"  border="1" align="center" id="mytable"  cellspacing="0" >
        <thead>
            <tr>
                <th width="50" >Id post</th>
                <th width="350" >Tiêu đề</th>
                <th width="80" >Ngày đăng</th>
                <th width="80" >Trạng thái</th>
                <th width="80" >Xử Lý</th>
            </tr>
        </thead>
        
        <tbody>
            <?php
                $rows = getlistPost();
                // if($rows == null){
                //     die("<p>Lỗi truy vấn cơ sở dữ liệu</p>");
                // }
                foreach($rows as $row){
            ?>
            <tr>
                <td><?=$row["idpost"]?></td>
                <td><?=$row["title"]?></td>
                <td><?=$row["time"]?></td>
                <td><?=$row["status"]==0?"Hiển thị":"Ẩn"?></td>
                <td>
                    <a href="../admin/updatePost.php?id=<?=$row["idpost"]?>"><i class='bx bx-edit-alt' style="color:blue;" ></i></a>
                    <a href="../admin/database/xylyxoaPost.php?id=<?=$row["idpost"]?>" onclick="return confirm('Chắc chắn xóa')"><i class='bx bxs-trash-alt' style="color:red;" ></i></a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
       
    </table>
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
<?php } ?>