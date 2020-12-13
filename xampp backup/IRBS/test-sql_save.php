<?php
include('./services/ini.php');
$item = array();
$exist = sql_read("SELECT * FROM carts WHERE id=?", 'i', array(517));
if (!empty($exist)) {
    $item['id'] = $exist[0]['id'];
}
$item['add_on_qty'] = 1;
sql_save('carts', $item);
