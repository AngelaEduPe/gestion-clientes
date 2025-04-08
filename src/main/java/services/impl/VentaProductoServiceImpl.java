package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.VentaProductoMapper;
import models.VentaProducto;
import services.VentaProductoService;

public class VentaProductoServiceImpl implements VentaProductoService {

    @Override
    public List<VentaProducto> listarVentasProductos() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaProductoMapper ventaProductoMapper = session.getMapper(VentaProductoMapper.class);
            return ventaProductoMapper.listarVentasProductos();
        } catch (Exception e) {
            System.out.println("Error al listar venta de productos: " + e);
            return null;
        }
    }
}
