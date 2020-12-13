<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Create token page!</title>

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h5>Create a username:<input type="text" name="username" id="username" /></h5>
                <input type="button" id="submit" value="Submit" />

                <input type="button" id="showAPI" value="Show API key stored in cookie" />
                <input type="button" id="time" value="Show me current time" />
                <input type="button" id="delete" value="Delete cookie" />
                <!--
                <h5>Log in:<input type="text" name="username" id="username" placeholder="Enter your username"/></h5>
                <input type="button" id="login" value="Login" />
-->
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!--library to set and get js cookies-->
    <!--Accessible here: https://github.com/js-cookie/js-cookie -->
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
    <!--below is the library for JWT JS version-->
    <!--Accessible here: https://github.com/kjur/jsrsasign -->
    <script language="JavaScript" type="text/javascript" src="http://kjur.github.io/jsrsasign/jsrsasign-latest-all-min.js">
    </script>
    <script>
        $(document).ready(function(){
//            console.log(Cookies.get('api'));
            $.ajax({
                url:"verify.php",
                type:"POST",
                data:{
                    token:Cookies.get('api')
                },
                dataType:'html',
                success:function(data){
                    switch(data){
                        case "1":
                            alert("Proceed");
                            break;
                        case "0":
                            alert("Invalid token");
                            break;
                        case "user":
                            alert("No user found!");
                            break;
                        case "Verification failed":
                            alert("Verification failed");
                            break;
                        default:
                            console.log(data);//token dead, ask user to re-login
                            break;
                    }
                }
            });
        });
        $('#delete').on('click', function() {
            document.cookie=Cookies.remove('api', { path: '/' });
            alert('Cookie deleted');
        });
        $('#time').on('click', function() {
            var date = new Date();
            date.setMonth(date.getMonth() + 1);
            alert(date);
        });

        $("#showAPI").on('click', function() {
            alert(Cookies.get('api'));
        });
        $("#submit").on('click', function() {

            var data = $("#username").val();
            //Below is the JavaScript version of JWT gen and decode
            // Header
            //in the header, specify, encryption algo, and what type of JSON Web Object
            //            var oHeader = {
            //                alg: 'HS256',
            //                typ: 'JWT'
            //            };
            //            
            //            // Payload
            //            var oPayload = {}; //Payload can put anything honestly.
            //            oPayload.username = data//this is how you insert data, through . notation
            //            
            //            // Sign JWT with a password, in this case i used "test"
            //            var sHeader = JSON.stringify(oHeader);
            //            var sPayload = JSON.stringify(oPayload);
            //            var sJWT = KJUR.jws.JWS.sign("HS256", sHeader, sPayload, "test");
            //            console.log(sJWT)//JWT is created
            //            
            //            //Below checks whether JWT is valid, use the secret key "test" as well, a key.
            //            var isValid = KJUR.jws.JWS.verifyJWT(sJWT, "test", {
            //                alg: ['HS256']
            //            });
            //            console.log(isValid);
            //            
            //            //This is how you extract the payload data, access data using .notation as seen in the console.log below
            //            var payloadObj = KJUR.jws.JWS.readSafeJSONString(b64utoutf8(sJWT.split(".")[1]));
            //            console.log(payloadObj.username);
            $.ajax({
                url: "submit.php",
                type: "POST",
                data: {
                    username: data
                },
                dataType: 'html',
                success: function(data) {
                    alert("Successfully inserted!");
                    document.cookie=Cookies.set('api',data,{expires:7});//expires in 7 days
                    console.log(document.cookie);
                }
            });
        });

    </script>
</body>

</html>
