<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Usuarios"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultaIndividual", 
        "consultaUsuario"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {
            String nombreUsuario = request.getParameter("nombreUsuario");
            String tipoDocumento = request.getParameter("tipoDocumento");
            String documentoUsuario = request.getParameter("documentoUsuario");         
            String tipoPerfil = request.getParameter("tipoPerfil");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String municipio = request.getParameter("municipio");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            int idSocial = Integer.parseInt(request.getParameter("idSocial"));
            String usuario = request.getParameter("usuario");
            String contrasenia = request.getParameter("contrasenia");
            Usuarios usu = new Usuarios();
            usu.setNombreUsuario(nombreUsuario);
            usu.setTipoDocumento(tipoDocumento);
            usu.setDocumentoUsuario(documentoUsuario);
            usu.setTipoPerfil(tipoPerfil);
            usu.setEdad(edad);
            usu.setMunicipio(municipio);
            usu.setTelefono(telefono);
            usu.setEmail(email);
            usu.setIdEmpresa(idEmpresa);
            usu.setIdSocial(idSocial);
            usu.setUsuario(usuario);
            usu.setContrasenia(contrasenia);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           

            if (usu.guardarUsuario()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            Usuarios usu = new Usuarios();
            usu.setIdUsuario(idUsuario);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (usu.eliminarUsuario()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Usuarios usu = new Usuarios();
                List<Usuarios> lista = usu.consultarUsuarios();
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                Usuarios usu = new Usuarios(idUsuario).consultarUsuario();
                respuesta += "\"" + proceso + "\": true,\"Usuario\":" + new Gson().toJson(usu);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuario\": null";
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);

            }

        } else if (proceso.equals("actualizar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String nombreUsuario = request.getParameter("nombreUsuario");
            String tipoDocumento = request.getParameter("tipoDocumento");
            String documentoUsuario = request.getParameter("documentoUsuario");         
            String tipoPerfil = request.getParameter("tipoPerfil");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String municipio = request.getParameter("municipio");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            int idSocial = Integer.parseInt(request.getParameter("idSocial"));
            String usuario = request.getParameter("usuario");
            String contrasenia = request.getParameter("contrasenia");
            Usuarios usu = new Usuarios();
            usu.setIdUsuario(idUsuario);
            usu.setNombreUsuario(nombreUsuario);
            usu.setTipoDocumento(tipoDocumento);
            usu.setDocumentoUsuario(documentoUsuario);
            usu.setTipoPerfil(tipoPerfil);
            usu.setEdad(edad);
            usu.setMunicipio(municipio);
            usu.setTelefono(telefono);
            usu.setEmail(email);
            usu.setIdEmpresa(idEmpresa);
            usu.setIdSocial(idSocial);
            usu.setUsuario(usuario);
            usu.setContrasenia(contrasenia);
            //creación de objeto y llamado al metodo actualizar
            if (usu.actualizarUsuario()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }else if (proceso.equals("consultaUsuario")) {
            try {
                String usuario = request.getParameter("usuario");
                Usuarios usu = new Usuarios().consultarUsuarioPorUsuario(usuario);
                respuesta += "\"" + proceso + "\": true,\"Usuario\":" + new Gson().toJson(usu);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuario\": null";
                Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);

            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
