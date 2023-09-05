<?php
    function UploadAnh($inputName, $Folder)
    {
        $filename="";//tên tệp upload sẽ lưu trên máy chủ
        $temptFile="";//đường dẫn tệp tạm đã upload trên máy chủ
        $errors =  array();//mảng chứa thông báo lỗi
        if(isset($_FILES[$inputName])&&$_FILES[$inputName]["error"]==0)
        {
            $filename = $_FILES[$inputName]["name"];//lấy tên của file ảnh gốc
            $temptFile = $_FILES[$inputName]["tmp_name"];//lấy đường dẫn file ảnh đã upload trên thư mục tạm
            //kiểm tra kích thước tệp không quá 1MB
            $file_size = $_FILES[$inputName]["size"];//kích thước tệp đơn vị byte
            if($file_size > 1048576*10)//nếu kích thước > 2MB
            {
                $errors[] = "<p>Lỗi upload ảnh do vượt quá kích thước</p>";
            }
            //kiểm tra kiểu file
            $arr = explode('.',$filename);//tách tên file thành mảng các chuỗi cách nhau bởi dấu chấm
            $duoitep=strtolower(end($arr));//lấy phần đuôi tệp và chuyển thành chữ thường
            $hople = ["jpg","png","gif","jped","jpeg"];//mảng chứa các đuôi cho phép
            $finaimg="";
            if(in_array($duoitep,$hople)==false)//nếu đuôi tệp không nằm trong danh sách hợp lệ
            {
                $errors[] = "<p>Lỗi upload ảnh do sai loại tệp</p>";
            }else{
                if(!file_exists('image/'.$filename)){
                    move_uploaded_file($temptFile,"$Folder/$filename");
                    $finaimg = $filename;
                }else{
                    $filename =str_replace('.','-', basename($filename,$duoitep));
                    $newfilename = $filename.time().".".$duoitep;
                    move_uploaded_file($temptFile,"$Folder/$filename");
                    $finaimg = $newfilename;
                }
            }
            //kiểm tra và báo lỗi
            if(empty($errors)==false)//nếu không có lỗi
            {
                print_r($errors);
                die("<p> LỖI UPLOAD ẢNH</p>");
            }
            return $finaimg;
        }
        
    }
    function UploadVideo($inputName, $Folder)
    {
        $filename="";//tên tệp upload sẽ lưu trên máy chủ
        $temptFile="";//đường dẫn tệp tạm đã upload trên máy chủ
        $errors =  array();//mảng chứa thông báo lỗi
        if(isset($_FILES[$inputName])&&$_FILES[$inputName]["error"]==0)
        {
            $filename = $_FILES[$inputName]["name"];//lấy tên của file ảnh gốc
            $temptFile = $_FILES[$inputName]["tmp_name"];//lấy đường dẫn file ảnh đã upload trên thư mục tạm
            //kiểm tra kích thước tệp không quá 1MB
            $file_size = $_FILES[$inputName]["size"];//kích thước tệp đơn vị byte
            if($file_size > 1048576*30)//nếu kích thước > 2MB
            {
                $errors[] = "<p>Lỗi upload video do vượt quá kích thước</p>";
            }
            //kiểm tra kiểu file
            $arr = explode('.',$filename);//tách tên file thành mảng các chuỗi cách nhau bởi dấu chấm
            $duoitep=strtolower(end($arr));//lấy phần đuôi tệp và chuyển thành chữ thường
            $hople = ["mp4","avi","3gp","mov","mpeg","webm"];//mảng chứa các đuôi cho phép
            if(in_array($duoitep,$hople)==false)//nếu đuôi tệp không nằm trong danh sách hợp lệ
            {
                $errors[] = "<p>Lỗi upload ảnh do sai loại tệp</p>";
            }
            //kiểm tra và báo lỗi
            if(empty($errors)==true)//nếu không có lỗi
                move_uploaded_file($temptFile,"$Folder/$filename");
            else
            {
                print_r($errors);
                die("<p> LỖI UPLOAD ẢNH</p>");
            }
        }
        return $filename;
    }
?>