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
?>