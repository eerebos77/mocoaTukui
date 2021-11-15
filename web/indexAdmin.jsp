<%-- 
    Document   : index
    Created on : 2/11/2021, 08:24:42 AM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <link rel="stylesheet" href="css/general.css">
        <title>Administrador</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid" ng-app="admin" ng-controller="adminController as ac" >
            <div class="row">
                <div class="col-2"><h1>Bienvenid@</h1></div>
                <div class="col-3"> <div class="p-3 mb-2 bg-info text-white">{{ac.userName}}</div></div>                   
            </div>
            <div class="row">
                <div class="col-6"><h3>Usted tiene privilegios de Administrador</h3></div>                
            </div>
        </div>
        <script>
            var app = angular.module('admin', []);
            app.controller('adminController', ['$http', controladorAdmin]);
            function controladorAdmin($http) {
                var uc = this;
                uc.userName = document.cookie;
            }
        </script>
    </body>
</html>
