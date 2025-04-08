package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.EvaluacionFisicaMapper;
import models.EvaluacionFisica;
import services.EvaluacionFisicaService;

public class EvaluacionFisicaServiceImpl implements EvaluacionFisicaService {

    @Override
    public List<EvaluacionFisica> listarEvaluacionesFisicas() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            EvaluacionFisicaMapper evaluacionFisicaMapper = session.getMapper(EvaluacionFisicaMapper.class);
            return evaluacionFisicaMapper.listarEvaluacionesFisicas();
        } catch (Exception e) {
            System.out.println("Error al listar evaluaciones físicas: " + e);
            return null;
        }
    }
}
