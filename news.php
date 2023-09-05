<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin tức</title>
    <!-- link cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!---------StyleSheet----------->
    <link rel="stylesheet" href="CSS_extra/color.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/news.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/champion.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/footer.css?v=<?php echo time(); ?>">
    
    <!---------JAVASCRIPT-->
    <script src="search.js"></script>

    <!---------ICON----------------->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <!---------MONTSERATT----------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
</head>
<body>
    <!-----------------------------HEADER------------------------------->
    
        <?php
            include("include/menu-champion.php")
        ?>
    
    <!------------------------------END HEADER------------------------------------>
    <div class="IntroContainer">
        <div class="IntroContainer_contain" >
            <div class="introsub">CẬP NHẬT TRÒ CHƠI</div>
            <div class="introsub_1">Nguồn thông tin đáng tin cậy nhất về tất cả cập nhật trong trò chơi.</div>
        </div>
    </div>
    <div class="news_main">
        <?php
            require_once("include/Ketnoi.php");
            $rows = getlistPost();
            foreach ($rows as $row) {
        ?>
        
        <!--card-->
        <div class="news_card">
            <a href="../LOL_Web-main_Gr3-main/news_infor.php?link=<?=$row["slug"]?>">
                <div class="image">
                    <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images-Post/<?=$row["anhmota"]?>" alt="Img">
                </div>
                <div class="text">
                <h3><?=$row["title"]?></h3>
                <h4><?=$row["descpost"]?></h4>
                </div>
                <div class="time"><p><?php echo date("d-m-Y",strtotime($row["time"]))?></p></div>
            </a>
        </div>
        <?php }?>
        <!--end-->
        
    </div>
    <div class="pagination">
        <?php 

            $conn = ConnectDB();
            if($conn == null){
                return null;
            }
            $sql = "SELECT * from tbpost ";
            $pdo_stm = $conn->prepare($sql);
            $ketqua = $pdo_stm->execute();
            $count = $pdo_stm ->rowCount(); 
            $pages = ceil($count/6);
            $p=!empty($_GET['pages'])?$_GET['pages']:1;
        ?>
            <div class="haha">
                <?php 
                    if($p ==1){
                        echo "<a href='#' class='disable'>&laquo;</a>";
                    }
                    else{
                        echo "<a href='news.php?pages=".($p-1)."'>&laquo;</a>";
                    }
                    for($i =1;$i <= $pages;$i++){
                ?>
                <?php if($i != $p) { ?>
                <a href="news.php?pages=<?php echo $i; ?>"><?php echo $i; ?></a>
                <?php }else { ?>
                    <strong><?=$i?></strong>
                <?php }?>
                <?php }; 
                    if($p ==$pages){
                        echo "<a href='#' class='disable'>&raquo;</a>";
                    }
                    else{
                        echo "<a href='news.php?pages=".($p+1)."'>&raquo;</a>";
                    }
                ?>
            </div>
    </div>
    <?php
        include("include/footer.php")
    ?>
</body>
</html>
