package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.ComentarioMapper;
import models.Comentario;
import services.ComentarioService;

public class ComentarioServiceImpl implements ComentarioService {

    @Override
    public List<Comentario> listarComentarios() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            ComentarioMapper comentarioMapper = session.getMapper(ComentarioMapper.class);
            return comentarioMapper.listarComentarios();
        } catch (Exception e) {
            System.out.println("Error al listar comentarios: " + e);
            return null;
        }
    }
}
