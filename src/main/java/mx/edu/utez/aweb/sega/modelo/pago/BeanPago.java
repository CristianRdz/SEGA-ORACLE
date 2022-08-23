package mx.edu.utez.aweb.sega.modelo.pago;


import mx.edu.utez.aweb.sega.modelo.revision.BeanRevision;
import mx.edu.utez.aweb.sega.modelo.usuario.BeanUsuario;

import java.util.List;

public class BeanPago {

    private long id_pago;
    private double cantidad;
    private String fecha_realizacion;
    private long estado_pago;
    private long id_usuario;
    private long id_revision;

    public BeanPago() {
    }

    public long getId_pago() {
        return id_pago;
    }

    public void setId_pago(long id_pago) {
        this.id_pago = id_pago;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha_realizacion() {
        return fecha_realizacion;
    }

    public void setFecha_realizacion(String fecha_realizacion) {
        this.fecha_realizacion = fecha_realizacion;
    }

    public long getEstado_pago() {
        return estado_pago;
    }

    public void setEstado_pago(long estado_pago) {
        this.estado_pago = estado_pago;
    }

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public long getId_revision() {
        return id_revision;
    }

    public void setId_revision(long id_revision) {
        this.id_revision = id_revision;
    }

    public BeanPago(long id_pago, double cantidad, String fecha_realizacion, long estado_pago, long id_usuario, long id_revision) {
        this.id_pago = id_pago;
        this.cantidad = cantidad;
        this.fecha_realizacion = fecha_realizacion;
        this.estado_pago = estado_pago;
        this.id_usuario = id_usuario;
        this.id_revision = id_revision;
    }
}
