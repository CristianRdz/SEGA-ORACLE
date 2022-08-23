package mx.edu.utez.aweb.sega.modelo.revision;

public class BeanRevision {
    private long id_rev;
    private String fase;
    private String observaciones;
    private String fecha_ult_mov;
    private long id_mecanico;
    private String martricula_auto;

    public BeanRevision() {
    }

    public long getId_rev() {
        return id_rev;
    }

    public void setId_rev(long id_rev) {
        this.id_rev = id_rev;
    }

    public String getFase() {
        return fase;
    }

    public void setFase(String fase) {
        this.fase = fase;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getFecha_ult_mov() {
        return fecha_ult_mov;
    }

    public void setFecha_ult_mov(String fecha_ult_mov) {
        this.fecha_ult_mov = fecha_ult_mov;
    }

    public long getId_mecanico() {
        return id_mecanico;
    }

    public void setId_mecanico(long id_mecanico) {
        this.id_mecanico = id_mecanico;
    }

    public String getMartricula_auto() {
        return martricula_auto;
    }

    public void setMartricula_auto(String martricula_auto) {
        this.martricula_auto = martricula_auto;
    }

    public BeanRevision(long id_rev, String fase, String observaciones, String fecha_ult_mov, long id_mecanico, String martricula_auto) {
        this.id_rev = id_rev;
        this.fase = fase;
        this.observaciones = observaciones;
        this.fecha_ult_mov = fecha_ult_mov;
        this.id_mecanico = id_mecanico;
        this.martricula_auto = martricula_auto;
    }
}

