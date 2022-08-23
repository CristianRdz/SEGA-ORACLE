package mx.edu.utez.aweb.sega.modelo.revision;

public class BeanControl {
    private long id_rev;
    private String fecha_ult_mov;
    private String fase;
    private String modelo;
    private String marca;
    private String matricula;
    private String n_serie;
    private String n_constancia;
    private String color;
    private String tipo_combustible;

    private String tipo_transmision;
    private String observaciones;
    private long id_usr;
    private String correo;
    private long id_mecanico;

    public BeanControl() {

    }

    public long getId_rev() {
        return id_rev;
    }

    public void setId_rev(long id_rev) {
        this.id_rev = id_rev;
    }

    public String getFecha_ult_mov() {
        return fecha_ult_mov;
    }

    public void setFecha_ult_mov(String fecha_ult_mov) {
        this.fecha_ult_mov = fecha_ult_mov;
    }

    public String getFase() {
        return fase;
    }

    public void setFase(String fase) {
        this.fase = fase;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getN_serie() {
        return n_serie;
    }

    public void setN_serie(String n_serie) {
        this.n_serie = n_serie;
    }

    public String getN_constancia() {
        return n_constancia;
    }

    public void setN_constancia(String n_constancia) {
        this.n_constancia = n_constancia;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTipo_combustible() {
        return tipo_combustible;
    }

    public void setTipo_combustible(String tipo_combustible) {
        this.tipo_combustible = tipo_combustible;
    }

    public String getTipo_transmision() {
        return tipo_transmision;
    }

    public void setTipo_transmision(String tipo_transmision) {
        this.tipo_transmision = tipo_transmision;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public long getId_usr() {
        return id_usr;
    }

    public void setId_usr(long id_usr) {
        this.id_usr = id_usr;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public long getId_mecanico() {
        return id_mecanico;
    }

    public void setId_mecanico(long id_mecanico) {
        this.id_mecanico = id_mecanico;
    }

    public BeanControl(long id_rev, String fecha_ult_mov, String fase, String modelo, String marca, String matricula, String n_serie, String n_constancia, String color, String tipo_combustible, String tipo_transmision, String observaciones, long id_usr, String correo, long id_mecanico) {
        this.id_rev = id_rev;
        this.fecha_ult_mov = fecha_ult_mov;
        this.fase = fase;
        this.modelo = modelo;
        this.marca = marca;
        this.matricula = matricula;
        this.n_serie = n_serie;
        this.n_constancia = n_constancia;
        this.color = color;
        this.tipo_combustible = tipo_combustible;
        this.tipo_transmision = tipo_transmision;
        this.observaciones = observaciones;
        this.id_usr = id_usr;
        this.correo = correo;
        this.id_mecanico = id_mecanico;
    }
}
