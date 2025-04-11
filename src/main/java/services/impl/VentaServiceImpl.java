package services.impl;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.VentaMapper;
import models.Venta;
import services.VentaService;

public class VentaServiceImpl implements VentaService {

    @Override
    public void registrarVenta(Venta venta) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaMapper ventaMapper = session.getMapper(VentaMapper.class);
            ventaMapper.registrarVenta(venta);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al registrar venta: " + e);
        }
    }
    
    
    public Venta obtenerVentaPorCodigoInterno(String codigoInterno) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaMapper ventaMapper = session.getMapper(VentaMapper.class);
            return ventaMapper.obtenerVentaPorCodigoInterno(codigoInterno);
        } catch (Exception e) {
            System.out.println("Error al obtener venta: " + e);
            return null;
        }
    }

}
