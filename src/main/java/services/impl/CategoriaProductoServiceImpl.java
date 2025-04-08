package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.CategoriaProductoMapper;
import models.CategoriaProducto;
import services.CategoriaProductoService;

public class CategoriaProductoServiceImpl implements CategoriaProductoService {

    @Override
    public List<CategoriaProducto> listarCategoriasProducto() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            CategoriaProductoMapper categoriaProductoMapper = session.getMapper(CategoriaProductoMapper.class);
            return categoriaProductoMapper.listarCategoriasProducto();
        } catch (Exception e) {
            System.out.println("Error al listar categorías de productos: " + e);
            return null;
        }
    }
}
