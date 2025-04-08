package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.VentaProducto;
import services.VentaProductoService;
import services.impl.VentaProductoServiceImpl;

/**
 * Servlet implementation class VentaProductoServlet
 */
@WebServlet("/ventas-productos")
public class VentaProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final VentaProductoService ventaProductoService;

    public VentaProductoServlet() {
        super();
        ventaProductoService = new VentaProductoServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<VentaProducto> ventasProductos = ventaProductoService.listarVentasProductos();
        request.setAttribute("ventasProductos", ventasProductos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/ventas_productos.jsp");
        dispatcher.forward(request, response);
    }
}
