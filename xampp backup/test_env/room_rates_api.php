<?php
//    $conn = mysqli_connect("localhost","root","","ihosting_r2g");
    $check_in = isset($_POST['check_in']) ? $_POST['check_in'] : date('Y/m/d');
    $check_out = isset($_POST['check_out']) ? $_POST['check_out'] : date('Y/m/d', time() + 86400);

    $approval = 'Approved';
    $range = 'All Time';
    $branch = $_SESSION['branch_id'];
//    $branch=11;

    $_SESSION['check_in'] = $check_in;
    $_SESSION['check_out'] = $check_out;

    $sql = "SELECT room_types.id, room_types.name, room_types.room_category_name, room_types.image, room_types.image1, room_types.image2, room_types.guest_options, room_types.guest_max, room_types.early_bird_discount, room_types.early_bird_entitlement, room_types.duration_of_entitlement, room_types.early_bird_promo,
        rates.per_night_0, room_stocks.qty , room_types.min_night, room_types.room_description, room_types.breakfast, room_types.breakfast_x2, room_types.pay_later, room_types.no_deposit, room_types.lowest_price_now
        FROM room_types INNER JOIN rates ON room_types.id = rates.room_type_id INNER JOIN room_stocks ON room_types.id = room_stocks.room_type_id WHERE rates.status = ? AND room_stocks.range_type = ? AND room_stocks.branch_id = ? ORDER BY position ASC";

    $json_response = array();

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssi", $approval, $range, $branch);
    $stmt->execute();
    $result = $stmt->get_result();
    

    while ($row = mysqli_fetch_array($result)) {
        $row_array = array();

        $total = 0;
        $count = 0;
        $nights = 0;

        $promo = $row['early_bird_promo'];
        $entitle = $row['early_bird_entitlement'];
        $discount = $row['early_bird_discount'];
        $duration = $row['early_bird_duration'];

        $promo = $row['early_bird_promo'];
        $entitle = $row['early_bird_entitlement'];
        $discount = $row['early_bird_discount'];
        $duration = $row['duration_of_entitlement'];

        $promo_date_start = date('Y-m-d', strtotime(' +' . $entitle . ' day'));
        $promo_date_end = date('Y-m-d', strtotime($promo_date_start . ' +' . $duration . ' day'));


        $room_id = $row['id'];
        
        $row_array['id'] = $row['id'];
        $row_array['name'] = $row['name'];
        $row_array['category'] = $row['room_category_name'];
        $row_array['image'] = $row['image'];
        $row_array['image1'] = $row['image1'];
        $row_array['image2'] = $row['image2'];
        $row_array['noGuests'] = $row['guest_options'];
        $row_array['maxGuests'] = $row['guest_max'];
        $row_array['min_night'] = $row['min_night'];
        $row_array['room_description'] = $row['room_description'];

        $row_array['breakfast'] = $row['breakfast'];
        $row_array['breakfast_x2'] = $row['breakfast_x2'];
        $row_array['pay_later'] = $row['pay_later'];
        $row_array['no_deposit'] = $row['no_deposit'];
        $row_array['lowest_price_now'] = $row['lowest_price_now'];

        $row_array['stocks'] = $row['qty'];
        $row_array['check_in'] = $check_in;
        $row_array['check_out'] = $check_out;
        $row_array['room_qty'] = $qty;
        $row_array['nights'] = $nights;

        $last_night = date('Y/m/d', strtotime($check_out . ' -1 day'));

        $query = "SELECT date, rate FROM daterates WHERE room_type_id = ? AND date BETWEEN ? AND ?";

        $stmt2 = $conn->prepare($query);
        $stmt2->bind_param("iss", $room_id, $check_in, $last_night);
        $stmt2->execute();
        $rates = $stmt2->get_result();

        while ($rates_query = mysqli_fetch_array($rates)) {

            $date = $rates_query['date'];

            if (($date >= $promo_date_start) && ($date < $promo_date_end) && $promo === "On") {
                $rate = $rates_query['rate'] * ((100 - $discount) / 100);
            } else {
                $rate = $rates_query['rate'];
            }

            $total += $rate;
            $nights += 1;

            $row_array['rates'][] = array(
                'date' => $date,
                'rate' => $rate,
            );
        }

        $row_array['nights'] = $nights;
        $row_array['total'] = $total;

        $query = "SELECT * FROM extras";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $extras = $stmt->get_result();
        $pattern = "/\b".$room_id."\b/";
        $extras_array = array();
        while($extra = mysqli_fetch_array($extras)){
            $temp=array();
            if(preg_match($pattern,$extra['room_types'])){
                $temp['id'] = $extra['id'];
                $temp['name'] = $extra['name'];
                $temp['desc'] = $extra['description'];
                $temp['room_types'] = $extra['room_types'];
                $temp['charge_value'] = $extra['charge_value'];
                $temp['maximum_qty'] = $extra['maximum_qty'];
                array_push($extras_array,$temp);
            }
        }
        $row_array['extras'] = $extras_array;
        array_push($json_response, $row_array);
    }
    $json =  json_encode($json_response);
//    var_dump($json_response);
?>