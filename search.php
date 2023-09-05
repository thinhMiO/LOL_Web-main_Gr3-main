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
    <link rel="stylesheet" href="CSS_extra/footer.css?v=<?php echo time(); ?>">
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
            include ('include/menu-champion.php');
            $search = $_POST['search-text'];
        ?>
    </div>
    <div class="IntroContainer">
        <div class="IntroContainer_contain" >
            <div class="introsub">Hiển Thị Cho Kết Quả</div>
            <div class="introsub_1"><?php echo $search; ?></div>
        </div>
    </div>
    <?php
        require_once("include/Ketnoi.php");
        
    ?>
    <div class="champion_big_card">
        
        <div class="champion_big_card">
            <div class="tabcontent" id="All">
                <?php
                    $conn = ConnectDB();
                    if($conn == null){
                        return null;
                    }
                    $sql = "SELECT * from tbHero where namehero like '%$search%' ";
                    $pdo_stm = $conn->prepare($sql);
                    $ketqua = $pdo_stm->execute();
                    if($ketqua == false){
                        return false;
                    }else{
                        $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
                        $count = $pdo_stm->rowCount();
                    }
                    if($count >0){
                    foreach ($row as $row) {
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
            <?php 
            }else {
        ?>
            <div class="search-else" ><h3>Không Có Kết Quả Cho "<?php echo $search; ?>" </h3></div>
        <?php }?>
        </div>
        
    </div>
    
</body>
<?php
    include ('include/footer.php')
    ?>
<script src="../Champions/search_1.js"></script>
</html>
                   
