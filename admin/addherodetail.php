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
    <h2>Thêm Tướng Chi Tiết Cho Tướng</h2>
    <form action="../admin/database/xylythemherodetail.php" name="f1" id="formtuong" method="post" enctype="multipart/form-data">
        <?php
            if(isset($_REQUEST["id"]) == false){
            die('<h3>Chưa Có Tướng</h3>');
            }
            $id = $_REQUEST["id"];
            if($id == "" || is_numeric($id)==false){
                die('<p>ID không được để trống và phải là số</p>');
            }
        ?>
        <div class="input-group">
            <input id="idtuong" type="hidden" class="form-control" name="idtuong" value="<?=$id?>">
        </div>
        <!-- Chỉ số -->
        <legend>Chỉ số</legend>
        <div style="display:flex;">
        <div class="input-group">
            <label class="text">Tỷ lệ thắng</label>
            <input id="winrate" type="text" class="form-control" name="winrate">
        </div>
        <div class="input-group">
            <label class="text">Tỷ lệ chọn</label>
            <input id="dokho" type="text" class="form-control" name="pickrate">
        </div>
        <div class="input-group">
            <label class="text">Tỷ lệ ban</label>
            <input id="banrate" type="text" class="form-control" name="banrate">
        </div>
        <div class="input-group">
            <label class="text">Số trận</label>
            <input id="match" type="text" class="form-control" name="match">
        </div>
        </div>
        <!-- Chiêu Thức -->
        <legend style="font-size: 16px;" >Chi tiết chiêu thức</legend>
        <div class="input-group" style="display:flex;flex-wrap: wrap;" >
            <div style=" width: 550px; margin-bottom: 30px;">
                <p class="text">Nội Tại</p>
                <input type="file" name="noitai" id="noitai">
                <div style="width: 530px; height:220px;margin-top: 10px;" >
                <textarea class="ckeditor" name="motaNT" id="motaNT"></textarea>
                </div>
            </div>
            <div  style=" width: 550px;">
                <p class="text">Chiêu Q</p>
                <input type="file" name="chieuq" id="chieuq">
                <div style="width: 530px; height:220px;margin-top: 10px;" >
                <textarea class="ckeditor" name="motaQ" id="motaQ"></textarea>
                </div>
            </div>
            <div style=" width: 550px;">
                <p class="text">Chiêu W</p>
                <input type="file" name="chieuw" id="chieuw">
                <div style="width: 530px; height:220px;margin-top: 10px;" >
                <textarea class="ckeditor" name="motaW" id="motaW"></textarea>
                </div>
            </div>
            <div style=" width: 550px; margin-bottom: 30px;">
                <p class="text">Chiêu E</p>
                <input type="file" name="chieue" id="chieue">
                <div style="width: 530px; height:220px;margin-top: 10px;" >
                <textarea class="ckeditor" name="motaE" id="motaE"></textarea>
                </div>
            </div>
            <div style=" width: 550px;">
                <p class="text">Chiêu R</p>
                <input type="file" name="chieur" id="chieur">
                <div style="width: 530px; height:220px;margin-top: 10px;" >
                <textarea class="ckeditor" name="motaR" id="motaR"></textarea>
                </div>
            </div>
            <div class="input-group" style="width: 550px;">
                <p class="text"> Combo</p>
                <input type="file" name="combo" id="combo">
                
            </div>
        </div>
        <legend style="font-size: 16px;" >Tướng Khắc chế</legend>
            <div class="input-group" style="display:flex;flex-wrap: wrap;">
                <?php 
                    $conn = ConnectDB();
                    if($conn == null){
                        return null;
                    }
                    $sql = "SELECT * FROM tbhero";
                    $pdo_stm = $conn->prepare($sql);
                    $ketqua = $pdo_stm->execute();
                    if($ketqua == false){
                        return false;
                    }else{
                        $rows = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
                        $count = $pdo_stm->rowCount();
                    }
                    $i=0;
                    $h =0;
                    for ($s=0; $s < 4; $s++) { 
                        # code...
                ?>
                <div style=" width: 300px;">
                    <p class="text">Tướng</p>
                    <select name="idh<?php echo ++$i ?>" id="idh<?php echo $i ?>">
                        <option value="0" selected disabled>Chọn tướng</option>
                        <?php
                            TaoSelects("tbhero","idhero","namehero",0);
                        ?>
                    </select>
                </div>
                <?php }?>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <script>
         $(document).ready(function(){
            $("#idh1 #<?php echo $id ?>").hide();
            $("#idh2 #<?php echo $id ?>").hide();
            $("#idh3 #<?php echo $id ?>").hide();
            $("#idh4 #<?php echo $id ?>").hide();

        });
    </script>
</body>
</html>
<?php }?>