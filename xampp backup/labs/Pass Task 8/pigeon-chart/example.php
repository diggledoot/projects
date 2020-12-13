<!doctype html>
<html lang="en" data-ng-app="pigeon-chart" data-ng-cloak>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Pass Task 8 - Pigeon Chart</title>
    <?php
		include "pigeon-chart/php/includes.php"
	?>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <pigeon-chart 
                              query="SELECT RELYEAR,ROUND(AVG(TMDB_SCORE),1)'AVERAGE RATING FOR THAT YEAR' FROM movie GROUP BY RELYEAR" 
                              title="Average Movie Rating by Release Year" 
                              subtitle="Year 1953 to Year 2016" 
                              type="spline" 
                              axis-y-title="TMDB Score" 
                              show-legend="bottom" 
                              show-data-label="true" 
                              zoom-type="xy">
                </pigeon-chart>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <pigeon-chart 
                              query="SELECT colourcode,count(*)'Number of Movies' FROM movie GROUP BY colourcode" 
                              title="Number of Movies " 
                              subtitle="based on Movie Colour Code" 
                              type="column" 
                              axis-y-title="Number of Movies" 
                              axis-x-title="Movie Colour Code" 
                              show-legend="bottom" 
                              show-data-label="true" 
                              zoom-type="x">
                </pigeon-chart>
                <div class="d-flex justify-content-center">
                    <ul>
                        <li>B refers to Black and White Movie</li>
                        <li>C refers to Colour Movie</li>
                    </ul>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <pigeon-chart 
                              query="SELECT gender,count(*)'Total' FROM actor GROUP BY gender" 
                              title="Gender Distribution" 
                              subtitle="of Actors" 
                              type="pie" 
                              axis-y-title="Total" 
                              show-legend="right" 
                              show-data-label="true">

                </pigeon-chart>
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
