var app = angular.module("myApp", []);

//highchart directive
app.directive('highchart', function () {
    var direc = {};
    var link = function (scope, element, attributes) {
        scope.$watch(function () {
            return attributes.chart;
        }, function () {
            var charts = JSON.parse(attributes.chart);
            $(element[0]).highcharts(charts);
        })
    }
    direc.restrict = 'E';
    direc.link = link;
    direc.template = '<div></div>';
    //the replace method replaces the content inside the element it is called
    direc.replace = true;
    direc.scope = {};
    return direc;
})


app.controller("myCtrl", ['$scope', '$http', '$filter', function ($scope, $http, $filter) {
    $http.get('data/data.json')
        .then(function (response) {
                $scope.units = response.data;
        
                //filter is used to count data with specific value
                $scope.count_core = $filter('filter')(response.data, {
                    type: 'Core'
                }).length;
                $scope.count_sd = $filter('filter')(response.data, {
                    type: 'Software Development'
                }).length;
                $scope.count_sa = $filter('filter')(response.data, {
                    type: 'Systems Analysis'
                }).length;

                $scope.chart = {
                    chart: {
                        type: "column",
                    },
                    title: {
                        text: 'Units offered for Bachelor of Information and Communication Technology'
                    },

                    subtitle: {
                        text: 'from Swinburne University of Technology'
                    },
                    xAxis: {
                        categories: ['Unit Type']
                    },
                    yAxis: {
                        title: {
                            text: 'Number of units'
                        }
                    },
                    legend: {
                        layout: 'horizontal'
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true
                            }
                        }
                    },

                    series: [{
                        name: 'Core',
                        data: [$scope.count_core],
                        color: '#03fcfc'
                    }, {
                        name: 'Software Development',
                        data: [$scope.count_sd],
                        color: '#03fc80'
                    }, {
                        name: 'Systems Analysis',
                        data: [$scope.count_sa],
                        color: '#fc8403'
                    }]
                }
            },
            function (response) {
                if (response) {
                    $scope.units = "no data";
                }
            });
    $scope.radio = {
        type: ''
    };
    $scope.unit = {
        code: '',
        desc: ''
    };

}]);
