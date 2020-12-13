<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Session Test Grounds</title>
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <?php

                session_start();
                $_SESSION['rooms'] = array(846, 846);
                $_SESSION['total'] = array_sum($_SESSION['rooms']);
                $_SESSION['temp_rooms'] = $_SESSION['rooms'];
                $_SESSION['temp_total'] = $_SESSION['total'];
                $_SESSION['tax'] = $_SESSION['temp_total'] * 0.06;

                //grab data from db
                $conn = mysqli_connect('localhost', 'root', '', 'ihosting_r2g');
                $stmt = $conn->prepare('SELECT * FROM extras WHERE name=?');
                $name = 'Extra Breakfast';
                $stmt->bind_param('s', $name);
                $stmt->execute();
                $res = $stmt->get_result();
                if ($res->num_rows > 0) {
                    while ($data = $res->fetch_assoc()) {
                        $_SESSION[$data['name']] = 0;
                        $_SESSION[$data['name'] . '_val'] = $data['charge_value'];
                    }
                }

                ?>
                <!--                <button class="btn btn-primary" id="btn_getValue">Get session value!</button>-->

                <button class="btn btn-primary" id="btn_unsetValue">Unset session value!</button>

                <!-- <div class="subtotal">
                    <h2><?php echo $_SESSION['rooms'][0] ?></h2>
                    <input type="checkbox" class="form-control checkbox_test" name="checkbox_test" value="<?php echo $_SESSION['Extra Breakfast_val'] ?>" />

                </div> -->

                <?php
                foreach ($_SESSION['temp_rooms'] as $key => $val) { ?>
                    <div class="subtotal">
                        <h2 id="<?php echo $key; ?>"><?php echo $val ?></h2>
                        <input type="checkbox" class="form-control checkbox_test" name="checkbox_test" value="<?php echo $_SESSION['Extra Breakfast_val'] ?>" />

                    </div>
                <?php
                }
                ?>
                <!-- <input type="checkbox" class="form-control checkbox_test" name="checkbox_test" value="<?php echo $_SESSION['Extra Breakfast_val'] ?>" /> -->


                <h1>Total <span id="total"><?php echo $_SESSION['temp_total']; ?></span></h1>
                <h1>Total <span id="tax"><?php echo $_SESSION['tax']; ?></span></h1>

            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script>
        $(document).ready(() => {
            //to be used for self refresh and stuff
            //            var dir = location.href.split('/').pop();
            //            var count = $('input[type="checkbox"]').length;
            //            console.log(count);
            //            $('#btn_getValue').on('click', () => {
            //                $.ajax({
            //                    type: "GET",
            //                    url: 'http://localhost/IRBS/services/getValue.php',
            //                    success: (res) => {
            //                        alert(res);
            //                    },
            //                    error: (err) => {
            //                        console.log(err);
            //                    }
            //                })
            //            })
            //
            $('#btn_unsetValue').on('click', () => {
                $('input[name="checkbox_test"]').prop("checked", false);
                $.ajax({
                    type: "GET",
                    url: 'http://localhost/IRBS/services/unsetValue.php',
                    success: (res) => {
                        alert(res);
                    }
                })
            })
            $('.checkbox_test').on('click', () => {
                // var id = $(e.currentTarget).parent('div.subtotal').find('h2').attr('id');
                var checked_id = [];
                $('.checkbox_test').each(function(index, object) {
                    if (this.checked === true) {
                        let id = $(this).parent('div.subtotal').find('h2').attr('id');
                        checked_id.push(parseInt(id));
                    }
                })
                // console.log(checked_id);
                var count = $('input[name=checkbox_test]:checked').length;
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost/IRBS/services/setCount.php',
                    data: {
                        id: checked_id,
                        count: count
                    },
                    success: (res) => {
                        let data = $.parseJSON(res);
                        $('#total').html(data['temp_total']);
                        $('#tax').html(data['tax']);
                        // $('.subtotal h2').each(function(index, object) {
                        //     // let temp = parseInt($(object).attr('id'));
                        //     // console.log(temp);
                        // })
                        for (var i = 0; i < data['rooms'].length; i++) {
                            $('#' + i).html(data['rooms'][i]);
                        }


                    }
                })

            })
        })
    </script>
</body>

</html>