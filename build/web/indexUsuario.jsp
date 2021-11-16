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
        <jsp:include page="menuUser.jsp"/>
        <div class="container-fluid" ng-app="usuario" ng-controller="usuarioController as uc" >
            <div class="row">
                <div class="col-10">
                    <div class="row">                  
                        <div class="col-3"><h1>Bienvenid@</h1></div>
                        <div class="col-3"> <div class="p-3 mb-2 bg-info text-white">{{uc.Usuario.nombreUsuario}}</div></div>                   
                    </div>
                    <div class="row">
                        <div class="col-6"><h4>Inspeccione sus datos, reporte cualquier novedad con el funcionario correspondiente a su zona</h4></div>                
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>idUsuario</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{uc.Usuario.idUsuario}}">
                        </div>
                        <div class="col-3"> 
                            <label>Nombre de Usuario</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.Usuario.nombreUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>Tipo de Documento</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{uc.Usuario.tipoDocumento}}">
                        </div>
                        <div class="col-3"> 
                            <label># de Documento</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.Usuario.documentoUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{uc.Usuario.edad}}">
                        </div>
                        <div class="col-3"> 
                            <label>Municipio</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.Usuario.municipio}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>Telefono</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{uc.Usuario.telefono}}">
                        </div>
                        <div class="col-3"> 
                            <label>email</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.Usuario.email}}">
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <div class="col-3">
                    <div class="row">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#verMasModal" ng-click="uc.listar()">Mostrar Vecinos</button> 
                    </div>
                </div>
            </div> 

            <!-- Modal Para ver vecinos y datos de contacto-->
            <div class="modal fade" id="verMasModal" tabindex="-1" aria-labelledby="verMasModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="verMasModalLabel">Vecinos de Mocoa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">nombre Usuario</th>
                                            <th scope="col">Perfil</th>
                                            <th scope="col">edad</th>
                                            <th scope="col">Municipio</th>
                                            <th scope="col">Telefono</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Funciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="u in uc.Usuarios">
                                            <td>{{u.nombreUsuario}}</td>
                                            <td>{{u.tipoPerfil}}</td>
                                            <td>{{u.edad}}</td>
                                            <td>{{u.municipio}}</td>
                                            <td>{{u.telefono}}</td>
                                            <td>{{u.email}}</td>                        
                                            <td>
                                                <button type="button" class="btn btn-info" ng-click="">Solicitar Contacto</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('usuario', []);
            app.controller('usuarioController', ['$http', controladorUsuario]);
            function controladorUsuario($http) {
                var uc = this;
                var user;
                uc.userName = document.cookie;
                this.user = document.cookie;
                uc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.Usuarios = res.data.Usuarios;
                    });
                };
                uc.comprobar = function () {
                    var parametros = {
                        proceso: 'consultaUsuario',
                        usuario: this.user
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.Usuario = res.data.Usuario;
                    });
                };
                window.onload = uc.comprobar();
            }
        </script>
    </body>
</html>
