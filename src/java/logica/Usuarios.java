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
public class Usuarios {

    private int idUsuario;
    private String nombreUsuario;
    private String tipoDocumento;
    private String documentoUsuario;
    private String tipoPerfil;
    private int edad;
    private String municipio;
    private String telefono;
    private String email;
    private int idEmpresa;
    private int idSocial;
    private String usuario;
    private String contrasenia;

    public Usuarios() {
    }

    public Usuarios(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Usuarios(int idUsuario, String nombreUsuario, String tipoDocumento, String documentoUsuario, String tipoPerfil, int edad, String municipio, String telefono, String email, int idEmpresa, int idSocial, String usuario, String contrasenia) {
        this.nombreUsuario = nombreUsuario;
        this.tipoDocumento = tipoDocumento;
        this.documentoUsuario = documentoUsuario;
        this.tipoPerfil = tipoPerfil;
        this.edad = edad;
        this.municipio = municipio;
        this.telefono = telefono;
        this.email = email;
        this.idEmpresa = idEmpresa;
        this.idSocial = idSocial;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getDocumentoUsuario() {
        return documentoUsuario;
    }

    public void setDocumentoUsuario(String documentoUsuario) {
        this.documentoUsuario = documentoUsuario;
    }

    public String getTipoPerfil() {
        return tipoPerfil;
    }

    public void setTipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public int getIdSocial() {
        return idSocial;
    }

    public void setIdSocial(int idSocial) {
        this.idSocial = idSocial;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    @Override
    public String toString() {
        return "Usuarios{" + "idUsuario=" + idUsuario + ", nombreUsuario=" + nombreUsuario + ", tipoDocumento=" + tipoDocumento + ", documentoUsuario=" + documentoUsuario + ", tipoPerfil=" + tipoPerfil + ", edad=" + edad + ", municipio=" + municipio + ", telefono=" + telefono + ", email=" + email + ", idEmpresa=" + idEmpresa + ", idSocial=" + idSocial + ", usuario=" + usuario + ", contrasenia=" + contrasenia + '}';
    }

    /*Metodo para conectar a la BD y retornar la lista de elementos dentro de la tabla usuarios*/
    public List<Usuarios> consultarUsuarios() {
        List<Usuarios> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuarios;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuarios u;
            while (rs.next()) {
                u = new Usuarios();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombreUsuario(rs.getString("nombreUsuario"));
                u.setTipoDocumento(rs.getString("tipoDocumento"));
                u.setDocumentoUsuario(rs.getString("documentoUsuario"));
                u.setTipoPerfil(rs.getString("tipoPerfil"));
                u.setEdad(rs.getInt("edad"));
                u.setMunicipio(rs.getString("municipio"));
                u.setTelefono(rs.getString("telefono"));
                u.setEmail(rs.getString("email"));
                u.setIdEmpresa(rs.getInt("idEmpresa"));
                u.setIdSocial(rs.getInt("idSocial"));
                u.setUsuario(rs.getString("usuario"));
                u.setContrasenia(rs.getString("contrasenia"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public List<Usuarios> consultarUsuariosPorNombre(String nombre) {
        List<Usuarios> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuarios WHERE nombreUsuario LIKE '%" + nombre + "%'";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuarios u;
            while (rs.next()) {
                u = new Usuarios();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombreUsuario(rs.getString("nombreUsuario"));
                u.setTipoDocumento(rs.getString("tipoDocumento"));
                u.setDocumentoUsuario(rs.getString("documentoUsuario"));
                u.setTipoPerfil(rs.getString("tipoPerfil"));
                u.setEdad(rs.getInt("edad"));
                u.setMunicipio(rs.getString("municipio"));
                u.setTelefono(rs.getString("telefono"));
                u.setEmail(rs.getString("email"));
                u.setIdEmpresa(rs.getInt("idEmpresa"));
                u.setIdSocial(rs.getInt("idSocial"));
                u.setUsuario(rs.getString("usuario"));
                u.setContrasenia(rs.getString("contrasenia"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public List<Usuarios> consultarUsuariosPorMunicipio(String municipio) {
        List<Usuarios> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuarios WHERE municipio LIKE '%" + municipio + "%'";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuarios u;
            while (rs.next()) {
                u = new Usuarios();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombreUsuario(rs.getString("nombreUsuario"));
                u.setTipoDocumento(rs.getString("tipoDocumento"));
                u.setDocumentoUsuario(rs.getString("documentoUsuario"));
                u.setTipoPerfil(rs.getString("tipoPerfil"));
                u.setEdad(rs.getInt("edad"));
                u.setMunicipio(rs.getString("municipio"));
                u.setTelefono(rs.getString("telefono"));
                u.setEmail(rs.getString("email"));
                u.setIdEmpresa(rs.getInt("idEmpresa"));
                u.setIdSocial(rs.getInt("idSocial"));
                u.setUsuario(rs.getString("usuario"));
                u.setContrasenia(rs.getString("contrasenia"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Usuarios consultarUsuarioPorUsuario(String user) {
        List<Usuarios> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuarios WHERE usuario= '" + user + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuarios u;
            if (rs.next()) {
                this.nombreUsuario = rs.getString("nombreUsuario");
                this.tipoDocumento = rs.getString("tipoDocumento");
                this.documentoUsuario = rs.getString("documentoUsuario");
                this.tipoPerfil = rs.getString("tipoPerfil");
                this.edad = rs.getInt("edad");
                this.municipio = rs.getString("municipio");
                this.telefono = rs.getString("telefono");
                this.email = rs.getString("email");
                this.idEmpresa = rs.getInt("idEmpresa");
                this.idSocial = rs.getInt("idSocial");
                this.usuario = rs.getString("usuario");
                this.contrasenia = rs.getString("contrasenia");
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

    /*Metodo para conectaar a la BD y consultar un usuario por Id, retorna un objeto de tipo usuarios*/
    public Usuarios consultarUsuario() {
        List<Usuarios> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuarios WHERE idUsuario= " + this.idUsuario + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuarios u;
            if (rs.next()) {
                this.nombreUsuario = rs.getString("nombreUsuario");
                this.tipoDocumento = rs.getString("tipoDocumento");
                this.documentoUsuario = rs.getString("documentoUsuario");
                this.tipoPerfil = rs.getString("tipoPerfil");
                this.edad = rs.getInt("edad");
                this.municipio = rs.getString("municipio");
                this.telefono = rs.getString("telefono");
                this.email = rs.getString("email");
                this.idEmpresa = rs.getInt("idEmpresa");
                this.idSocial = rs.getInt("idSocial");
                this.usuario = rs.getString("usuario");
                this.contrasenia = rs.getString("contrasenia");
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

    public boolean guardarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO mocoaG5.usuarios"
                + "(nombreUsuario, tipoDocumento, documentoUsuario, tipoPerfil, edad, municipio, telefono, email, idEmpresa, idSocial, usuario, contrasenia)"
                + "VALUES('" + this.nombreUsuario + "', "
                + "'" + this.tipoDocumento + "', '" + this.documentoUsuario + "', "
                + "'" + this.tipoPerfil + "', " + this.edad + ", "
                + "'" + this.municipio + "', '" + this.telefono + "',"
                + " '" + this.email + "', " + this.idEmpresa + ","
                + " " + this.idSocial + ", '" + this.usuario + "', '" + this.contrasenia + "');";

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

    public boolean actualizarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE usuarios \n"
                + "SET nombreUsuario='" + this.nombreUsuario + "',"
                + "tipoDocumento='" + this.tipoDocumento + "',"
                + "documentoUsuario='" + this.documentoUsuario + "',"
                + "tipoPerfil= '" + this.tipoPerfil + "',"
                + "edad= " + this.edad + " ,"
                + "municipio= '" + this.municipio + "',"
                + "telefono= '" + this.telefono + "',"
                + "email= '" + this.email + "',"
                + "idEmpresa= " + this.idEmpresa + " ,"
                + "idSocial= " + this.idSocial + " ,"
                + "usuario= '" + this.usuario + "' ,"
                + "contrasenia='" + this.contrasenia + "'\n"
                + "WHERE idUsuario=" + this.idUsuario + ";";
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

    public boolean eliminarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM usuarios\n"
                + "WHERE idUsuario=" + this.idUsuario + ";";
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
