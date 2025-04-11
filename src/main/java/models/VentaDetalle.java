package models;

import java.sql.Date;

public class VentaDetalle {
    private Integer idVentaDetalle;
    private Integer idVenta;
    private String tipoItem; // 'producto', 'clase', 'suscripcion'
    private Integer idProducto;
    private Integer idClase;
    private Integer idSuscripcion;
    private Float precio;
    private Integer cantidad;
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

    public Float getPrecio() {
        return precio;
    }
    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Integer getCantidad() {
        return cantidad;
    }
    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }
    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
