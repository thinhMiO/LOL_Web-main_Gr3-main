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
	<title>Document</title>
</head>
<body id="body" >
    <?php
		include("../admin/include/sidebar.php");
        require_once("../admin/database/connectdb.php");
        require_once("../admin/database/function.php");
	?>  
    <h2>Thêm Tướng Mới</h2>
    <form action="../admin/database/xylyupdatehero.php" name="f1" id="formtuong" method="post" enctype="multipart/form-data">
        <?php
            if(isset($_REQUEST["id"]) == false){
            die('<h3>Chưa Có Tướng</h3>');
            }
            $id = $_REQUEST["id"];
            if($id == "" || is_numeric($id)==false){
                die('<p>ID không được để trống và phải là số</p>');
            }
            $row = getHero($id);
        ?>
        <input type="hidden" name="idtuong" id="idtuong" value="<?=$row["idhero"]?>" >
        <div class="input-group">
            <label class="text">Tên Tướng</label>
            <input id="name" type="text" class="form-control" name="name" value="<?=$row["namehero"]?>">
        </div>
        <div class="input-group">
            <label class="text">Độ Khó</label>
            <input id="dokho" type="text" class="form-control" name="dokho" value="<?=$row["hard"]?>">
        </div>
        <div class="input-group" style="display:flex" >
            <div>
                <label class="text">Đường</label>
                <select class="form-select" name="marole" id="marole">
                    <option value="0">Chọn đường</option>
                    <?php
                        TaoSelects("tbrole","idrole","role",$row["idrole"]);
                    ?>
                </select>
            </div>
            <div>
                <label class="text">Tier List</label>
                <select class="form-select" name="matier" id="matier">
                    <option value="0">Chọn đường</option>
                    <?php
                        TaoSelects("tbtierlist","idtier","tier",$row["idtier"]);
                    ?>
                </select>
            </div>
        </div>
        <div class="input-group">
            <label class="text">Ảnh Tướng</label>
            <input type="file" name="anhtuong" id="anhtuong">
            <img src="../admin/Uploads/images/<?=$row["img"]?>"  alt="">
            <input type="hidden" name="anhtuongcu" id="anhtuongcu" value="<?=$row["img"]?>" >
        </div>
        <legend style="font-size: 16px;" >Chiêu Thức</legend>
        <div class="input-group" style="display:flex;flex-wrap: wrap;" >
            <div style=" width: 500px; margin-bottom: 30px;">
                <p class="text">Nội Tại</p>
                <input type="file" name="noitai" id="noitai">
                <img src="../admin/Uploads/images/<?=$row["intrinsic"]?>"  alt="">
                <input type="hidden" name="noitaicu" id="noitaicu" value="<?=$row["intrinsic"]?>" >
            </div>
            <div  style=" width: 500px;">
                <p class="text">Chiêu Q</p>
                <input type="file" name="chieuq" id="chieuq">
                <img src="../admin/Uploads/images/<?=$row["skill1"]?>"  alt="">
                <input type="hidden" name="chieuqcu" id="chieuqcu" value="<?=$row["skill1"]?>" >
            </div>
            <div style=" width: 500px;">
                <p class="text">Chiêu W</p>
                <input type="file" name="chieuw" id="chieuw">
                <img src="../admin/Uploads/images/<?=$row["skill2"]?>"  alt="">
                <input type="hidden" name="chieuwcu" id="chieuwcu" value="<?=$row["skill2"]?>" >
            </div>
            <div style=" width: 500px; margin-bottom: 30px;">
                <p class="text">Chiêu E</p>
                <input type="file" name="chieue" id="chieue">
                <img src="../admin/Uploads/images/<?=$row["skill3"]?>"  alt="">
                <input type="hidden" name="chieuecu" id="chieuecu" value="<?=$row["skill3"]?>" >
            </div>
            <div style=" width: 500px;">
                <p class="text">Chiêu R</p>
                <input type="file" name="chieur" id="chieur">
                <img src="../admin/Uploads/images/<?=$row["skill4"]?>"  alt="">
                <input type="hidden" name="chieurcu" id="chieurcu" value="<?=$row["skill4"]?>" >
            </div>
        </div>
        <legend style="font-size: 16px;" >Liên Quan</legend>
        <div class="input-group" style="display:flex;">
            <div class="input-group" style=" width: 500px;">
                <p class="text">Tăng Chiêu</p>
                <input type="file" name="upskill" id="upskill">
                <img class="anh_duoi" src="../admin/Uploads/images/<?=$row["upskill"]?>"  alt="">
                <input type="hidden" name="upskillcu" id="upskillcu" value="<?=$row["upskill"]?>" >
            </div>
            <div class="input-group" style=" width: 500px;">
                <p class="text">Bảng Ngọc</p>
                <input type="file" name="bangngoc" id="bangngoc">
                <img class="rune" src="../admin/Uploads/images/<?=$row["runes"]?>"  alt="">
                <input type="hidden" name="bangngoccu" id="bangngoccu" value="<?=$row["runes"]?>" >
            </div>
            <div class="input-group" style=" width: 500px;">
                <p class="text">Trang Bị</p>
                <input type="file" name="trangbi" id="trangbi">
                <img class="anh_duoi" src="../admin/Uploads/images/<?=$row["items"]?>"  alt="">
                <input type="hidden" name="trangbicu" id="trangbicu" value="<?=$row["items"]?>" >
            </div>
        </div>
        <div class="input-group" style="margin: auto;" >
            <input class="btn btn-primary" type="submit" name="b1" id="b1" value="Đồng ý">
            &nbsp;&nbsp;
            <input class="btn btn-danger" type="reset" name="b2" id="b2" value="Nhập lại">
        </div>
    </form>
	<script src="../admin/scripts/sidebar.js"></script>
	<script src="../admin/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../admin/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="../admin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../admin/scripts/flot/jquery.flot.js" type="text/javascript"></script>
    <script src="../admin/scripts/datatables/jquery.dataTables.js"></script>
</body>
</html>
<?php } ?>