package mx.edu.utez.aweb.sega.modelo.historial_rev;

import mx.edu.utez.aweb.sega.modelo.revision.BeanControl;
import mx.edu.utez.aweb.sega.utiles.OracleConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoHistorial_rev {

    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;
    public List<BeanHistorial_rev> verHistCat(long id_rev) {
        List<BeanHistorial_rev> histCat = new ArrayList<>();
        BeanHistorial_rev historial = null;
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM hist_cat_detalles WHERE hist_cat_detalles.rev_id_revision=? AND activo=1";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id_rev);
            rs = pstm.executeQuery();
            while (rs.next()) {
                historial = new BeanHistorial_rev();
                historial.setId_hist(rs.getLong("id_hist"));
                historial.setId_elemento(rs.getLong("cat_id_elemento"));
                historial.setNombre(rs.getString("nombre"));
                historial.setPrecioIndividual(rs.getDouble("precio"));
                historial.setDescripcion(rs.getString("descripcion"));
                historial.setTipo_elemento(rs.getString("tipo_elemento"));
                historial.setCantidadUtilizada(rs.getLong("cant_elem"));
                historial.setSubtotal(rs.getDouble("total"));
                historial.setId_rev(rs.getLong("rev_id_revision"));
                histCat.add(historial);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoHistorial_rev.class.getName())
                    .log(Level.SEVERE, "Error verHistorial", e);
        } finally {
            closeConnections();
        }
        return histCat;
    }
    public BeanHistorial_rev findOne(long id_hist) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT * FROM hist_cat_detalles WHERE hist_cat_detalles.id_hist=? AND activo=1";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id_hist);
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanHistorial_rev historial = new BeanHistorial_rev();
                historial.setId_hist(rs.getLong("id_hist"));
                historial.setId_elemento(rs.getLong("cat_id_elemento"));
                historial.setNombre(rs.getString("nombre"));
                historial.setPrecioIndividual(rs.getDouble("precio"));
                historial.setDescripcion(rs.getString("descripcion"));
                historial.setTipo_elemento(rs.getString("tipo_elemento"));
                historial.setCantidadUtilizada(rs.getLong("cant_elem"));
                historial.setSubtotal(rs.getDouble("total"));
                historial.setId_rev(rs.getLong("rev_id_revision"));
                return historial;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoHistorial_rev.class.getName())
                    .log(Level.SEVERE, "Error findOne", e);
        } finally {
            closeConnections();
        }
        return null;
    }
    public BeanControl findOneControl(long id_usr, long rol, long id_rev) {
        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 2) {
                query = "SELECT * FROM control WHERE control.id_usr=? AND control.id_rev=? AND control.activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_usr);
                pstm.setLong(2, id_rev);
            } else  if (rol == 5) {
                query = "SELECT * FROM control WHERE control.id_mecanico=? AND control.id_rev=? AND control.activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_usr);
                pstm.setLong(2, id_rev);
            } else {
                query = "SELECT * FROM control WHERE control.id_rev=? AND control.activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_rev);
            }
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanControl control = new BeanControl();
                control.setId_rev(rs.getLong("id_rev"));
                control.setFecha_ult_mov(rs.getString("fecha_ult_mov"));
                control.setFase(rs.getString("fase"));
                control.setModelo(rs.getString("modelo"));
                control.setMarca(rs.getString("marca"));
                control.setMatricula(rs.getString("matricula"));
                control.setN_serie(rs.getString("n_serie"));
                control.setN_constancia(rs.getString("n_constancia"));
                control.setColor(rs.getString("color"));
                control.setTipo_combustible(rs.getString("tipo_combustible"));
                control.setTipo_transmision(rs.getString("tipo_transmision"));
                control.setObservaciones(rs.getString("observaciones"));
                control.setId_usr(rs.getLong("id_usr"));
                control.setCorreo(rs.getString("correo"));
                control.setId_mecanico(rs.getLong("id_mecanico"));
                return control;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoHistorial_rev.class.getName())
                    .log(Level.SEVERE, "Error findOneControl", e);
        } finally {
            closeConnections();
        }
        return null;
    }



    public List<BeanControl> verHistorial(long id, long rol) {
        List<BeanControl> histRevs = new ArrayList<>();
        BeanControl control = null;
        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 2) {
                query = "SELECT * FROM control WHERE control.id_usr=? AND control.activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id);
            } else {
                query = "SELECT * FROM control WHERE control.activo=1";
                pstm = conn.prepareStatement(query);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                control = new BeanControl();
                control.setId_rev(rs.getLong("id_rev"));
                control.setFecha_ult_mov(rs.getString("fecha_ult_mov"));
                control.setFase(rs.getString("fase"));
                control.setModelo(rs.getString("modelo"));
                control.setMarca(rs.getString("marca"));
                control.setMatricula(rs.getString("matricula"));
                control.setN_serie(rs.getString("n_serie"));
                control.setN_constancia(rs.getString("n_constancia"));
                control.setColor(rs.getString("color"));
                control.setTipo_combustible(rs.getString("tipo_combustible"));
                control.setTipo_transmision(rs.getString("tipo_transmision"));
                control.setObservaciones(rs.getString("observaciones"));
                control.setId_usr(rs.getLong("id_usr"));
                control.setCorreo(rs.getString("correo"));
                control.setId_mecanico(rs.getLong("id_mecanico"));
                histRevs.add(control);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoHistorial_rev.class.getName())
                    .log(Level.SEVERE, "Error verHistorial", e);
        } finally {
            closeConnections();
        }
        return histRevs;
    }

    public String obtenerTotal(long id_rev) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "SELECT ROUND(SUM(total), 2) AS total FROM hist_cat_detalles WHERE hist_cat_detalles.rev_id_revision=? AND activo=1";
            //SET @p0='1'; CALL obtenerTotalHist(@p0);
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id_rev);
            rs = pstm.executeQuery();
            if (rs.next()) {
                String total= rs.getString("total");
                return total;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoHistorial_rev.class.getName())
                    .log(Level.SEVERE, "Error obtenerTotal", e);
        } finally {
            closeConnections();
        }
        return null;
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
