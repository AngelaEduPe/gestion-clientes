package services.impl;

import java.util.List;

import config.MyBatisUtil;
import dao.InteraccionMapper;
import models.Interaccion;
import services.InteraccionService;

public class InteraccionServiceImpl implements InteraccionService {

    @Override
    public List<Interaccion> listarInteracciones() {
        try {
            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
            InteraccionMapper interaccionMapper = session.getMapper(InteraccionMapper.class);
            return interaccionMapper.listarInteraccion();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
