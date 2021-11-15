<%-- 
    Document   : indexJac
    Created on : 14/11/2021, 11:49:17 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <link rel="stylesheet" href="css/general.css">
        <title>Funcionario</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid" ng-app="funcionario" ng-controller="funcionarioController as fc" >
            <div class="row">
                <div class="col-2"><h1>Bienvenid@</h1></div>
                <div class="col-3"> <div class="p-3 mb-2 bg-info text-white">{{fc.userName}}</div></div>                   
            </div>
            <div class="row">
                <div class="col-6"><h3>Usted tiene privilegios de Funcionario</h3></div>                
            </div>
        </div>
        <script>
            var app = angular.module('funcionario', []);
            app.controller('funcionarioController', ['$http', controladorFuncionario]);
            function controladorFuncionario($http) {
                var fc = this;
                fc.userName = document.cookie;
            }
        </script>
    </body>
</html>
