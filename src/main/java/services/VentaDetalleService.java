package services;

import models.VentaDetalle;
import java.util.List;

public interface VentaDetalleService {
    void insertarVentaDetalle(VentaDetalle ventaDetalle);
    List<VentaDetalle> listarDetallesPorVenta(int idVenta);
    void insertarVentaProducto(int idDetalle, int idProducto);
    void insertarVentaClase(int idDetalle, int idClase);
    void insertarVentaSuscripcion(int idDetalle, int idSuscripcion);

}

