<?php 
require_once('Ketnoi.php');
if(isset($_REQUEST["id"])==false)
	die("<p>chưa có id đơn hàng</p>");
$id = $_REQUEST["id"];
if($id=="" || is_numeric($id)==false)
	die("<p>id không được rỗng và phải là số</p>");
	$conn = ConnectDB();
        if($conn == null){
            return null;
        }
        try {
            $conn->beginTransaction();
            $conn->exec("DELETE from orders where idorder = $id");
            $conn->exec("DELETE from orders_detail where idod = $id");
            $conn->commit();
        } catch (PDOException $e) {
            $conn->rollback();
            echo "Error: " . $e->getMessage();
        }
if($conn==TRUE)
	{
		sleep(1);
		header('location:../pending-orders.php');
	}
else
	echo "<h3> LỖI Xóa DỮ LIỆU</h3>";
?>