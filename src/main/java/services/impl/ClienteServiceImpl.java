package services.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.ClienteMapper;
import models.Cliente;
import services.ClienteService;

public class ClienteServiceImpl implements ClienteService {

    @Override
    public List<Cliente> listarClientes() {
        try {
            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
            ClienteMapper clienteMapper = session.getMapper(ClienteMapper.class);
            return clienteMapper.listarClientes();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    
}
