<%-- 
    Document   : usuarios
    Created on : 14/11/2021, 03:05:38 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Usuarios</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid" ng-app="usuarios" ng-controller="usuariosController as uc" >  
            <div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col-3"><label>Usuario Conectado:</label></div>
                        <div class="col-3"> <p class="text-light bg-dark">{{uc.userName}}</p></div>
                    </div>
                    <br>
                    <!--Seccion 1-->
                    <div class="row">
                        <div class="col-6"> 
                            <label>idUsuario</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="uc.idUsuario">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre del Usuario</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="uc.nombreUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>tipoDocumento</label>
                            <input type="text" class="form-control" placeholder="TipoDocumento" ng-model="uc.tipoDocumento">
                        </div>
                        <div class="col-6"> 
                            <label># de Documento</label>
                            <input type="text" class="form-control" placeholder="# de Documento" ng-model="uc.documentoUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Perfil</label>
                            <input type="text" class="form-control" placeholder="Perfil" ng-model="uc.tipoPerfil">
                        </div>
                        <div class="col-6"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="Edad" ng-model="uc.edad">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Municipio</label>
                            <input type="text" class="form-control" placeholder="Municipio" ng-model="uc.municipio">
                        </div>
                        <div class="col-6"> 
                            <label>Telefono</label>
                            <input type="text" class="form-control" placeholder="Telefono" ng-model="uc.telefono">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="uc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="uc.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="uc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="uc.eliminar()">Eliminar</button>
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
                        <div class="col-6"> 
                            <label>email</label>
                            <input type="text" class="form-control" placeholder="email" ng-model="uc.email">
                        </div>
                        <div class="col-6"> 
                            <label>idEmpresa</label>
                            <input type="text" class="form-control" placeholder="Empleador" ng-model="uc.idEmpresa">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>idSocial</label>
                            <input type="text" class="form-control" placeholder="Perfil Social" ng-model="uc.idSocial">
                        </div>
                        <div class="col-6"> 
                            <label>Usuario</label>
                            <input type="text" class="form-control" placeholder="usuario" ng-model="uc.usuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Contraseña</label>
                            <input type="text" class="form-control" placeholder="Contraseña" ng-model="uc.contrasenia">
                        </div>
                        <div class="col-6"></div>
                    </div>
                    <br>
                    <div class="row" >
                        <div class="p-3 mb-2 bg-secondary text-white">Base de Datos Usuarios</div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">id Usuario</th>
                            <th scope="col">nombre Usuario</th>
                            <th scope="col">Tipo de documento</th>
                            <th scope="col"># de Documento</th>
                            <th scope="col">Perfil</th>
                            <th scope="col">edad</th>
                            <th scope="col">Municipio</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Email</th>
                            <th scope="col">idEmpresa</th>
                            <th scope="col">idSocial</th>
                            <th scope="col">usuario</th>
                            <th scope="col">contraseña</th>
                            <th scope="col">Funciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="u in uc.Usuarios">
                            <td>{{u.idUsuario}}</td>
                            <td>{{u.nombreUsuario}}</td>
                            <td>{{u.tipoDocumento}}</td>
                            <td>{{u.documentoUsuario}}</td>
                            <td>{{u.tipoPerfil}}</td>
                            <td>{{u.edad}}</td>
                            <td>{{u.municipio}}</td>
                            <td>{{u.telefono}}</td>
                            <td>{{u.email}}</td>
                            <td>{{u.idEmpresa}}</td>
                            <td>{{u.idSocial}}</td>
                            <td>{{u.usuario}}</td>
                            <td>{{u.contrasenia}}</td>                            
                            <td>
                                <button type="button" class="btn btn-info" ng-click="uc.editar(u.idUsuario)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('usuarios', []);
            app.controller('usuariosController', ['$http', controladorUsuarios]);
            function controladorUsuarios($http) {
                var uc = this;
                uc.userName = document.cookie;
                validar = function (tipoDeValidacion) {
                    var idUsuario = uc.idUsuario ? true : false;
                    var nombreUsuario = uc.nombreUsuario ? true : false;
                    var tipoDocumento = uc.tipoDocumento ? true : false;
                    var documentoUsuario = uc.documentoUsuario ? true : false;
                    var tipoPerfil = uc.tipoPerfil ? true : false;
                    var edad = uc.edad ? true : false;
                    var municipio = uc.municipio ? true : false;
                    var telefono = uc.telefono ? true : false;
                    var email = uc.email ? true : false;
                    var idEmpresa = uc.idEmpresa ? true : false;
                    var idSocial = uc.idSocial ? true : false;
                    var usuario = uc.usuario ? true : false;
                    var contrasenia = uc.contrasenia ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idUsuario && nombreUsuario && tipoDocumento && documentoUsuario && tipoPerfil &&
                                edad && municipio && telefono && email && idEmpresa && idSocial && usuario && contrasenia) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'datosSinId') {
                        if (nombreUsuario && tipoDocumento && documentoUsuario && tipoPerfil &&
                                edad && municipio && telefono && email && idEmpresa && idSocial && usuario && contrasenia) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idUsuario) {
                            return true;
                        } else {
                            return false;
                        }
                    }

                };
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
                uc.guardar = function () {
                    if (validar('datosSinId')) {
                        var parametros = {
                            proceso: 'guardar',
                            nombreUsuario: uc.nombreUsuario,
                            tipoDocumento: uc.tipoDocumento,
                            documentoUsuario: uc.documentoUsuario,
                            tipoPerfil: uc.tipoPerfil,
                            edad: uc.edad,
                            municipio: uc.municipio,
                            telefono: uc.telefono,
                            email: uc.email,
                            idEmpresa: uc.idEmpresa,
                            idSocial: uc.idSocial,
                            usuario: uc.usuario,
                            contrasenia: uc.contrasenia
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
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
                uc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idUsuario: uc.idUsuario,
                            nombreUsuario: uc.nombreUsuario,
                            tipoDocumento: uc.tipoDocumento,
                            documentoUsuario: uc.documentoUsuario,
                            tipoPerfil: uc.tipoPerfil,
                            edad: uc.edad,
                            municipio: uc.municipio,
                            telefono: uc.telefono,
                            email: uc.email,
                            idEmpresa: uc.idEmpresa,
                            idSocial: uc.idSocial,
                            usuario: uc.usuario,
                            contrasenia: uc.contrasenia
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
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
                uc.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idUsuario: uc.idUsuario
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
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
                uc.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idUsuario: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.idUsuario = res.data.Usuario.idUsuario;
                        uc.nombreUsuario = res.data.Usuario.nombreUsuario;
                        uc.tipoDocumento = res.data.Usuario.tipoDocumento;
                        uc.documentoUsuario = res.data.Usuario.documentoUsuario;
                        uc.tipoPerfil = res.data.Usuario.tipoPerfil;
                        uc.edad = res.data.Usuario.edad;
                        uc.municipio = res.data.Usuario.municipio;
                        uc.telefono = res.data.Usuario.telefono;
                        uc.email = res.data.Usuario.email;
                        uc.idEmpresa = res.data.Usuario.idEmpresa;
                        uc.idSocial = res.data.Usuario.idSocial;
                        uc.usuario = res.data.Usuario.usuario;
                        uc.contrasenia = res.data.Usuario.contrasenia;
                    });
                };
            }
        </script> 
    </body>
</html>
