<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!---------StyleSheet----------->
    <!-- Liên kết CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bộ StyleSheet -->
    <link rel="stylesheet" href="CSS_extra/color.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/champion.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/footer.css ?v=<?php echo time(); ?>">
    <!-- Biểu tượng ICON -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
    <!-- Phông chữ MONTSERATT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@400;500;700&family=Roboto:wght@700&family=Tektur:wght@500&display=swap" rel="stylesheet">
    <title>League of Legends</title>
    <!-- icon -->
    <link rel="shortcut icon" href="Img/favicon.png">
</head>
<body>
    <!-----------------------------HEADER------------------------------->
    <div class="header">
        <?php
            include ('include/menu-champion.php')
        ?>
    </div>
    <div class="champion_role">
      <button class="role_btn" onclick="openPage('All', this, 'black')" id="defaultOpen"><img src="../LOL_Web-main_Gr3-main/Img/All.png" alt=""></button>
      <button class="role_btn" onclick="openPage('Jungle', this, '#31c110')"><img src="../LOL_Web-main_Gr3-main/Img/rung.png" alt=""></button>
      <button class="role_btn" onclick="openPage('Top', this, '#813c3c')"><img src="../LOL_Web-main_Gr3-main/Img/top.png" alt=""></button>
      <button class="role_btn" onclick="openPage('Mid', this, 'blue')"><img src="../LOL_Web-main_Gr3-main/Img/mid.png" alt=""></button>
      <button class="role_btn" onclick="openPage('Ad', this, '#dd5ae4')"><img src="../LOL_Web-main_Gr3-main/Img/ad.png" alt=""></button>
      <button class="role_btn" onclick="openPage('Support', this, 'yellow')"><img src="../LOL_Web-main_Gr3-main/Img/sup.png" alt=""></button>
    </div>
    <?php
        require_once("include/Ketnoi.php");

    ?>
    <div class="champion_big_card">
        
    <div class="champion_big_card">
        <div class="tabcontent" id="All">
        <?php
        $rows = getlistHero();
        // foreach ($rows as $row) {
        
        foreach ($rows as $row) {
        ?>
            <div class="champions_card">
                <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$row["idhero"]?>">
                    <div class="img_char">
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["img"]?>" alt="">
                    </div>
                    <div class="text">
                             <p><?=$row["namehero"]?></p>
                                </div>       
                </a>
            </div>
            <?php
            }
        ?>
    </div>
       
     </div>
        <div class="tabcontent" id="Jungle">     
        <?php
        $jungle = getlistHeroRole(2);
        // foreach ($rows as $row) {
        
        foreach ($jungle as $jungle) {
        ?>
            <div class="champions_card">
                <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$jungle["idhero"]?>">
                    <div class="img_char">
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$jungle["img"]?>" alt="">
                    </div>
                    <div class="text">
                             <p><?=$jungle["namehero"]?></p>
                                </div>       
                </a>
            </div>
            <?php
            }
        ?>
        </div>
        <div class="tabcontent" id="Top">   
            <?php
            $Top = getlistHeroRole(1);
            // foreach ($rows as $row) {
            
            foreach ($Top as $Top) {
            ?>
                <div class="champions_card">
                    <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$Top["idhero"]?>">
                        <div class="img_char">
                            <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$Top["img"]?>" alt="">
                        </div>
                        <div class="text">
                                <p><?=$Top["namehero"]?></p>
                                    </div>       
                    </a>
                </div>
                <?php
                }
            ?>      
        </div>
        <div class="tabcontent" id="Mid">
        <?php
            $Mid = getlistHeroRole(3);
            // foreach ($rows as $row) {
            
            foreach ($Mid as $Mid) {
            ?>
                <div class="champions_card">
                    <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$Mid["idhero"]?>">
                        <div class="img_char">
                            <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$Mid["img"]?>" alt="">
                        </div>
                        <div class="text">
                                <p><?=$Mid["namehero"]?></p>
                                    </div>       
                    </a>
                </div>
                <?php
                }
            ?>      
        </div>
        <div class="tabcontent" id="Ad">    
        <?php
            $Ad = getlistHeroRole(4);
            // foreach ($rows as $row) {
            
            foreach ($Ad as $Ad) {
            ?>
                <div class="champions_card">
                    <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$Ad["idhero"]?>">
                        <div class="img_char">
                            <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$Ad["img"]?>" alt="">
                        </div>
                        <div class="text">
                            <p><?=$Ad["namehero"]?></p>
                        </div>       
                    </a>
                </div>
                <?php
                }
            ?>           
        </div>
        <div class="tabcontent" id="Support">
        <?php
            $Support = getlistHeroRole(5);
            // foreach ($rows as $row) {
            
            foreach ($Support as $Support) {
            ?>
                <div class="champions_card">
                    <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$Support["idhero"]?>">
                        <div class="img_char">
                            <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$Support["img"]?>" alt="">
                        </div>
                        <div class="text">
                            <p><?=$Support["namehero"]?></p>
                        </div>       
                    </a>
                </div>
                <?php
                }
            ?>      
        </div>
    </div>
    <?php
    include ('include/footer.php')
    ?>
</body>
<script src="scrip/search.js?v=<?php echo time(); ?>"></script>
</html>
                   
