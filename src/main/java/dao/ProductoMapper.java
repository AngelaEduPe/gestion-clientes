package dao;

import java.util.List;
import models.Producto;

public interface ProductoMapper {
    List<Producto> listarProductos();
    Producto obtenerPorId(int id);
}
