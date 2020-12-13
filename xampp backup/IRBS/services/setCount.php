<?php
session_start();

if (isset($_POST['count'])) {
    if (!isset($_POST['id'])) {
        $_SESSION['temp_rooms'] = $_SESSION['rooms'];
        $_SESSION['temp_total'] = $_SESSION['total'];
        $_SESSION['tax'] = $_SESSION['temp_total'] * 0.06;
        $payload = array(
            "temp_total" => $_SESSION['temp_total'],
            "tax" => $_SESSION['tax'],
            "rooms" => $_SESSION['temp_rooms']
        );
        echo json_encode($payload);
    } else {
        //do totals
        $_SESSION['temp_rooms'] = $_SESSION['rooms'];
        $_SESSION['Extra Breakfast'] = $_POST['count'];
        $addon_total = $_SESSION['Extra Breakfast'] * $_SESSION['Extra Breakfast_val'];
        $_SESSION['temp_total'] = $_SESSION['total'] + $addon_total;
        $_SESSION['tax'] = $_SESSION['temp_total'] * 0.06;

        //do individual room
        foreach ($_SESSION['temp_rooms'] as $key => $val) {
            if (in_array($key, $_POST['id'])) {
                $_SESSION['temp_rooms'][$key] = $val + $_SESSION['Extra Breakfast_val'];
            }
        }
        $payload = array(
            "temp_total" => $_SESSION['temp_total'],
            "tax" => $_SESSION['tax'],
            "rooms" => $_SESSION['temp_rooms']
        );
        echo json_encode($payload);
    }
}
