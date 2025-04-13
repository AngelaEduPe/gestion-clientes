package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Clase;
import models.Cliente;
import models.Producto;
import models.Suscripcion;
import models.Venta;
import models.VentaDetalle;
import services.impl.ClaseServiceImpl;
import services.impl.ClienteServiceImpl;
import services.impl.ProductoServiceImpl;
import services.impl.SuscripcionServiceImpl;
import services.impl.VentaDetalleServiceImpl;
import services.impl.VentaServiceImpl;
import shared.Util;

@WebServlet("/venta")
public class VentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VentaServiceImpl ventaServiceImpl;
    private VentaDetalleServiceImpl ventaDetalleServiceImpl;
    private ProductoServiceImpl productoServiceImpl;
    private ClienteServiceImpl clienteServiceImpl;
    private ClaseServiceImpl claseServiceImpl;
    private SuscripcionServiceImpl suscripcionServiceImpl;

    public VentaServlet() {
        ventaServiceImpl = new VentaServiceImpl();
        ventaDetalleServiceImpl = new VentaDetalleServiceImpl();
        productoServiceImpl = new ProductoServiceImpl();
        clienteServiceImpl = new ClienteServiceImpl();
        claseServiceImpl = new ClaseServiceImpl();
        suscripcionServiceImpl = new SuscripcionServiceImpl();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = productoServiceImpl.listarProductos();
        List<Cliente> clientes = clienteServiceImpl.listarClientes();
        List<Clase> clases = claseServiceImpl.listarClases();
        List<Suscripcion> suscripciones = suscripcionServiceImpl.listarSuscripciones();

        request.setAttribute("productos", productos);
        request.setAttribute("clientes", clientes);
        request.setAttribute("clases", clases);
        request.setAttribute("suscripciones", suscripciones);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/venta.jsp");
        dispatcher.forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idItem = Integer.parseInt(request.getParameter("idItem"));
        String tipoItem = request.getParameter("tipoItem");
        System.out.println("Se está agregando un elemento al carrito: idItem = " + idItem + ", tipoItem = " + tipoItem);
        
        
        String sessionId = Util.getCookieValue(request.getCookies(), "JSESSIONID");
        
        
        Venta venta = ventaServiceImpl.obtenerVentaPorCodigoInterno(sessionId);
        
        if (venta == null) {
            Venta newVenta = new Venta();
            newVenta.setCodigoInterno(sessionId);
            venta = ventaServiceImpl.registrarVenta(newVenta);
            if (venta == null) {
                response.getWriter().append("Error al registrar la venta");
                return;
            }
        }

        // Buscar el detalle de la venta para el item
        System.out.println("Venta ID: " + venta.getIdVenta());
        VentaDetalle ventaDetalle = ventaDetalleServiceImpl.obtenerPorVentaYTipoYItem(venta.getIdVenta(), tipoItem, idItem);
        
        if (ventaDetalle == null) {
            VentaDetalle newVentaDetalle = new VentaDetalle();
            newVentaDetalle.setIdVenta(venta.getIdVenta());
            if ("producto".equals(tipoItem)) {
                newVentaDetalle.setIdProducto(idItem);
            } else if ("clase".equals(tipoItem)) {
                newVentaDetalle.setIdClase(idItem);
            } else if ("suscripcion".equals(tipoItem)) {
                newVentaDetalle.setIdSuscripcion(idItem);
            }
            ventaDetalle = ventaDetalleServiceImpl.insertarVentaDetalle(newVentaDetalle);
            if (ventaDetalle == null) {
                response.getWriter().append("Error al agregar el detalle de venta");
                return;
            }
        } else {
            ventaDetalleServiceImpl.aumentarCantidad(ventaDetalle.getIdVentaDetalle());
        }

        // Limpiar la cookie anterior
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if ("carrito".equals(cookie.getName())) {
                cookie.setValue("");  
                cookie.setMaxAge(0);  
                response.addCookie(cookie); 
            }
        }

       
        String carrito = Util.getCookieValue(cookies, "carrito");
        if (carrito == null || carrito.isEmpty()) {
            carrito = "";
        }
        
        
        if (tipoItem != null && !tipoItem.isEmpty() && idItem != null && idItem > 0) {
            if (!carrito.isEmpty()) {
                carrito += ","; 
            }
            carrito += tipoItem + ":" + idItem; 
        }

        // Actualizar la cookie "carrito"
        Cookie carritoCookie = new Cookie("carrito", carrito);
        carritoCookie.setMaxAge(60 * 60 * 24); 
        carritoCookie.setPath("/");  
        response.addCookie(carritoCookie);

        response.getWriter().append("OK");
    }



}