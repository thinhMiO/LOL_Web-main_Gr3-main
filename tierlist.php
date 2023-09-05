<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tier List</title>
  <!-- link cdn -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!---------StyleSheet----------->
    <link rel="stylesheet" href="CSS_extra/color.css">
    <link rel="stylesheet" href="CSS_extra/tierlist.css">
    <link rel="stylesheet" href="CSS_extra/champion.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/footer.css">

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
    
</head>
<body>
  <?php
    include ('include/menu-champion.php');
    require_once("include/Ketnoi.php");
  ?>
    
    <div class="IntroContainer">
        <div class="IntroContainer_contain" >
            <div class="introsub">Danh sách hạng</div>
            <div class="introsub_1">Nguồn thông tin đáng tin cậy nhất về tất cả cập nhật trong trò chơi.</div>
        </div>
    </div>
    <!--Tier S A B-->
    <div class="tierlist_text">
      <div class="text"><h1>S</h1></div>
      <div class="text"><h1>A</h1></div>
      <div class="text"><h1>B</h1></div>
    </div>
    <div class="tierlist_line"></div>
    <!--End-->

    <!-------Tier List Card------->
    <div class="tierlist_card">
      <!--Card-->
      <div class="card">
        <div class="boder">
          <!--items-->
          
          <?php
            $rows = getlistHeroTier(1);            
            foreach ($rows as $row) {
          ?>
          <div class="avatar"><a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$row["idhero"]?>"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["img"]?>" alt=""></a></div>
          <?php }?>
          <!--end-->
        </div>
      </div>
      <!--End-->

      <!--Card-->
      <div class="card">
        <div class="boder">
          <!--items-->
          <?php
            $rows = getlistHeroTier(2);            
            foreach ($rows as $row) {
          ?>
          <div class="avatar"><a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$row["idhero"]?>"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["img"]?>" alt=""></a></div>
          <?php }?>
          <!--end-->
          
        </div>
      </div>
      <!--End-->

      <!--Card-->
      <div class="card">
        <div class="boder">
          <!--items-->
          <?php
            $rows = getlistHeroTier(3);            
            foreach ($rows as $row) {
          ?>
          <div class="avatar"><a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$row["idhero"]?>"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["img"]?>" alt=""></a></div>
          <?php }?>
          <!--end-->
        </div>
      </div>
      <!--End-->
      
    </div>
    <!-----------End----------->
      <?php 
      include ('include/footer.php')
      ?>
       
    
</body>