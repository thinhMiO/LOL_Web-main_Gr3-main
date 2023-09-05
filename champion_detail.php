<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Liên kết CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bộ StyleSheet -->
    <link rel="stylesheet" href="CSS_extra/color.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/champion.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/footer.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="CSS_extra/champion_detail.css?v=<?php echo time(); ?>">
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
    <!-- Phần HEADER -->
    <?php 
    include ('include/menu-champion.php')
    ?>
    <!-- Kết thúc phần HEADER -->

    <!-- Phần CHAMPION -->
    <?php
        require_once("include/Ketnoi.php");
    ?>
    <div class="champions">
        <?php
            if(isset($_REQUEST["idhero"])==false)
                die("<p>chưa có id nhân viên</p>");
            $id = $_REQUEST["idhero"];//lấy id nhân viên
            if($id=="" || is_numeric($id)==false)
            die("<p>id không được rỗng và phải là số</p>");
            $row = getHero($id);
            ?>
        <div class="champion_top">
            <div class="champion_top_left">
                
                <div class="img_character">
                    <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["img"]?>" alt="">
                </div>
                <div class="info_character">
                    <p><?=$row["namehero"]?></p> 
                    <p><?=$row["role"]?></p>
                </div>
                <div class="img_skill">
                    <div class="skill"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["intrinsic"]?>"></div>
                    <div class="skillcontent">
                        <video autoplay muted loop id="myVideo">
                            <source src="../LOL_Web-main_Gr3-main/admin/Uploads/videos/<?=$row["videoint"]?>" type="video/mp4">
                        </video><br>
                        <p><?=$row["descint"]?></p>                    
                    </div>
                    <div class="skill"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["skill1"]?>"></div>
                    <div class="skillcontent">
                        <video autoplay muted loop id="myVideo">
                            <source src="../LOL_Web-main_Gr3-main/admin/Uploads/videos/<?=$row["video1"]?>" type="video/mp4">
                        </video>
                        <p><?=$row["desc1"]?></p>                    
                    </div>
                    <div class="skill"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["skill2"]?>"></div>
                    <div class="skillcontent">
                        <video autoplay muted loop id="myVideo">
                            <source src="../LOL_Web-main_Gr3-main/admin/Uploads/videos/<?=$row["video2"]?>" type="video/mp4">
                        </video>
                        <p><?=$row["desc2"]?></p>                    
                    </div>
                    <div class="skill"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["skill3"]?>"></div>
                    <div class="skillcontent">
                        <video autoplay muted loop id="myVideo">
                            <source src="../LOL_Web-main_Gr3-main/admin/Uploads/videos/<?=$row["video3"]?>" type="video/mp4">
                        </video>
                        <p><?=$row["desc3"]?></p>                    
                    </div>
                    <div class="skill"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["skill4"]?>"></div>
                    <div class="skillcontent">
                        <video autoplay muted loop id="myVideo">
                            <source src="../LOL_Web-main_Gr3-main/admin/Uploads/videos/<?=$row["video4"]?>" type="video/mp4">
                        </video>
                        <p><?=$row["desc4"]?></p>                    
                    </div>
                </div>
            </div>
            <div class="champion_top_right">
                <ul>
                    <li>Xếp hạng : <span><?=$row["tier"]?></span><i></i>	</li>
                    <li>Tỷ lệ thắng : <span><?=$row["winrate"]?></span>
                        <div class="arrowed">
                        
                         </div>
                    </li>
                    <li>Tỷ lệ chọn : <span><?=$row["pickrate"]?></span>
                        <div class="arrowed">
                            
                             </div>
                    </li>
                    <li>Tỷ lệ ban : <span><?=$row["banrate"]?></span>
                        <div class="arrowed">
                            
                             </div>
                    </li>
                    <li>Tổng số trận : <span><?=$row["matchs"]?></span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="champion_bottom">
            <div class="champion_bottom_button">
                <button class="tablink" onclick="openPage('Builds', this, 'black')"id="defaultOpen" >Builds</button>
            </div>
            <div class="champion_bottom_button">
                <button class="tablink" onclick="openPage('Counters', this, 'black')" >Counters</button>
            </div>
            <div class="champion_bottom_button">
                <button class="tablink" onclick="openPage('Combo', this, 'black')" >Combo</button>
            </div>
            <!-- <div class="champion_bottom_button">
                <button class="tablink" onclick="openPage('Highlight', this, 'black')">Highlight</button>
            </div>
            <div class="champion_bottom_button">
                <button class="tablink" onclick="openPage('ProBuilds', this, 'black')" >Pro&nbsp;Builds</button>
            </div> -->
            <div id="Builds" class="tabcontent">
                <div class="Builds_left">
                    <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["runes"]?>" alt="">
                </div>
                <div class="Builds_right">
                    <div class="Builds_right_top">
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["upskill"]?>" alt="">
                    </div>
                    <div class="Builds_right_bottom">
                        <img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["items"]?>" alt="">
                    </div>
                </div>
              </div>       
              <div id="Counters" class="tabcontent">
              <?php 
                     $conn = ConnectDB();
                     if($conn == null){
                         return null;
                     }
                     $sql = "SELECT h.*,ct.* FROM tbcounter as ct INNER JOIN tbhero as h on ct.counter = h.idhero WHERE ct.idhero =$id";
                     $pdo_stm = $conn->prepare($sql);
                     $ketqua = $pdo_stm->execute();
                     if($ketqua == false){
                        return false;
                    }else{
                        $counter = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
                    }
                    foreach($counter as $counter){
                ?>
                <div class="Counters_character">
                <a href="../LOL_Web-main_Gr3-main/champion_detail.php?idhero=<?=$counter["counter"]?>">
                    <div class="circle"><img src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$counter["img"]?>" alt=""></div>
                    <p><?=$counter["namehero"]?></p>
                    <span><?=$counter["hard"]?></span></a>
                </div>
                <?php }?>
              
              </div>
              <div id="Combo" class="tabcontent">
                <!-- <div class="Combo_top">
                    <div class="Combo_text">Combo 1 : <br><br><br>
                        <SPAN>Q1 + W + Q2 + Q3 +A</SPAN>
                    </div>
                    <div class="Combo_video">
                        VIDEO
                        <video></video>
                    </div>
                </div> -->
                <div class="Combo_bottom" style="object-fit: cover;">
                    <img style="width: 100%; height:100%;" src="../LOL_Web-main_Gr3-main/admin/Uploads/images/<?=$row["imgcombo"]?>" alt="">
                </div>
              </div>
              <!-- <div id="Highlight" class="tabcontent">
                <div class="HLvideo">

                </div>
              </div> -->
              <!-- <div id="ProBuilds" class="tabcontent">
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
                <div class="probuild_char">
                    <div class="circle_mini"></div>
                    <div class="circle"></div>
                    <p>Name</p>
                    <span>Rank</span><br><br>
                    <i>100%</i>
                </div>
              </div> -->
        </div>
    </div>
    <!-- Phần FOOTER -->
    <?php
    include ('include/footer.php')
    ?>
</body>
<script src="scrip/champion.js"></script>
</html>
