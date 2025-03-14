package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Venta;
import services.VentaService;
import services.impl.VentaServiceImpl;

@WebServlet("/ventas")
public class VentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final VentaService ventaService;

    public VentaServlet() {
        super();
        ventaService = new VentaServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Venta> ventas = ventaService.listarVentas();
        request.setAttribute("ventas", ventas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/ventas.jsp");
        dispatcher.forward(request, response);
    }
}
