package mx.edu.utez.aweb.sega.modelo.pago;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.auto.DaoAuto;
import mx.edu.utez.aweb.sega.servicios.revision.ServiceRevision;
import mx.edu.utez.aweb.sega.utiles.OracleConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoPago {

    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;
    public List<BeanPago> findAll(long id_usr,long rol) {
        List<BeanPago> pagos = new ArrayList<>();
        BeanPago pago = null;

        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 2){
                query="SELECT * FROM pagos WHERE pagos.usrs_id_usuario= ? AND activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1,id_usr);
                rs = pstm.executeQuery();
            }else {
                query="SELECT * FROM pagos WHERE activo=1 and ESTADO_PAGO=1";
                pstm = conn.prepareStatement(query);
                rs = pstm.executeQuery();
            }
            while (rs.next()) {
                pago = new BeanPago();
                pago.setId_pago(rs.getLong("id_pago"));
                pago.setCantidad(rs.getDouble("cantidad"));
                pago.setFecha_realizacion(rs.getString("fecha_realizacion"));
                pago.setEstado_pago(rs.getLong("estado_pago"));
                pago.setId_usuario(rs.getLong("usrs_id_usuario"));
                pago.setId_revision(rs.getLong("rev_id_revision"));
                pagos.add(pago);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoPago.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        } finally {
            closeConnections();
        }
        return pagos;
    }

    public boolean accionarPago(long id_usuario,long rol,long id_revision,long id_pago) {
        try {
            conn = new OracleConnection().getConnection();
            String query;
            //SET @p0='id_usr'; SET @p1='rol'; SET @p2='id_pago'; (@p0, @p1, @p2);
            if (rol==1 || rol==4){
                query="UPDATE pagos SET fecha_realizacion=SYSDATE ,estado_pago='2' WHERE pagos.id_pago=? AND activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1,id_pago);
                pstm.executeQuery();
                ServiceRevision srvRev = new ServiceRevision();
                srvRev.enviarCorreo(id_usuario, rol, id_revision,"Finalizado");
                srvRev.finalizar(id_revision);
                return true;
            }else {
                query="UPDATE pagos SET fecha_realizacion= SYSDATE ,estado_pago='1' WHERE pagos.id_pago=? AND activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1,id_pago);
                pstm.executeQuery();
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoPago.class.getName())
                    .log(Level.SEVERE, "Error accionarPago", e);
        } finally {
            closeConnections();
        }
        return false;
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
