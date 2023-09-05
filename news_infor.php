<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!---------StyleSheet----------->
    <link rel="stylesheet" href="CSS_extra/news_infor.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/color.css?v=<?php echo time(); ?>">
   
    <link rel="stylesheet" href="CSS_extra/champion.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/footer.css?v=<?php echo time(); ?>">
    <!---------JAVASCRIPT-->
    <script src="search.js"></script>

    <!---------ICON----------------->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />

    <!---------MONTSERATT----------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
    <?php
    include_once("include/Ketnoi.php");
        if(isset($_REQUEST["link"])==false)
            die("<p>chưa có link bài viết</p>");
        $link = $_REQUEST["link"];//lấy id nhân viên
        $row = getPost($link);
    ?>

    <title><?php echo $row["title"] ?></title>
</head>
<body>
    <!-----------------------------HEADER------------------------------->
    
    <?php
        include("include/menu-champion.php")
    ?>
    
    <!------------------------------END HEADER------------------------------------>
    <div class="information">
    
        <div class="chung">
        <div class="title">
            <div class="socials">
                <a href="https://www.facebook.com/Leagueoflegendsvn" target="_blank"><i class="uil uil-facebook-f"></i></a>
                <a href="https://www.instagram.com/lmhtvietnam/?hl=en" target="_blank"><i class="uil uil-instagram"></i></a>
                <a href="https://www.youtube.com/channel/UCZtmNrG53nmbq-Ww2VJrxEQ" target="_blank"><i class="uil uil-youtube"></i></a>
            </div>
            <div class="name">
                <h1><?=$row["title"]?></h1>
                <h4><?php echo date("d-m-Y",strtotime($row["time"]))?></h4>
            </div>
            <div class="empty box"></div>
        </div>
        <div class="main">
            <div style="width: 1400px;" >
                <img id="img1" src="../LOL_Web-main_Gr3-main/admin/Uploads/images-Post/<?=$row["anhmota"]?>" alt="Img">
            </div>
            <!-------Text------->
            <div class="text">
            <?=$row["content"]?>
            </div>
            <!-------End------->
        </div>
    </div>
    <div class="news_main">
        <div class="title"><h1>Related Pots</h1></div>
        <?php
            $rows = getPosts(2);
            foreach($rows as $row){
           
        ?>
        <!--card-->
        <div class="news_card">
            <a href="../LOL_Web-main_Gr3-main/news_infor.php?link=<?=$row["slug"]?>">
            <div class="image" >
                <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images-Post/<?=$row["anhmota"]?>" alt="Img">
            </div>
            <div class="text">
            <h3><?=$row["title"]?></h3>
            <h4><?=$row["descpost"]?></h4>
            </div>
            <div class="time"><p><?php echo date("d-m-Y",strtotime($row["time"]))?></p></div>
        </a>
        </div>
        <?php  } ?>
        <!--end-->
    </div>
    <?php
        include("include/footer.php");
    ?>
</body>

</html>