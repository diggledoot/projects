<!doctype html>

<!-- data-ng-app="pigeon-table" in the html is essential to inject ngPigeon-table into the webpage-->

<html lang="en" data-ng-app="pigeon-table">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- The includes.php file is required to include all necessary dependencies-->

    <?php
		include "pigeon-table/php/includes.php"
	?>
    <title>Pass Task 8 - Pigeon Table</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>Male Actors Only Table</h1>
                <!-- View Data in table form -->
                <pigeon-table 
                              query="SELECT * FROM actor where gender='M'" 
                              editable="true" 
                              control="true">
                </pigeon-table>
            </div>
            <div class="col-md-6">

                <div class="row">
                    <div class="col-md-12">
                        <h1>Count of Movies based on Movie Colour Name</h1>
                        <pigeon-table 
                                      query="SELECT c.COLOURNAME,count(*) 'Count' FROM colourtype c INNER JOIN movie m ON m.COLOURCODE = c.COLOURCODE GROUP BY c.COLOURCODE" 
                                      editable="false" 
                                      control="true">
                        </pigeon-table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h1>Count of Movies based on Movie Rating Code</h1>
                        <pigeon-table 
                                      query="SELECT r.RATINGCODE, COUNT(*) 'Number of movies' FROM rating r INNER JOIN movie m ON m.RATINGCODE=r.RATINGCODE GROUP BY r.RATINGCODE" 
                                      editable="false" 
                                      control="true">
                        </pigeon-table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
