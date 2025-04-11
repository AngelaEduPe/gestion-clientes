package services.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.VentaDetalleMapper;
import models.VentaDetalle;
import services.VentaDetalleService;

public class VentaDetalleServiceImpl implements VentaDetalleService {

    @Override
    public void insertarVentaDetalle(VentaDetalle ventaDetalle) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper ventaDetalleMapper = session.getMapper(VentaDetalleMapper.class);
            ventaDetalleMapper.insertarVentaDetalle(ventaDetalle);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al insertar detalle de venta: " + e);
        }
    }

    @Override
    public List<VentaDetalle> listarDetallesPorVenta(int idVenta) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper ventaDetalleMapper = session.getMapper(VentaDetalleMapper.class);
            return ventaDetalleMapper.listarDetallesPorVenta(idVenta);
        } catch (Exception e) {
            System.out.println("Error al listar detalles de venta: " + e);
            return null;
        }
    }
    
    @Override
    public void insertarVentaProducto(int idDetalle, int idProducto) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper mapper = session.getMapper(VentaDetalleMapper.class);
            mapper.insertarVentaProducto(idDetalle, idProducto);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al insertar en venta_producto: " + e);
        }
    }

    @Override
    public void insertarVentaClase(int idDetalle, int idClase) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper mapper = session.getMapper(VentaDetalleMapper.class);
            mapper.insertarVentaClase(idDetalle, idClase);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al insertar en venta_clase: " + e);
        }
    }

    @Override
    public void insertarVentaSuscripcion(int idDetalle, int idSuscripcion) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper mapper = session.getMapper(VentaDetalleMapper.class);
            mapper.insertarVentaSuscripcion(idDetalle, idSuscripcion);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al insertar en venta_suscripcion: " + e);
        }
    }

}
