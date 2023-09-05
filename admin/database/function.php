<?php
    // require_once("../database.php/connectdb.php");
    function getlistHero($marole = 0,$matier = 0){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT h.*,r.*,t.*,b.* from tbHero as h
                                    inner join tbrole as r on h.idrole = r.idrole
                                    inner join tbtierlist as t on h.idtier = t.idtier
                                    inner join tbban as b on h.idhero = b.idhero where TRUE ";
        if($marole > 0){
            $sql .= " AND h.idrole = $marole";
        }
        if($matier > 0){
            $sql .= " AND h.idtier = $matier";
        }
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function gethero($id){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbhero where idhero =? ";
        $data =[$id];
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute($data);
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetch(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getlistPost(){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbpost";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getPost($id){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbpost where idpost = $id";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetch(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getherodetail($id){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT v.*,d.*,b.*,c.* from tbvideokill as v
                                    INNER JOIN tbdesckill as d on v.idhero=d.idhero
                                    INNER JOIN tbban as b on v.idhero=b.idhero 
                                    INNER JOIN combo as c on v.idhero=c.idhero
                                    where v.idhero =? ";
        $data =[$id];
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute($data);
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetch(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function TaoSelects($tenbang,$cotid,$cotname,$selectedid){
        $conn = ConnectDB();
        $sql = "SELECT * from $tenbang";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            die("<p>Lỗi tạo Select</p>");
        }
        $row = $pdo_stm->fetchAll();
        foreach($row as $row){
            $id = $row[$cotid];
            $ten = $row[$cotname];
            if( $id == $selectedid){
                echo "<option value='$id' id='$id' selected> $ten </option>\n";
            }else{
                echo "<option value='$id' id='$id' > $ten </option>\n";
            }
        }
    }
    function addHero($name,$idrole,$idtier,$anh,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$upskill,$hard,$bangngoc,$trangbi){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "INSERT into tbhero values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $data = [$name,$idrole,$idtier,$anh,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$upskill,$hard,$bangngoc,$trangbi];
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute($data);
        $id = $conn->lastInsertId();
        return $id;
    }
    function addHerodetail($id,$winrate,$pickrate,$banrate,$match,$video1,$video2,$video3,$video4,$video5,$mota1,$mota2,$mota3,$mota4,$mota5,$combo,$idh1,$idh2,$idh3,$idh4){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        try {
            $conn->beginTransaction();
            $conn->exec("INSERT into tbban values(null,'$id','$winrate','$pickrate','$banrate','$match')");
            $conn->exec("INSERT into tbvideokill values(null,'$id','$video1','$video2','$video3','$video4','$video5')");
            $conn->exec("INSERT into tbdesckill values(null,'$id','$mota1','$mota2','$mota3','$mota4','$mota5')");
            $conn->exec("INSERT into combo values(null,'$id','$combo')");
            $conn->exec("INSERT into tbcounter values(null,'$id','$idh1')");
            $conn->exec("INSERT into tbcounter values(null,'$id','$idh2')");
            $conn->exec("INSERT into tbcounter values(null,'$id','$idh3')");
            $conn->exec("INSERT into tbcounter values(null,'$id','$idh4')");
           
            $conn->commit();
        } catch (PDOException $e) {
            $conn->rollback();
            echo "Error: " . $e->getMessage();
        }
        return $conn;
    }
    function addPost($title,$anh,$slug,$content,$mota,$time,$status){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "INSERT into tbpost values(null,?,?,?,?,?,?,?)";
        $data = [$title,$anh,$slug,$content,$mota,$time,$status];
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute($data);
        return $ketqua;
    }
    function updatehero($id,$name,$idrole,$idtier,$anh,$noitai,$chieu1,$chieu2,$chieu3,$chieu4,$upskill,$hard,$bangngoc,$trangbi){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "UPDATE tbhero 
                                Set namehero = '$name',idrole = '$idrole',idtier = '$idtier',img = '$anh', intrinsic = '$noitai',
                                    skill1 = '$chieu1',skill2 = '$chieu2',skill3 = '$chieu3',skill4 = '$chieu4',upskill= '$upskill', hard = '$hard',
                                    runes = '$bangngoc', items = '$trangbi' WHERE idhero = $id ";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        return $ketqua;
    }
    function updateherodetail($id,$winrate,$pickrate,$banrate,$match,$video1,$video2,$video3,$video4,$video5,$mota1,$mota2,$mota3,$mota4,$mota5,$combo,$idcount1,$idcount2,$idcount3,$idcount4,$idh1,$idh2,$idh3,$idh4){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        try {
            $conn->beginTransaction();
            $conn->exec("UPDATE tbban 
                            SET winrate='$winrate',pickrate='$pickrate',banrate='$banrate',matchs='$match' WHERE idhero = $id");
            $conn->exec("UPDATE tbvideokill 
                            SET videoint='$video1',video1='$video2',video2='$video3',video3='$video4',video4='$video5' WHERE idhero = $id");
            $conn->exec("UPDATE tbdesckill 
                            SET descint='$mota1',desc1='$mota2',desc2='$mota3',desc3='$mota4',desc4='$mota5' WHERE idhero = $id");
             $conn->exec("UPDATE combo 
             SET imgcombo='$combo' WHERE idhero = $id");
              $conn->exec("UPDATE tbcounter SET counter= '$idh1' WHERE id = $idcount1");
              $conn->exec("UPDATE tbcounter SET counter= '$idh2' WHERE id = $idcount2");
              $conn->exec("UPDATE tbcounter SET counter= '$idh3' WHERE id = $idcount3");
              $conn->exec("UPDATE tbcounter SET counter= '$idh4' WHERE id = $idcount4");
            $conn->commit();
        } catch (PDOException $e) {
            $conn->rollback();
            echo "Error: " . $e->getMessage();
        }
        return $conn;
    }
    function deletehero($id){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        try {
            $conn->beginTransaction();
            $conn->exec("DELETE from tbhero where idhero = $id");
            $conn->exec("DELETE from tbban where idhero = $id");
            $conn->exec("DELETE from tbvideokill where idhero = $id");
            $conn->exec("DELETE from tbdesckill where idhero = $id");
            $conn->exec("DELETE FROM combo WHERE idhero = $id");
            $conn->exec("DELETE FROM tbcounter WHERE idhero = $id");
            $conn->commit();
        } catch (PDOException $e) {
            $conn->rollback();
            echo "Error: " . $e->getMessage();
        }
        return $conn;
    }
    function to_slug($str) {
        $str = trim(mb_strtolower($str));
        $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
        $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
        $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
        $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
        $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
        $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
        $str = preg_replace('/(đ)/', 'd', $str);
        $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
        $str = preg_replace('/([\s]+)/', '-', $str);
        return $str;
    }
    
?>