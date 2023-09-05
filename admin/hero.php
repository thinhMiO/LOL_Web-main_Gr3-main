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
<body id="body" style="" >
	<?php
		include("../admin/include/sidebar.php");
        require_once("../admin/database/connectdb.php");
        require_once("../admin/database/function.php");
        $marole = 0;
        if(isset($_REQUEST["marole"])){
            $marole = $_REQUEST["marole"];
        }
        $matier = 0;
        if(isset($_REQUEST["matier"])){
            $matier = $_REQUEST["matier"];
        }
	?>
    <h2>Tất Cả Các Tướng</h2>
    <div>
        <form action="" name="f1" id="f1" method="get" >
            <select name="marole" id="marole" onchange="document.f1.submit()">
                <option value="0">Tất cả các đường</option>
                    <?php
                        TaoSelects("tbrole","idrole","role",$marole);
                    ?>
            </select>
            <select name="matier" id="matier" onchange="document.f1.submit()">
                <option value="0">Tất cả xếp hạng</option>
                    <?php
                        TaoSelects("tbtierlist","idtier","tier",$matier);
                    ?>
            </select>
        </form>
    </div>
    <table class="table mytable" border="1" align="center"   cellspacing="0" >
        <thead>
            <tr>
                <th width="50" >Id</th>
                <th width="70" >Anh Hùng</th>
                <th width="80" >Đường</th>
                <th width="80" >Tier List</th>
                <th width="80" >Độ Khó</th>
                <th width="80" >Tỷ Lệ Win</th>
                <th width="80" >Tỷ Lệ Pick</th>
                <th width="80" >Tỷ Lệ Ban</th>
                <th width="80" >Số Trận</th>
                <th width="80" >Xử Lý</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $rows = getlistHero($marole,$matier);
                // if($rows == null){
                //     die("<p>Lỗi truy vấn cơ sở dữ liệu</p>");
                // }
                foreach($rows as $row){
            ?>
            <tr>
                <td><?=$row["idhero"]?></td>
                <td><?=$row["namehero"]?></td>
                <td><?=$row["role"]?></td>
                <td><?=$row["tier"]?></td>
                <td><?=$row["hard"]?></td>
                <td><?=$row["winrate"]?></td>
                <td><?=$row["pickrate"]?></td>
                <td><?=$row["banrate"]?></td>
                <td><?=$row["matchs"]?></td>
                <td>
                    <a href="../admin/updatehero.php?id=<?=$row["idhero"]?>"><i class='bx bx-edit-alt' style="color:red;" ></i></a>
                    <a href="../admin/updateherodetail.php?id=<?=$row["idhero"]?>"><i class='bx bx-folder-minus' ></i></a>
                    <a href="../admin/database/xylyxoahero.php?id=<?=$row["idhero"]?>" onclick="return confirm('Chắc chắn xóa')"><i class='bx bxs-trash-alt' style="color:red;" ></i></a>
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
<?php }?>