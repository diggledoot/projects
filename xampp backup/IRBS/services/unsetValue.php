<?php

session_start();
unset($_SESSION['Extra Breakfast']);
unset($_SESSION['temp_total']);
echo "Session reset!";
?>