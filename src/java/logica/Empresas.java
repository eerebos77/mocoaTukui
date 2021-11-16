/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Juan Rojas
 */
public class Empresas {

    private int idEmpresa;
    private String nombreEmpresa;
    private String NIT;
    private String actividad;
    private int empleados;
    private int vacantes;

    public Empresas() {
    }

    public Empresas(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public Empresas(int idEmpresa, String nombreEmpresa, String NIT, String actividad, int empleados, int vacantes) {
        this.idEmpresa = idEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.NIT = NIT;
        this.actividad = actividad;
        this.empleados = empleados;
        this.vacantes = vacantes;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public int getEmpleados() {
        return empleados;
    }

    public void setEmpleados(int empleados) {
        this.empleados = empleados;
    }

    public int getVacantes() {
        return vacantes;
    }

    public void setVacantes(int vacantes) {
        this.vacantes = vacantes;
    }

    /*Metodo para conectar a la BD y retornar la lista de elementos dentro de la tabla usuarios*/
    public List<Empresas> consultarEmpresas() {
        List<Empresas> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM empresas;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Empresas u;
            while (rs.next()) {
                u = new Empresas();
                u.setIdEmpresa(rs.getInt("idEmpresa"));
                u.setNombreEmpresa(rs.getString("nombreEmpresa"));
                u.setNIT(rs.getString("NIT"));
                u.setActividad(rs.getString("actividad"));
                u.setEmpleados(rs.getInt("empleados"));
                u.setVacantes(rs.getInt("vacantes"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    /*Metodo para conectaar a la BD y consultar un usuario por Id, retorna un objeto de tipo usuarios*/
    public Empresas consultarEmpresa() {
        List<Empresas> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM empresas WHERE idEmpresa = " + this.idEmpresa + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Empresas e;
            if (rs.next()) {
                this.nombreEmpresa = rs.getString("nombreEmpresa");
                this.NIT = rs.getString("NIT");
                this.actividad = rs.getString("actividad");
                this.empleados = rs.getInt("empleados");
                this.vacantes = rs.getInt("vacantes");
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarEmpresa() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO empresas"
                + "(nombreEmpresa, NIT, actividad, empleados, vacantes)"
                + "VALUES('" + this.nombreEmpresa + "', "
                + "'" + this.NIT + "', '" + this.actividad + "', "
                + "" + this.empleados + ", " + this.vacantes + ");";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarEmpresa() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE empresas \n"
                + "SET nombreEmpresa='" + this.nombreEmpresa + "',"
                + "NIT='" + this.NIT + "',"
                + "actividad='" + this.actividad + "',"
                + "empleados= " + this.empleados + ","
                + "vacantes= " + this.vacantes + " \n"
                + "WHERE idEmpresa=" + this.idEmpresa + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean eliminarEmpresa() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM empresas \n"
                + "WHERE idEmpresa=" + this.idEmpresa + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
}
