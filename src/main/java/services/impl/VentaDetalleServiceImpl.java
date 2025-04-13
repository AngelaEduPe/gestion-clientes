package services.impl;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import config.MyBatisUtil;
import dao.VentaDetalleMapper;
import models.VentaDetalle;
import services.VentaDetalleService;

public class VentaDetalleServiceImpl implements VentaDetalleService {

    @Override
    
    public List<VentaDetalle> listarDetalles() {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper ventaDetalleMapper = session.getMapper(VentaDetalleMapper.class);
            List<VentaDetalle> detalles = ventaDetalleMapper.listarDetalles();
            return detalles != null ? detalles : new ArrayList<>();  // Si es null, devolver una lista vacía
        } catch (Exception e) {
            System.out.println("Error al listar todos los detalles de venta: " + e);
            return new ArrayList<>();  // Devuelve una lista vacía en caso de error
        }
    }

    
    
    public VentaDetalle insertarVentaDetalle(VentaDetalle ventaDetalle) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper ventaDetalleMapper = session.getMapper(VentaDetalleMapper.class);
            ventaDetalleMapper.insertarVentaDetalle(ventaDetalle);
            session.commit();
            return ventaDetalle;
        } catch (Exception e) {
            System.out.println("Error al insertar detalle de venta: " + e);
            return null;
        }
    }


    public List<VentaDetalle> listarDetallesPorVenta(int idVenta) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper ventaDetalleMapper = session.getMapper(VentaDetalleMapper.class);
            return ventaDetalleMapper.listarDetallesPorVenta(idVenta);
        } catch (Exception e) {
            System.out.println("Error al listar detalles de venta: " + e);
            return null;
        }
    }
    
        
    public void aumentarCantidad(Integer idVentaDetalle) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper mapper = session.getMapper(VentaDetalleMapper.class);
            mapper.aumentarCantidad(idVentaDetalle);
            session.commit();
        } catch (Exception e) {
            System.out.println("Error al aumentar cantidad: " + e);
        }
    }
    
    public VentaDetalle obtenerPorVentaYTipoYItem(Integer idVenta, String tipoItem, Integer idItem) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            VentaDetalleMapper mapper = session.getMapper(VentaDetalleMapper.class);
            return mapper.obtenerPorVentaYTipoYItem(idVenta, tipoItem, idItem);
        } catch (Exception e) {
            System.out.println("Error al obtener detalle por tipo e ítem: " + e);
            return null;
        }
    }

    
      

}
