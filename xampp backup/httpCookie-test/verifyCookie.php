<?php

if(isset($_COOKIE['refresh_token'])){
    echo $_COOKIE['refresh_token'];
}else{
    echo 'cookie no exist';
}
?>