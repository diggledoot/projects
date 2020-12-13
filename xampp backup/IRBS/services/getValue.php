<?php
session_start();

if(isset($_SESSION['Extra Breakfast'])){
    var_dump($_SESSION);
}else{
    echo "No count!";
}


?>