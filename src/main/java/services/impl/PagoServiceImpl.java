package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.PagoMapper;
import models.Pago;
import services.PagoService;

public class PagoServiceImpl implements PagoService {

    @Override
    public List<Pago> listarPagos() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            PagoMapper pagoMapper = session.getMapper(PagoMapper.class);
            return pagoMapper.listarPagos();
        } catch (Exception e) {
            System.out.println("Error al listar pagos: " + e);
            return null;
        }
    }
}
