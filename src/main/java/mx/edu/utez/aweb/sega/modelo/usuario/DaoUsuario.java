package mx.edu.utez.aweb.sega.modelo.usuario;

import mx.edu.utez.aweb.sega.utiles.OracleConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoUsuario {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanUsuario> findAll() {
        List<BeanUsuario> usuarios = new ArrayList<>();
        BeanUsuario usuario = null;

        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM usuarios WHERE activo=1";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                usuario = new BeanUsuario();
                usuario.setId_usuario(rs.getLong("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido_paterno(rs.getString("apellido_paterno"));
                usuario.setApellido_materno(rs.getString("apellido_materno"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setCurp(rs.getString("curp"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRfc(rs.getString("rfc"));
                usuario.setCalle(rs.getString("dir_calle"));
                usuario.setEstado(rs.getString("dir_estado"));
                usuario.setColonia(rs.getString("dir_colonia"));
                usuario.setReferencias(rs.getString("dir_referencias"));
                usuario.setMunicipio(rs.getString("dir_municipio"));
                usuario.setCodigoPostal(rs.getString("dir_cp"));
                usuario.setRol(rs.getLong("rol"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        } finally {
            closeConnections();
        }
        return usuarios;
    }


    public boolean acceso(String correo, String contrasena) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM usuarios WHERE correo = ? and contrasena= ?  and activo=1";
            pstm = conn.prepareStatement(query);
            System.out.println(query);
            pstm.setString(1, correo);
            pstm.setString(2, contrasena);
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }else {
                return false;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error acceso", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean agregarCodigo(Long id_usr, String codigo) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL agregarCod('"+id_usr+"','"+codigo+"')";
            //SET @p0='id_usr'; SET @p1='codigo'; CALL agregarCod(@p0, @p1);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error acceso", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean verificarCodigo(Long id_usr, String codigo) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT cod_verf FROM verificaciones WHERE usrs_id_usuario = ? AND cod_verf=? AND activo=1";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1,id_usr);
            pstm.setString(2,codigo);
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }else {
                return false;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error acceso", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean cambiarContra(Long id_usr, String contraNueva,String contraVieja) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL modificarContrasena('"+id_usr+"','"+contraNueva+"','"+contraVieja+"')";
            //SET @p0='ID'; SET @p1='Nueva'; SET @p2='Vieja'; CALL modificarContrasena(@p0, @p1, @p2);
            pstm = conn.prepareStatement(query);
            System.out.println(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error cambio", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean recuContra(Long id_usr, String contraNueva) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL recuperarContrasena('"+id_usr+"','"+contraNueva+"')";
            System.out.println(query);
            //SET @p0='id_usr'; SET @p1='Contranueva'; CALL recuperarContrasena(@p0, @p1);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error cambio", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public BeanUsuario findOne(String email) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM usuarios WHERE correo = ? and activo=1";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanUsuario usuario = new BeanUsuario();
                usuario.setId_usuario(rs.getLong("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido_paterno(rs.getString("apellido_paterno"));
                usuario.setApellido_materno(rs.getString("apellido_materno"));
                usuario.setCorreo(email);
                usuario.setCurp(rs.getString("curp"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRfc(rs.getString("rfc"));
                usuario.setCalle(rs.getString("dir_calle"));
                usuario.setEstado(rs.getString("dir_estado"));
                usuario.setColonia(rs.getString("dir_colonia"));
                usuario.setReferencias(rs.getString("dir_referencias"));
                usuario.setMunicipio(rs.getString("dir_municipio"));
                usuario.setCodigoPostal(rs.getString("dir_cp"));
                usuario.setRol(rs.getLong("rol"));
                return usuario;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error get", e);
        } finally {
            closeConnections();
        }
        return null;
    }
    public BeanUsuario findOneRfc(String rfc) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM usuarios WHERE rfc= ? AND activo=1;";
            //SET @p0='RORC030203JK6'; CALL obtenerUsuarioPorRFC(@p0);
            pstm = conn.prepareStatement(query);
            pstm.setString(1, rfc);
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanUsuario usuario = new BeanUsuario();
                usuario.setId_usuario(rs.getLong("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido_paterno(rs.getString("apellido_paterno"));
                usuario.setApellido_materno(rs.getString("apellido_materno"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setCurp(rs.getString("curp"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRfc(rs.getString("rfc"));
                usuario.setCalle(rs.getString("dir_calle"));
                usuario.setEstado(rs.getString("dir_estado"));
                usuario.setColonia(rs.getString("dir_colonia"));
                usuario.setReferencias(rs.getString("dir_referencias"));
                usuario.setMunicipio(rs.getString("dir_municipio"));
                usuario.setCodigoPostal(rs.getString("dir_cp"));
                usuario.setRol(rs.getLong("rol"));
                return usuario;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error get", e);
        } finally {
            closeConnections();
        }
        return null;
    }
    public boolean actualizarUsuario(BeanUsuario usuario) {
        try {
            conn = new OracleConnection().getConnection();
            String query ="CALL modificarUsuario('"+usuario.getId_usuario()+"'," +
                    " '"+usuario.getNombre()+"', '"+usuario.getApellido_paterno()+
                    "', '"+usuario.getApellido_materno()+"', '"+usuario.getTelefono()+
                    "', '"+usuario.getCalle()+"', '"+usuario.getEstado()+
                    "','"+usuario.getColonia()+"','"+usuario.getReferencias()+
                    "','"+usuario.getMunicipio()+"','"+usuario.getCodigoPostal()+"')";
            //SET @p0='2'; SET @p1='Juan'; SET @p2='Ramirez'; SET @p3='Sanchez'; SET @p4='7777909013'; SET @p5='10 de mayo'; SET @p6='Morelos'; SET @p7='123'; SET @p8='Ruben Jaramillo'; SET @p9='Temixco'; SET @p10='62587';
            // CALL modificarUsuario(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean crearUsuario(BeanUsuario usuario) {
        try {
            conn = new OracleConnection().getConnection();
            String query ="CALL crearUsuario('"+usuario.getNombre()+"', '"+usuario.getApellido_paterno()+
                    "', '"+usuario.getApellido_materno()+"', '"+usuario.getCorreo()+
                    "', '"+usuario.getCurp()+"', '"+usuario.getTelefono()+
                    "', '"+usuario.getRfc()+"', '"+usuario.getContrasena()+
                    "', '"+usuario.getCalle()+"', '"+usuario.getEstado()+
                    "','"+usuario.getColonia()+"','"+usuario.getReferencias()+
                    "','"+usuario.getMunicipio()+"','"+usuario.getCodigoPostal()+"','"+usuario.getRol()+"')";
            //SET @p0='Sheila'; SET @p1='Sanchez'; SET @p2='Flores'; SET @p3='20213tn089@utez.edu.mx'; SET @p4='SAFS02040SAFS020407MMSNLHA67MMSNLHA6'; SET @p5='7773448592'; SET @p6='SAÑL750210963'; SET @p7='1234568'; SET @p8='La Misión'; SET @p9='Morelos'; SET @p10='San Fransico'; SET @p11='Ninguna'; SET @p12='Zapata'; SET @p13='62764'; SET @p14='1';
            // CALL crearUsuario(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10, @p11, @p12, @p13, @p14);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error crear", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean eliminar(Long id, Long rol) {
        try {
            conn = new OracleConnection().getConnection();
            String query ="CALL eliminarUsuario('"+id+"','"+rol+"')";
            //SET @p0='1'; CALL eliminarUsuario(@p0);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName())
                    .log(Level.SEVERE, "Error eliminar", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public void closeConnections() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (cstm != null) {
                cstm.close();
            }
            if (rs != null) {
                rs.close();
            }

        } catch (SQLException e) {

        }
    }
}
