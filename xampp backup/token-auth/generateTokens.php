<?php
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST");

require __DIR__ . './vendor/autoload.php';
use \Firebase\JWT\JWT;


if(isset($_POST)){
    //grab secret key from .env file, remember to exclude from gitignore.
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();
    $key = $_ENV['SECRET_KEY'];

    //access post data to for jwt creation
    $data = json_decode(file_get_contents("php://input"), true);
    $timezone = new DateTimeZone('Asia/Kuching');
    $expiry = new DateTime();
    $expiry->setTimezone($timezone);
    $expiry->modify("+2 days");
    
    $date = $expiry->format("Y-m-d H:i:s.v");
    $payload = array(
        "ttl"=>$date,
        "data"=>$data['tokenValue']
        
    );
    $jwt = JWT::encode($payload,$key);
    setcookie('refresh_token',$jwt,[
        'expires'=>$expiry->getTimestamp(),
        'path'=>'/',
        'domain'=>'localhost',
        'secure'=>null,
        'httponly'=>true,
        'samesite'=>'Strict'
    ]);
    
    
}


?>
