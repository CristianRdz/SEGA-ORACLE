package mx.edu.utez.aweb.sega.modelo.auto;

public class BeanAuto {
    private String matricula;
    private String modelo;
    private String marca;
    private String color;
    private String n_serie;
    private String n_constancia;
    private String tipo_combustible;
    private String tipo_transmision;

    private long id_usuario;
    private String correo;
    private String rfc;

    private String tipo_llave;
    private String llave;

    public BeanAuto() {
    }


    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getTipo_llave() {
        return tipo_llave;
    }

    public void setTipo_llave(String tipo_llave) {
        this.tipo_llave = tipo_llave;
    }

    public String getLlave() {
        return llave;
    }

    public void setLlave(String llave) {
        this.llave = llave;
    }

    public BeanAuto(String matricula, String modelo, String marca, String color, String n_serie, String n_constancia, String tipo_combustible, String tipo_transmision, long id_usuario, String correo, String rfc,String tipo_llave,String llave) {
        this.matricula = matricula;
        this.modelo = modelo;
        this.marca = marca;
        this.color = color;
        this.n_serie = n_serie;
        this.n_constancia = n_constancia;
        this.tipo_combustible = tipo_combustible;
        this.tipo_transmision = tipo_transmision;
        this.id_usuario = id_usuario;
        this.correo = correo;
        this.rfc = rfc;
        this.tipo_llave = tipo_llave;
        this.llave = llave;
    }

}