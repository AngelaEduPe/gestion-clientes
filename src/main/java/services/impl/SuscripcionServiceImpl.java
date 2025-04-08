package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.SuscripcionMapper;
import models.Suscripcion;
import services.SuscripcionService;

public class SuscripcionServiceImpl implements SuscripcionService {

    @Override
    public List<Suscripcion> listarSuscripciones() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            SuscripcionMapper suscripcionMapper = session.getMapper(SuscripcionMapper.class);
            return suscripcionMapper.listarSuscripciones();
        } catch (Exception e) {
            System.out.println("Error al listar suscripciones: " + e);
            return null;
        }
    }
}
