<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>QR Decoder</title>
</head>

<body>
    <h1>Scan from WebCam:</h1>
    <div>
        <b>Device has camera: </b>
        <span id="cam-has-camera"></span>
        <br>
        <video muted playsinline id="qr-video"></video>
    </div>
    <div>
        <select id="inversion-mode-select">
            <option value="original">Scan original (dark QR code on bright background)</option>
            <option value="invert">Scan with inverted colors (bright QR code on dark background)</option>
            <option value="both">Scan both</option>
        </select>
        <br>
    </div>
    <b>Detected QR code: </b>
    <span id="cam-qr-result">None</span>
    <br>
    <b>Last detected at: </b>
    <span id="cam-qr-result-timestamp"></span>
    <hr>

    <h1>Scan from File:</h1>
    <input type="file" id="file-selector">
    <b>Detected QR code: </b>
    <span id="file-qr-result">None</span>






    <!--QR Decoder-->
    <script type="module">
        import QrScanner from './qr-scanner/qr-scanner.min.js';
        QrScanner.WORKER_PATH = './qr-scanner/qr-scanner-worker.min.js';
        
        //Variables for video stream decode
        const video = document.getElementById('qr-video');
        const camHasCamera = document.getElementById('cam-has-camera');
        const camQrResult = document.getElementById('cam-qr-result');
        
        //camQrResultTimestamp updates whenever a successful QR decode is done
        const camQrResultTimestamp = document.getElementById('cam-qr-result-timestamp');
        
        //Variables for file decode
        const fileSelector = document.getElementById('file-selector');
        const fileQrResult = document.getElementById('file-qr-result');
        
        
        //Helper function to carry out updates to the elements
        //label is the element
        //result is the result of the decode.
        function setResult(label, result) {
            alert("FOUND A QR");
            label.textContent = result;
            camQrResultTimestamp.textContent = new Date().toString();
            label.style.color = 'teal';
            clearTimeout(label.highlightTimeout);
            label.highlightTimeout = setTimeout(() => label.style.color = 'inherit', 100);
        }

        // ####### Web Cam Scanning #######
        
        //check if there is a camera
        QrScanner.hasCamera().then(hasCamera => camHasCamera.textContent = hasCamera);
        
        //create new scanner object,.start to start webcam for scanning.
        const scanner = new QrScanner(video, result => setResult(camQrResult, result));
        scanner.start();

        document.getElementById('inversion-mode-select').addEventListener('change', event => {
            scanner.setInversionMode(event.target.value);
        });

        // ####### File Scanning #######

        fileSelector.addEventListener('change', event => {
            const file = fileSelector.files[0];
            if (!file) {
                return;
            }
            QrScanner.scanImage(file)
                .then(result => setResult(fileQrResult, result))
                .catch(e => setResult(fileQrResult, e || 'No QR code found.'));
            
            //Below QrScanner is default, results can be pasted anywhere.
//            QrScanner.scanImage(image)
//                .then(result => console.log(result))
//                .catch(error => console.log(error || 'No QR code found.'));
        });
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
