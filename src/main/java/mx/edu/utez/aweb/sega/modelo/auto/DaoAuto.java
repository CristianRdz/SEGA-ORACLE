package mx.edu.utez.aweb.sega.modelo.auto;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.usuario.DaoUsuario;
import mx.edu.utez.aweb.sega.utiles.OracleConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAuto {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanAuto> findAll() {
        List<BeanAuto> autos = new ArrayList<>();
        BeanAuto auto = null;

        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM gestionautos where activo=1";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                auto = new BeanAuto();
                auto.setMatricula(rs.getString("matricula"));
                auto.setModelo(rs.getString("modelo"));
                auto.setMarca(rs.getString("marca"));
                auto.setColor(rs.getString("color"));
                auto.setN_serie(rs.getString("n_serie"));
                auto.setN_constancia(rs.getString("n_constancia"));
                auto.setTipo_combustible(rs.getString("tipo_combustible"));
                auto.setTipo_transmision(rs.getString("tipo_transmision"));
                auto.setId_usuario(rs.getLong("id_usuario"));
                auto.setCorreo(rs.getString("correo"));
                auto.setRfc(rs.getString("rfc"));
                autos.add(auto);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        } finally {
            closeConnections();
        }
        return autos;
    }

    public BeanAuto findOne(String matricula) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "select * from gestionautos where matricula=?";
            //SET @p0='EMX-46-13'; CALL obtenerAuto(@p0);
            pstm = conn.prepareStatement(query);
            pstm.setString(1, matricula);
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanAuto auto = new BeanAuto();
                auto.setMatricula(rs.getString("matricula"));
                auto.setModelo(rs.getString("modelo"));
                auto.setMarca(rs.getString("marca"));
                auto.setColor(rs.getString("color"));
                auto.setN_serie(rs.getString("n_serie"));
                auto.setN_constancia(rs.getString("n_constancia"));
                auto.setTipo_combustible(rs.getString("tipo_combustible"));
                auto.setTipo_transmision(rs.getString("tipo_transmision"));
                auto.setId_usuario(rs.getLong("id_usuario"));
                auto.setCorreo(rs.getString("correo"));
                auto.setRfc(rs.getString("rfc"));
                return auto;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error findOne", e);
        } finally {
            closeConnections();
        }
        return null;
    }

    public boolean crearAuto(BeanAuto auto) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL crearAuto('" + auto.getMatricula() + "', '" + auto.getModelo() +
                    "', '" + auto.getMarca() + "', '" + auto.getColor() +
                    "', '" + auto.getN_serie() + "', '" + auto.getN_constancia() +
                    "', '" + auto.getTipo_combustible() + "', '" + auto.getTipo_transmision() +
                    "', '" + auto.getTipo_llave() + "', '" + auto.getLlave() + "')";
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error crear", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean actualizarAuto(BeanAuto auto) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL modificarAuto('" + auto.getMatricula() + "', '" + auto.getModelo() +
                    "', '" + auto.getMarca() + "', '" + auto.getColor() +
                    "', '" + auto.getTipo_combustible() + "', '" + auto.getTipo_transmision() + "')";
            //SET @p0='12345RM'; SET @p1='Sentra'; SET @p2='Nissan'; SET @p3='Naranja'; SET @p4='Gasolina'; SET @p5='Manual'; CALL modificarAuto(@p0, @p1, @p2, @p3, @p4, @p5);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }


    public boolean eliminar(String matricula, Long rol) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL eliminarAuto('" + matricula + "','" + rol + "')";
            //SET @p0='1'; CALL eliminarAuto(@p0,@p1);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error eliminar", e);
            return false;
        } finally {
            closeConnections();
        }
    }


    public List<BeanAuto> verAutos(Long id, Long rol) {
        List<BeanAuto> autos = new ArrayList<>();
        BeanAuto auto = null;

        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 2) {
                query = "SELECT * FROM gestionautos WHERE id_usuario=? AND activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id);
            } else {
                query = "select * from gestionautos where activo=1";
                pstm = conn.prepareStatement(query);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                auto = new BeanAuto();
                auto.setMatricula(rs.getString("matricula"));
                auto.setModelo(rs.getString("modelo"));
                auto.setMarca(rs.getString("marca"));
                auto.setColor(rs.getString("color"));
                auto.setN_serie(rs.getString("n_serie"));
                auto.setN_constancia(rs.getString("n_constancia"));
                auto.setTipo_combustible(rs.getString("tipo_combustible"));
                auto.setTipo_transmision(rs.getString("tipo_transmision"));
                auto.setId_usuario(rs.getLong("id_usuario"));
                auto.setCorreo(rs.getString("correo"));
                auto.setRfc(rs.getString("rfc"));
                autos.add(auto);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoAuto.class.getName())
                    .log(Level.SEVERE, "Error verAutos", e);
        } finally {
            closeConnections();
        }
        return autos;
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
