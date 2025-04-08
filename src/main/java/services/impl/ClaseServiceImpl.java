package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.ClaseMapper;
import models.Clase;
import services.ClaseService;

public class ClaseServiceImpl implements ClaseService {

    @Override
    public List<Clase> listarClases() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            ClaseMapper claseMapper = session.getMapper(ClaseMapper.class);
            return claseMapper.listarClases();
        } catch (Exception e) {
            System.out.println("Error al listar clases: " + e);
            return null;
        }
    }
}
