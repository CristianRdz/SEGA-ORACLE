package mx.edu.utez.aweb.sega.modelo.catalogo;

import mx.edu.utez.aweb.sega.utiles.OracleConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoCatalogo {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanCatalogo> findAll() {
        List<BeanCatalogo> elementos = new ArrayList<>();
        BeanCatalogo catalogo = null;

        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM elementos_catalogo WHERE activo =1";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                catalogo = new BeanCatalogo();
                catalogo.setId_elemento(rs.getLong("id_elemento"));
                catalogo.setNombre(rs.getString("nombre"));
                catalogo.setDescripcion(rs.getString("descripcion"));
                catalogo.setPrecio(rs.getDouble("precio"));
                catalogo.setTipo_elemento(rs.getString("tipo_elemento"));
                catalogo.setCantidad(rs.getLong("cantidad"));
                elementos.add(catalogo);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoCatalogo.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        } finally {
            closeConnections();
        }
        return elementos;
    }

    public BeanCatalogo findOne(long id) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "select * from elementos_catalogo where id_elemento=? and activo=1";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanCatalogo catalogo = new BeanCatalogo();
                catalogo.setId_elemento(rs.getLong("id_elemento"));
                catalogo.setNombre(rs.getString("nombre"));
                catalogo.setDescripcion(rs.getString("descripcion"));
                catalogo.setPrecio(rs.getDouble("precio"));
                catalogo.setTipo_elemento(rs.getString("tipo_elemento"));
                catalogo.setCantidad(rs.getLong("cantidad"));
                return catalogo;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoCatalogo.class.getName())
                    .log(Level.SEVERE, "Error findOne", e);
        } finally {
            closeConnections();
        }
        return null;
    }

    public boolean crearElemento(BeanCatalogo elemento) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL crearElemento('" + elemento.getNombre() + "', '" + elemento.getDescripcion() +
                    "', '" + elemento.getPrecio() + "', '" + elemento.getTipo_elemento() +
                    "', '" + elemento.getCantidad() + "')";
            //SET @p0='Lata'; SET @p1='Ninguna'; SET @p2='80'; SET @p3='Producto'; SET @p4='15';
            // CALL crearElemento(@p0, @p1, @p2, @p3, @p4);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoCatalogo.class.getName())
                    .log(Level.SEVERE, "Error crear", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean actualizarElemento(BeanCatalogo elemento, long rol) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL modificarElemento('" + elemento.getId_elemento() + "', '" + elemento.getNombre() +
                    "', '" + elemento.getDescripcion() + "', '" + elemento.getPrecio() + "', '" + elemento.getTipo_elemento() + "' , '" + elemento.getCantidad() + "', '" + rol + "')";
            //SET @p0='5'; SET @p1='Lavado'; SET @p2='Consiste en una limpieza de
            //CALL modificarElemento(@p0, @p1, @p2, @p3, @p4, @p5); SET @p3='560'; SET @p4='Servicp5='3'io'; SET @;
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoCatalogo.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean eliminar(long id_elemento, long rol) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL eliminarElemento('" + id_elemento + "','" + rol + "')";
            //SET @p0='1'; SET @p1='1'; CALL eliminarElemento(@p0, @p1);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoCatalogo.class.getName())
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
