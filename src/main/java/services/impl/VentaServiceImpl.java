package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.VentaMapper;
import models.Venta;
import services.VentaService;

public class VentaServiceImpl implements VentaService {

    @Override
    public List<Venta> listarVentas() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaMapper ventaMapper = session.getMapper(VentaMapper.class);
            return ventaMapper.listarVentas();
        } catch (Exception e) {
            System.out.println("Error al listar ventas: " + e.getMessage());
            return null;
        }
    }
}
