<?php
    function ConnectDB(){
        $conn = null;
         try{
            $conn = new PDO("mysql:host=localhost:3306;dbname=lolalytic","root","");
            $conn->query("SET NAMES UTF8");
        }catch(PDOException $ex){
            echo "<p>".$ex->getMessage()."</p>";
            die('<h3> Lỗi kết nối CSDL</h3>');
        }
        return $conn;
    }
    function getlistHero(){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbHero order by namehero asc ";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getHeros($limit){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbHero order by idhero desc limit $limit" ;
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getlistHeroTier($tier){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbHero where idtier = $tier";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getlistHeroRole($role){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbHero  where  idrole = $role order by namehero asc";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getHero($id){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT v.*,d.*,h.*,b.*,r.*,t.*,c.* from tbvideokill as v
                                    INNER JOIN tbdesckill as d on v.idhero=d.idhero
                                    INNER join tbhero as h on v.idhero=h.idhero
                                    INNER JOIN tbban as b on v.idhero=b.idhero
                                    INNER JOIN tbrole as r on h.idrole= r.idrole
                                    INNER JOIN tbtierlist as t on h.idtier= t.idtier
                                    INNER JOIN combo as c on v.idhero= c.idhero
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
    function getlistPost(){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        if(isset($_GET['pages'])){
            $page=$_GET['pages'];

        }else{
            $page=1;
        }
        $rows=6; $from=($page-1)*$rows;
        $sql = "SELECT * from tbpost where status=0 order by idpost desc limit $from , $rows";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getPosts($limit){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbpost order by idpost desc limit $limit";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetchAll(PDO::FETCH_BOTH);
            return $row;
        }
    }
    function getPost($link){
        $conn = ConnectDB();
        if($conn == null){
            return null;
        }
        $sql = "SELECT * from tbpost where slug = '$link'";
        $pdo_stm = $conn->prepare($sql);
        $ketqua = $pdo_stm->execute();
        if($ketqua == false){
            return false;
        }else{
            $row = $pdo_stm -> fetch(PDO::FETCH_BOTH);
            return $row;
        }
    }
?>