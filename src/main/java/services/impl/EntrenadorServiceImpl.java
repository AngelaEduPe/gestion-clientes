package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.EntrenadorMapper;
import models.Entrenador;
import services.EntrenadorService;

public class EntrenadorServiceImpl implements EntrenadorService {

    @Override
    public List<Entrenador> listarEntrenadores() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            EntrenadorMapper entrenadorMapper = session.getMapper(EntrenadorMapper.class);
            return entrenadorMapper.listarEntrenadores();
        } catch (Exception e) {
            System.out.println("Error al listar entrenadores: " + e);
            return null;
        }
    }
}
