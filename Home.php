<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- link CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!---------StyleSheet----------->
    <link rel="stylesheet" href="CSS_extra/slide.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/color.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/Home.css?v=<?php echo time(); ?>">
    
    <!---------ICON----------------->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
    <!---------MONTSERATT----------->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
    <title>LOL</title>
</head>
<body>  
    <?php
    include 'include/menu.php'
    ?>
    <div class="news">
        <div class="news--top">
            <h1>Tin Tức</h1>
            <button><a href="../LOL_Web-main_Gr3-main/news.php">SEE MORE</a></button>
        </div>
        <div class="news__content">
            <?php
                require_once("include/Ketnoi.php");
                $rows = getPosts(1);
                foreach($rows as $row){
            
            ?>
            <a href="../LOL_Web-main_Gr3-main/news_infor.php?link=<?=$row["slug"]?>">
                <div class="news__content__img--left">
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images-Post/<?=$row["anhmota"]?>" alt="Ảnh">
                        <div class="news__content__text--left">
                            <h3><?=$row["title"]?></h3>
                        </div> 
                </div>
            </a>
            <?php } ?>
            
            <div class="news__content--right">
            <?php
                $rows = getPosts(3);
                foreach($rows as $rows){
            
            ?>
                <!-- start content right item -->
                <a href="../LOL_Web-main_Gr3-main/news_infor.php?link=<?=$rows["slug"]?>">
                    <div class="item">
                        <div class="item-title">
                            <h4><?=$rows["title"]?></h4>
                        </div>
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images-Post/<?=$rows["anhmota"]?>" alt="">
                    </div> 
                </a>
                <!-- end content right item -->
                <?php } ?>
            </div>
        </div>
    </div>

    <div class="champions">
        <div class="champions--top">
            <h1>Tướng</h1>
            <!-- <button><a href="../LOL_Web-main_Gr3-main/news.php">SEE MORE</a></button> -->
    <section class="swiper mySwiper">
        <div class="swiper-wrapper">
                    <!-- Các thẻ swiper-slide với thông tin quái vật ở đây -->
                    <?php 
                    $slide=getHeros(15);
                    foreach($slide as $slide){
                    ?>
            <div class="card swiper-slide">
            <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$slide["idhero"]?>">
                <div class="card_image">
                    <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$slide["img"]?>" alt="">
                </div>     
                <div class="card_content">
                    <span class="card_name"><?=$slide["namehero"]?></span>
                </div></a>
             </div>
             <?php }?>
        </div>
    </section>
        </div>
    </div>
    
    <?php 
    include 'include/footer.php'
    ?>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="scrip/slide.js"></script>
    <script src="scrip/search.js"></script>
</body>
</html>
