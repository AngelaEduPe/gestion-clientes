package models;

import java.sql.Date;

public class VentaDetalle {
    private Integer idVentaDetalle;
    private Integer idVenta;
    private String tipoItem; // 'producto', 'clase', 'suscripcion'
    private Integer idProducto;
    private Integer idClase;
    private Integer idSuscripcion;
    private Float precioUnitario;
    private Integer cantidad;
    private String nombreProducto; 
    private String nombreClase;
    private String nombreSuscripcion;
    private Date fechaCreacion;

    // Getters y Setters
    public Integer getIdVentaDetalle() {
        return idVentaDetalle;
    }
    public void setIdVentaDetalle(Integer idVentaDetalle) {
        this.idVentaDetalle = idVentaDetalle;
    }

    public Integer getIdVenta() {
        return idVenta;
    }
    public void setIdVenta(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public String getTipoItem() {
        return tipoItem;
    }
    public void setTipoItem(String tipoItem) {
        this.tipoItem = tipoItem;
    }

    public Integer getIdProducto() {
        return idProducto;
    }
    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public Integer getIdClase() {
        return idClase;
    }
    public void setIdClase(Integer idClase) {
        this.idClase = idClase;
    }

    public Integer getIdSuscripcion() {
        return idSuscripcion;
    }
    public void setIdSuscripcion(Integer idSuscripcion) {
        this.idSuscripcion = idSuscripcion;
    }

    public Float getPrecioUnitario() {
        return precioUnitario;
    }
    public void setPrecio(Float precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public Integer getCantidad() {
        return cantidad;
    }
    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
    
    public String getNombreProducto() {
        return nombreProducto;
    }
    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getNombreClase() {
        return nombreClase;
    }
    public void setNombreClase(String nombreClase) {
        this.nombreClase = nombreClase;
    }

    public String getNombreSuscripcion() {
        return nombreSuscripcion;
    }
    public void setNombreSuscripcion(String nombreSuscripcion) {
        this.nombreSuscripcion = nombreSuscripcion;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }
    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
