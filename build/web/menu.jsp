<%-- 
    Document   : consultarUsuario
    Created on : 12/11/2021, 08:08:26 AM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Menu</title>
        <!--        <style>div{border:dotted;}</style>-->
    </head>
    <body>
        <div class="container-fluid" >
            <div class="row" >
                <div class="col-10">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="indexAdmin.jsp">Home</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="usuarios.jsp">Usuarios</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="empresas.jsp">Empresas</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="">Social</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="">Buscar Usuario</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="">  </a>
                                    </li> 
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="index.jsp">Cerrar Sesion</a>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-2">
                    <img src="img/logoPro.png"  width="270" height="120"/>
                </div>
            </div>
        </div>
    </body>
</html>