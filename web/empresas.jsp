<%-- 
    Document   : empresas
    Created on : 15/11/2021, 04:26:39 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresas</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid" ng-app="empresas" ng-controller="empresasController as ec" >  
            <div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col-3"><label>Usuario Conectado:</label></div>
                        <div class="col-3"> <p class="text-light bg-dark">{{ec.userName}}</p></div>
                    </div>
                    <br>
                    <!--Seccion 1-->
                    <div class="row">
                        <div class="col-6"> 
                            <label>idEmpresa</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="ec.idEmpresa" >
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de la Empresa</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="ec.nombreEmpresa">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>NIT</label>
                            <input type="text" class="form-control" placeholder="NIT" ng-model="ec.NIT">
                        </div>
                        <div class="col-6"> 
                            <label>Actividad</label>
                            <input type="text" class="form-control" placeholder="Actividad" ng-model="ec.actividad">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Empleados</label>
                            <input type="text" class="form-control" placeholder="# de empleados" ng-model="ec.empleados">
                        </div>
                        <div class="col-6"> 
                            <label>Vacantes</label>
                            <input type="text" class="form-control" placeholder="Vacantes" ng-model="ec.vacantes">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-outline-primary" ng-click="ec.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-outline-primary" ng-click="ec.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-outline-primary" ng-click="ec.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-outline-danger" ng-click="ec.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-3"><label>  </label></div>
                        <div>   </div>
                    </div>
                    <br>
                    <!--seccion 2-->
                    <div class="row">
                        <div class="col-6"></div>
                        <div class="col-6"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">id Empresa</th>
                            <th scope="col">nombre de Empresa</th>
                            <th scope="col">NIT</th>
                            <th scope="col">Actividad</th>
                            <th scope="col">Empleados</th>
                            <th scope="col">Vacantes</th>
                            <th scope="col">Funciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="u in ec.Empresas">
                            <td>{{u.idEmpresa}}</td>
                            <td>{{u.nombreEmpresa}}</td>
                            <td>{{u.NIT}}</td>
                            <td>{{u.actividad}}</td>
                            <td>{{u.empleados}}</td>
                            <td>{{u.vacantes}}</td>                           
                            <td>
                                <button type="button" class="btn btn-info" ng-click="ec.editar(u.idEmpresa)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
                <script>
            var app = angular.module('empresas', []);
            app.controller('empresasController', ['$http', controladorEmpresas]);
            function controladorEmpresas($http) {
                var ec = this;
                ec.userName = document.cookie;
                validar = function (tipoDeValidacion) {
                    var idEmpresa = ec.idEmpresa ? true : false;
                    var nombreEmpresa = ec.nombreEmpresa ? true : false;
                    var NIT = ec.NIT ? true : false;
                    var actividad = ec.actividad ? true : false;
                    var empleados = ec.empleados ? true : false;
                    var vacantes = ec.vacantes ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idEmpresa && nombreEmpresa && NIT && actividad && empleados && vacantes) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'datosSinId') {
                        if (nombreEmpresa && NIT && actividad && empleados && vacantes ) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idEmpresa) {
                            return true;
                        } else {
                            return false;
                        }
                    }

                };
                ec.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesEmpresas.jsp',
                        params: parametros
                    }).then(function (res) {
                        ec.Empresas = res.data.Empresas;
                    });
                };
                ec.guardar = function () {
                    if (validar('datosSinId')) {
                        var parametros = {
                            proceso: 'guardar',
                            nombreEmpresa: ec.nombreEmpresa,
                            NIT: ec.NIT,
                            actividad: ec.actividad,
                            empleados: ec.empleados,
                            vacantes: ec.vacantes
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesEmpresas.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                    //alert('Guardó');
                                    swal({
                                        title: "Hecho",
                                        text: "Guardado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    // alert('No guardó');
                                    swal({
                                        title: "Error",
                                        text: "No guardado!",
                                        icon: "error",
                                        button: "Volver"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        //alert('El campo nombre el obligatorio');
                        swal({
                            title: "No Ejecutado",
                            text: "El campo nombre es obligatorio",
                            icon: "warning",
                            button: "Cerrar"
                        });

                    }

                };
                ec.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idEmpresa: ec.idEmpresa,
                            nombreEmpresa: ec.nombreEmpresa,
                            NIT: ec.NIT,
                            actividad: ec.actividad,
                            empleados: ec.empleados,
                            vacantes: ec.vacantes
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesEmpresas.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.actualizar === true) {//verifica el resultado de la transaccion
                                    //alert('Actualizó');
                                    swal({
                                        title: "Hecho",
                                        text: "Actualizado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    alert('No Actualizó');
                                }
                            } else {
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        //alert('Todos Los campos son obligatorios');
                        swal({
                            title: "No Ejecutado",
                            text: "Todos los campos son obligatorios",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }

                };
                ec.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idEmpresa: ec.idEmpresa
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesEmpresas.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
                                    //alert('Eliminado');
                                    swal({
                                        title: "Hecho",
                                        text: "Eliminado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    alert('No Eliminado');
                                }
                            } else {
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        //alert('El campo ID es obligatorio');
                        swal({
                            title: "No Ejecutado",
                            text: "El campo ID es obligatorio",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                ec.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idEmpresa: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesEmpresas.jsp',
                        params: parametros
                    }).then(function (res) {
                        ec.idEmpresa = res.data.Empresa.idEmpresa;
                        ec.nombreEmpresa = res.data.Empresa.nombreEmpresa;
                        ec.NIT = res.data.Empresa.NIT;
                        ec.actividad = res.data.Empresa.actividad;
                        ec.empleados = res.data.Empresa.empleados;
                        ec.vacantes = res.data.Empresa.vacantes;
                    });
                };
            }
        </script>
    </body>
</html>
