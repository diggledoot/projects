<?php
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: DELETE");


unset($_COOKIE['refresh_token']);
setcookie('refresh_token','delete',[
    'expires'=>-1,
    'path'=>'/',
    'domain'=>'localhost',
    'secure'=>null,
    'httponly'=>true,
    'samesite'=>'Strict'
]);


?>
