package dao;

import models.Venta;

public interface VentaMapper {
	void registrarVenta(Venta venta);
	Venta obtenerVentaPorCodigoInterno(String codigoInterno);

}
