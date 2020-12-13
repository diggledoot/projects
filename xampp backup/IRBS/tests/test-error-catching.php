<?php
include('../services/ini.php');
try {
    $res = sql_read('SELECT * FROM carts WHERE id=?', 'i', array(513));
    if (empty($res)) {
        throw new Exception("No value!");
    } else {
        header('Content-type:application/json');
        echo json_encode($res[0]);
    }
} catch (Exception $e) {
    echo "Caught exception: ", $e->getMessage();
}
