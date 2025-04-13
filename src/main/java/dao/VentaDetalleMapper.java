package dao;

import models.VentaDetalle;

import java.util.List;

public interface VentaDetalleMapper {
	List<VentaDetalle> listarDetalles();
	VentaDetalle insertarVentaDetalle(VentaDetalle ventaDetalle);
    List<VentaDetalle> listarDetallesPorVenta(int idVenta);
    VentaDetalle obtenerPorVentaYTipoYItem(Integer idVenta, String tipoItem, Integer idItem);
    void aumentarCantidad(Integer idVentaDetalle);

}
