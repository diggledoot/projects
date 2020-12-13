<?php
require __DIR__ . '/vendor/autoload.php';//should html level, the vendor file i mean

use \Firebase\JWT\JWT; //include the namespace for the firebase-jwt-php library




function checkValidToken($bool){
    if($bool){
        echo 1;
    }else{
        echo 0;
    }
}

if(isset($_POST['token'])){
    //set timezone to check difference but really no difference, since time is set in UTC and the difference is the same
    date_default_timezone_set('Asia/Kuching');
    $isUser=false;
    
    $data=$_POST['token'];
    try{
        $decode= JWT::decode($data,"fail",array('HS256'));
        $conn = mysqli_connect("localhost","root","","jwt_test");
    
        $username=get_object_vars($decode)['username'];
        $time = get_object_vars($decode)['time']+1;

        $sql = "SELECT username FROM user WHERE username=?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s",$username);
        $stmt->execute();
        $res = $stmt->get_result();
        $data = $res->fetch_all();

        if(count($data)>0){
            $isUser=true;
        }else{
            $isUser=false;
            echo "user";
        }

        //time takes int current UTC time,now, and compares to stored time from the jwt. This is how you verify the validity of the token. compare the creation time against the current time. if currentime-storedtime exceed certain condition, validity is false. It will prompt the user to make a new one or deny access, depends on you.
        if($isUser){
            $diff = time()-$time;
            $diff = $diff/60/60/24;//converts to days, our condition is that must not be or equal to 7 days since token creation.
            if($diff>=7){
                checkValidToken(false);
            }
            else{
                checkValidToken(true);
            }
        }
    }catch(exception $e){
        echo "Verification failed";
    }
    
    
}else{
    //send data is empty, no token
    echo "Token expired";
}
?>
