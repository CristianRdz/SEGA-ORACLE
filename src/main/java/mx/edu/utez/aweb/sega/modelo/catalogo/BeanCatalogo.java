package mx.edu.utez.aweb.sega.modelo.catalogo;

public class BeanCatalogo {
    private long id_elemento;
    private String nombre;
    private String descripcion;
    private double precio;

    private String tipo_elemento;
    private long cantidad;

    public BeanCatalogo() {
    }

    public long getId_elemento() {
        return id_elemento;
    }

    public void setId_elemento(long id_elemento) {
        this.id_elemento = id_elemento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo_elemento() {
        return tipo_elemento;
    }

    public void setTipo_elemento(String tipo_elemento) {
        this.tipo_elemento = tipo_elemento;
    }

    public long getCantidad() {
        return cantidad;
    }

    public void setCantidad(long cantidad) {
        this.cantidad = cantidad;
    }

    public BeanCatalogo(long id_elemento, String nombre, String descripcion, double precio, String tipo_elemento, long cantidad) {
        this.id_elemento = id_elemento;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.tipo_elemento = tipo_elemento;
        this.cantidad = cantidad;
    }
}
