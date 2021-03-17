var app = angular.module("Homeapp", []);



app.controller("HomeController", function ($scope, $http) {

    $scope.btntext = "Save";

    // Add registro

    $scope.savedata = function () {

        $scope.btntext = "Aguarde por favor..";

        $http({

            method: 'POST',

            url: '/Home/Add_registro',

            data: $scope.register

        }).success(function (d) {

            $scope.btntext = "Save";

            $scope.register = null;

            alert(d);

        }).error(function () {

            alert('Houve uma falha...Contate o ADM');

        });

    };

    // Mostra todos os registros de clientes

    $http.get("/Home/Get_registro").then(function (d) {

        $scope.record = d.data;

    }, function (error) {

        alert('Houve uma falha...Contate o ADM');

    });

    //  Mostra registros de cliente pelo id

    $scope.loadrecord = function (id) {

        $http.get("/Home/Get_registrobyid?id=" + id).then(function (d) {

            $scope.register = d.data[0];

        }, function (error) {

            alert('Houve uma falha...Contate o ADM');

        });

    };

    // Delete registro de cliente

    $scope.deleterecord = function (id) {

        $http.get("/Home/delete_registro?id=" + id).then(function (d) {

            alert(d.data);

            $http.get("/Home/Get_registro").then(function (d) {

                $scope.record = d.data;

            }, function (error) {

                alert('Houve uma falha...Contate o ADM');

            });

        }, function (error) {

            alert('Houve uma falha...Contate o ADM');

        });

    };

    // Update registro de clientes

    $scope.updatedata = function () {

        $scope.btntext = "Aguarde por favor..";

        $http({

            method: 'POST',

            url: '/Home/Update_registro',

            data: $scope.register

        }).success(function (d) {

            $scope.btntext = "Update";

            $scope.register = null;

            alert(d);

        }).error(function () {

            alert('Houve uma falha...Contate o ADM');

        });

    };

});
