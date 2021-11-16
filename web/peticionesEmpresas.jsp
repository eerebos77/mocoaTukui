<%-- 
    Document   : PeticionesEmpresas
    Created on : 15/11/2021, 03:47:47 PM
    Author     : Juan Rojas
--%>

<%@page import="logica.Empresas"%>
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
            String nombreEmpresa = request.getParameter("nombreEmpresa");
            String NIT = request.getParameter("NIT");
            String actividad = request.getParameter("actividad");         
            int empleados = Integer.parseInt(request.getParameter("empleados"));
            int vacantes = Integer.parseInt(request.getParameter("vacantes"));
            Empresas emp = new Empresas();
            emp.setNombreEmpresa(nombreEmpresa);
            emp.setNIT(NIT);
            emp.setActividad(actividad);
            emp.setEmpleados(empleados);
            emp.setVacantes(vacantes);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           

            if (emp.guardarEmpresa()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            Empresas emp = new Empresas();
            emp.setIdEmpresa(idEmpresa);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (emp.eliminarEmpresa()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Empresas emp = new Empresas();
                List<Empresas> lista = emp.consultarEmpresas();
                respuesta += "\"" + proceso + "\": true,\"Empresas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Empresas\":[]";
                Logger.getLogger(Empresas.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
                Empresas emp = new Empresas(idEmpresa).consultarEmpresa();
                respuesta += "\"" + proceso + "\": true,\"Empresa\":" + new Gson().toJson(emp);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Empresa\": null";
                Logger.getLogger(Empresas.class.getName()).log(Level.SEVERE, null, ex);

            }

        } else if (proceso.equals("actualizar")) {
            int idEmpresa = Integer.parseInt(request.getParameter("idEmpresa"));
            String nombreEmpresa = request.getParameter("nombreEmpresa");
            String NIT = request.getParameter("NIT");
            String actividad = request.getParameter("actividad");         
            int empleados = Integer.parseInt(request.getParameter("empleados"));
            int vacantes = Integer.parseInt(request.getParameter("vacantes"));
            Empresas emp = new Empresas();
            emp.setIdEmpresa(idEmpresa);
            emp.setNombreEmpresa(nombreEmpresa);
            emp.setNIT(NIT);
            emp.setActividad(actividad);
            emp.setEmpleados(empleados);
            emp.setVacantes(vacantes);
            //creación de objeto y llamado al metodo actualizar
            if (emp.actualizarEmpresa()) {
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
