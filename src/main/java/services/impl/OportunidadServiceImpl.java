package services.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.OportunidadMapper;
import models.Oportunidad;
import services.OportunidadService;

public class OportunidadServiceImpl implements OportunidadService {

    @Override
    public List<Oportunidad> listarOportunidades() {
        try {
            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
            OportunidadMapper oportunidadMapper = session.getMapper(OportunidadMapper.class);
            return oportunidadMapper.listarOportunidades();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
