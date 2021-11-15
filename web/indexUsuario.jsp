<%-- 
    Document   : indexUsuario
    Created on : 14/11/2021, 11:54:49 PM
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
        <div class="container-fluid" ng-app="usuario" ng-controller="usuarioController as uc" >
            <div class="row">
                <div class="col-2"><h1>Bienvenid@</h1></div>
                <div class="col-3"> <div class="p-3 mb-2 bg-info text-white">{{uc.userName}}</div></div>                   
            </div>
            <div class="row">
                <div class="col-6"><h4>Inspeccione sus datos, reporte cualquier novedad con el funcionario correspondiente a su zona</h4></div>                
            </div>
        </div>
        <script>
            var app = angular.module('usuario', []);
            app.controller('usuarioController', ['$http', controladorUsuario]);
            function controladorUsuario($http) {
                var uc = this;
                uc.userName = document.cookie;
            }
        </script>
    </body>
</html>
