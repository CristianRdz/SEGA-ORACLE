package mx.edu.utez.aweb.sega.modelo.revision;

import mx.edu.utez.aweb.sega.modelo.revision.DaoRevision;
import mx.edu.utez.aweb.sega.modelo.revision.DaoRevision;
import mx.edu.utez.aweb.sega.modelo.revision.BeanRevision;
import mx.edu.utez.aweb.sega.servicios.historial_rev.ServiceHistorial_rev;
import mx.edu.utez.aweb.sega.servicios.revision.ServiceRevision;
import mx.edu.utez.aweb.sega.utiles.EmailSend;
import mx.edu.utez.aweb.sega.utiles.OracleConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoRevision {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;
    EmailSend emailSend = new EmailSend();

    public List<BeanRevision> findAll(long id_usr, long rol) {
        List<BeanRevision> revisiones = new ArrayList<>();
        BeanRevision revision = null;

        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 5) {
                query = "SELECT * FROM gestionrevisiones WHERE gestionrevisiones.id_usuario=? and activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_usr);
            } else {
                query = "SELECT * FROM gestionrevisiones WHERE activo=1";
                pstm = conn.prepareStatement(query);
            }
            rs = pstm.executeQuery();
            while (rs.next()) {
                revision = new BeanRevision();
                revision.setId_rev(rs.getLong("id_rev"));
                revision.setFase(rs.getString("fase"));
                revision.setObservaciones(rs.getString("observaciones"));
                revision.setFecha_ult_mov(rs.getString("fecha_ult_mov"));
                revision.setId_mecanico(rs.getLong("id_usuario"));
                revision.setMartricula_auto(rs.getString("matricula"));
                revisiones.add(revision);
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        } finally {
            closeConnections();
        }
        return revisiones;
    }

    public BeanRevision findOne(long id_usr, long rol, long id_rev) {
        try {
            conn = new OracleConnection().getConnection();
            String query;
            if (rol == 5) {
                query = "SELECT * FROM gestionrevisiones WHERE id_rev=? and id_usuario=? and activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_rev);
                pstm.setLong(2, id_usr);
            } else {
                query = "SELECT * FROM gestionrevisiones WHERE id_rev=? and activo=1";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1, id_rev);
            }
            rs = pstm.executeQuery();
            if (rs.next()) {
                BeanRevision revision = new BeanRevision();
                revision.setId_rev(rs.getLong("id_rev"));
                revision.setFase(rs.getString("fase"));
                revision.setObservaciones(rs.getString("observaciones"));
                revision.setFecha_ult_mov(rs.getString("fecha_ult_mov"));
                revision.setId_mecanico(rs.getLong("id_usuario"));
                revision.setMartricula_auto(rs.getString("matricula"));
                return revision;
            }
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error findOne", e);
        } finally {
            closeConnections();
        }
        return null;
    }

    public boolean cambiarFase(long id_usr, long rol, long id_rev, String fase) {
        String nuevaFase;
        boolean enviar;
        switch (fase) {
            case "Ingreso":
                nuevaFase = "Inspección y realización";
                enviar = false;
                break;
            case "Inspección y realización":
                nuevaFase = "En pruebas";
                enviar = false;
                break;
            case "En pruebas":
                nuevaFase = "Salida del taller";
                enviar = true;
                break;
            default:
                nuevaFase = fase;
                enviar = false;
                break;
        }
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL cambiarFaseRevision('" + id_usr + "','" + rol + "', '" + id_rev + "', '" + nuevaFase + "')";
            //SET @p0='2'; SET @p1='5'; SET @p2='1'; SET @p3='Finalizado'; CALL cambiarFaseRevision(@p0, @p1, @p2, @p3);
            if (enviar) {
                ServiceRevision srvRev = new ServiceRevision();
                srvRev.enviarCorreo(id_usr, rol, id_rev, nuevaFase);
            }
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;

        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error eliminar", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean crear(String matricula, long id_usr, long rol) {
        //SET @p0='PXP-33-34'; SET @p1='2'; SET @p2='5'; CALL crearRevision(@p0, @p1, @p2);
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL crearRevision('" + matricula + "', '" + id_usr + "', '" + rol + "')";
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error crear rev", e);
            return false;
        } finally {
            closeConnections();
        }
    }


    public boolean eliminarHist(long id_rev, long id_hist) {
        //SET @p0='id_rev'; SET @p1='id_hist'; CALL eliminarHist(@p0, @p1);
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL eliminarHist('" + id_rev + "','" + id_hist + "')";
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error eliminarHistcat", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean actualizarHist(long id_rev, long id_hist, long nuevaCantidad) {
        //SET @p0='id_rev'; SET @p1='id_hist'; SET @p2='nuevaCantidad'; CALL modificarHist(@p0, @p1, @p2);
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL modificarHist('" + id_rev + "','" + id_hist + "','" + nuevaCantidad + "')";
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error actualizarHistcat", e);
            return false;
        } finally {
            closeConnections();
        }
    }


    public boolean agregarHist(long id_rev, long id_elm, String observaciones, long cantidad) {
        //SET @p0='1'; SET @p1='2'; SET @p2='ninguna'; SET @p3='1'; CALL agregarHist(@p0, @p1, @p2, @p3);
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL agregarHist('" + id_rev + "', '" + id_elm + "', '" + observaciones + "', '" + cantidad + "')";
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error agregarHistcat", e);
            return false;
        } finally {
            closeConnections();
        }
    }


    public boolean eliminar(long id_usr, long rol, long id_rev) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL eliminarRevision('" + id_usr + "', '" + rol + "', '" + id_rev + "')";
            //SET @p0='id:usr'; SET @p1='rol'; SET @p2='id_rev'; CALL eliminarRevision(@p0, @p1, @p2);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error cancelar revisión", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean actualizar(long id_usr, long rol, long id_rev, String fase, String observaciones) {
        boolean enviar;
        switch (fase) {
            case "Ingreso":
                enviar = true;
                break;
            case "Inspección y realización":
                enviar = false;
                break;
            case "En pruebas":
                enviar = false;
                break;
            case "Salida del taller":
                enviar = true;
                break;
            case "Finalizado":
                enviar = true;
                break;
            default:
                enviar = false;
                break;
        }
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL modificarRevision('" + id_usr + "', '" + rol + "', '" + id_rev + "', '"
                    + fase + "', '" + observaciones + "')";
            //SET @p0='id:usr'; SET @p1='rol';  SET @p2='id_rev'; SET @p3='Finalizado'; SET @p4='Ninguna';
            // CALL modificarRevision(@p0, @p1, @p2, @p3, @p4);
            if (enviar) {
                ServiceRevision srvRev = new ServiceRevision();
                srvRev.enviarCorreoMod(id_usr, rol, id_rev, fase);
            }
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error cancelar revisión", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean cancelarRev(long id_rev, long rol, long id) {
        try {
            conn = new OracleConnection().getConnection();
            String query = "CALL cancelarRevision('" + id_rev + "', '" + rol + "', '" + id + "')";
            //SET @p0='1'; CALL eliminarUsuario(@p0);
            pstm = conn.prepareStatement(query);
            pstm.executeQuery();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
                    .log(Level.SEVERE, "Error cancelar revisión", e);
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean finalizarRev(long id_rev) {
        try {
            conn = new OracleConnection().getConnection();
            String query="UPDATE revisiones SET fase='Finalizado',fecha_ult_mov=SYSDATE WHERE id_rev=?";
                pstm = conn.prepareStatement(query);
                pstm.setLong(1,id_rev);
                pstm.executeQuery();
                return true;
        } catch (SQLException e) {
            Logger.getLogger(DaoRevision.class.getName())
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

