<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <title>Availability</title>
</head>

<body>
    <div class="container-fluid">
        <!--Screens lg and above -->
        <!--block on md screens because it looks ugly af-->

        <!--
        <div class="row">
            <div class="col-md-12 p-0">
                <img class="img-fluid" src="images/banner.png" style="width:100%;max-height:300px;" />
            </div>
        </div>
-->

        <div class="row pb-3 pt-2" style="background-color:#042a3d">
            <div class="col-md-10 offset-md-1 text-light">
                <form class="form-inline row">
                    <div class="col-6 col-md-4">
                        <!--js version-->
                        <p class="mb-1">Check in</p>
                        <input type="text" id="startDate" style="width:100%" class="form-control" required="required" />
                    </div>
                    <div class="col-6 col-md-4">
                        <!--js version-->
                        <p class="mb-1">Check out</p>
                        <input type="text" id="endDate" style="width:100%" class="form-control" required="required" />
                    </div>
                    <div class="col-12 col-md-4 text-center" style="margin-top:25px">
                        <button style="width:100%" id="availSubmit" class="btn btn-primary">Check Availability</button>
                    </div>
                </form>
            </div>
        </div>

    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!--datepicker-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>





    <script type="module" src="js/test-import.js"></script>
    <script src="js/check_availability.js"></script>
</body>

</html>
