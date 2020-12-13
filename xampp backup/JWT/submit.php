<?php

require __DIR__ . '/vendor/autoload.php';//should html level, the vendor file i mean

use \Firebase\JWT\JWT; //include the namespace for the firebase-jwt-php library



if(isset($_POST['username'])){
    $data=$_POST['username'];
    $conn=mysqli_connect("localhost","root","","jwt_test");
    $sqlOrder="INSERT INTO user(u_id,username) VALUES(NULL,'$data')";
    $conn->query($sqlOrder);
    
    $key = "test";
    //time is stored in UTC format, can be converted to any part of the world using timezone
    $payload = array(
        "username"=>$data,
        "time"=>time()
    );

    
    $jwt = JWT::encode($payload, $key);
    echo $jwt;
//    echo $jwt;
//    the below function returns a php object
//    try {
//        $decoded = JWT::decode($jwt, "test", array('HS256'));
//        echo "Valid token";
//    } catch (\Exception $e) { // Also tried JwtException
//        echo 'Invalid token!';
//    }
//    retrives data from the php object, access using key-pair method, e.g. username=>data
//    print_r($decoded);
//    echo get_object_vars($decoded)['username'];
}
?>
