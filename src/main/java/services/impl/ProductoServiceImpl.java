package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.ProductoMapper;
import models.Producto;
import services.ProductoService;

public class ProductoServiceImpl implements ProductoService {

    @Override
    public List<Producto> listarProductos() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            ProductoMapper productoMapper = session.getMapper(ProductoMapper.class);
            return productoMapper.listarProductos();
        } catch (Exception e) {
            System.out.println("Error al listar productos: " + e);
            return null;
        }
    }
    
    public Producto obtenerPorId(int id) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            ProductoMapper mapper = session.getMapper(ProductoMapper.class);
            return mapper.obtenerPorId(id);
        }
    }
}
