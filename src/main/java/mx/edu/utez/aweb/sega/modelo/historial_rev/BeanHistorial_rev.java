package mx.edu.utez.aweb.sega.modelo.historial_rev;

public class BeanHistorial_rev {

    private long id_hist;
    private long id_elemento;
    private String nombre;
    private double precioIndividual;
    private String descripcion;
    private String tipo_elemento;
    private long cantidadUtilizada;
    private double subtotal;
    private long id_rev;

    public BeanHistorial_rev() {
    }

    public long getId_hist() {
        return id_hist;
    }

    public void setId_hist(long id_hist) {
        this.id_hist = id_hist;
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

    public double getPrecioIndividual() {
        return precioIndividual;
    }

    public void setPrecioIndividual(double precioIndividual) {
        this.precioIndividual = precioIndividual;
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

    public long getCantidadUtilizada() {
        return cantidadUtilizada;
    }

    public void setCantidadUtilizada(long cantidadUtilizada) {
        this.cantidadUtilizada = cantidadUtilizada;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public long getId_rev() {
        return id_rev;
    }

    public void setId_rev(long id_rev) {
        this.id_rev = id_rev;
    }

    public BeanHistorial_rev(long id_hist, long id_elemento, String nombre, double precioIndividual, String descripcion, String tipo_elemento, long cantidadUtilizada, double subtotal, long id_rev) {
        this.id_hist = id_hist;
        this.id_elemento = id_elemento;
        this.nombre = nombre;
        this.precioIndividual = precioIndividual;
        this.descripcion = descripcion;
        this.tipo_elemento = tipo_elemento;
        this.cantidadUtilizada = cantidadUtilizada;
        this.subtotal = subtotal;
        this.id_rev = id_rev;
    }
}
