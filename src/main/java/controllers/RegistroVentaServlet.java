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

@WebServlet("/registroventa")
public class RegistroVentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    private VentaDetalleServiceImpl ventaDetalleServiceImpl;
    private ProductoServiceImpl productoServiceImpl;
    private ClienteServiceImpl clienteServiceImpl;
    private ClaseServiceImpl claseServiceImpl;
    private SuscripcionServiceImpl suscripcionServiceImpl;

    public RegistroVentaServlet() {
        
        ventaDetalleServiceImpl = new VentaDetalleServiceImpl();
        productoServiceImpl = new ProductoServiceImpl();
        clienteServiceImpl = new ClienteServiceImpl();
        claseServiceImpl = new ClaseServiceImpl();
        suscripcionServiceImpl = new SuscripcionServiceImpl();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
    	


    	List<VentaDetalle> detalles = ventaDetalleServiceImpl.listarDetalles();  // Asegúrate de que listarDetalles() no devuelva null
    	if (detalles == null) {
    	    detalles = new ArrayList<>();  // Si es null, inicializa como lista vacía
    	}
    	List<Producto> productos = productoServiceImpl.listarProductos();
        List<Clase> clases = claseServiceImpl.listarClases();
        List<Suscripcion> suscripciones = suscripcionServiceImpl.listarSuscripciones();
        List<Cliente> clientes = clienteServiceImpl.listarClientes();
        
        request.setAttribute("detalles", detalles);     
        request.setAttribute("clientes", clientes);
        request.setAttribute("productos", productos);
        request.setAttribute("clases", clases);
        request.setAttribute("suscripciones", suscripciones);
        

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/registroVenta.jsp");
        dispatcher.forward(request, response);
    }


    
    
    

    
        
        
        
        
        

    


}