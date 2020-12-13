<?php
require __DIR__ . './vendor/autoload.php';
use \Firebase\JWT\JWT;

$secret_key = "test";
setcookie('refresh_token','test',[
    'expires'=>time()+3600,
    'path'=>'/',
    'domain'=>'localhost',
    'secure'=>null,
    'httponly'=>true,
    'samesite'=>'None'
]);
//$headers = apache_request_headers();
//if(isset($headers['Authorization']) && isset($headers['x-refresh-token'])){
//    $token = $headers['Authorization'];
//    $refreshToken = $headers['x-refresh-token'];
//    //go through database of refresh tokens
//    
//    //if statement is just a placeholder
//    if($token=="MY_AUTHORITY"){
//        if(isset($_POST) && !empty($_POST)){
//            $data = json_decode(file_get_contents("php://input"), true);
//            if($data['option']=='set_jwt'){
//                //set expiry date
//                $timezone = new DateTimeZone('Asia/Kuching');
//                $minutes = new DateTime();
//                $minutes->setTimezone($timezone);
//                $minutes->modify('+30 months');
//                
//                //set jwt token
//                
//                $payload = array(
//                    "data"=>$data['cookie_value']
//                );
//                $jwt = JWT::encode($payload,$key);
//                //set cookie with the jwt token
//                setcookie('refresh_token',$jwt,[
//                    'expires'=>$minutes->getTimestamp(),
//                    'path'=>'/',
//                    'domain'=>null,
//                    'secure'=>null,
//                    'httponly'=>true,
//                    'samesite'=>'Strict'
//                ]);
//            }
//            
//            if($data['option']=='get_jwt'){
//                if($_COOKIE['refresh_token']==$refreshToken){
//                    echo "their the same!";
//                }else{
//                    echo "their not the same!";
//                }
//            }
//        }
//    }
//    
//}else{
//    echo "No Auth in headers!";
//}


?>
