package services;

import java.util.List;
import models.Producto;

public interface ProductoService {
    List<Producto> listarProductos();
    Producto obtenerPorId(int id);
}
