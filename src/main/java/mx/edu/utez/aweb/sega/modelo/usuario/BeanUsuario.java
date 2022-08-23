package mx.edu.utez.aweb.sega.modelo.usuario;

public class BeanUsuario {
    private long id_usuario;
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private String correo;
    private String curp;
    private String telefono;
    private String rfc;
    private String contrasena;
    private String calle;
    private String estado;
    private String colonia;
    private String referencias;
    private String municipio;
    private String codigoPostal;
    private long rol;

    public BeanUsuario() {
    }

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getReferencias() {
        return referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public long getRol() {
        return rol;
    }

    public void setRol(long rol) {
        this.rol = rol;
    }

    public BeanUsuario(long id_usuario, String nombre, String apellido_paterno, String apellido_materno, String correo, String curp, String telefono, String rfc, String contrasena, String calle, String estado, String colonia, String referencias, String municipio, String codigoPostal, long rol) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.correo = correo;
        this.curp = curp;
        this.telefono = telefono;
        this.rfc = rfc;
        this.contrasena = contrasena;
        this.calle = calle;
        this.estado = estado;
        this.colonia = colonia;
        this.referencias = referencias;
        this.municipio = municipio;
        this.codigoPostal = codigoPostal;
        this.rol = rol;
    }
}
