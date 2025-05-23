package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Pago;
import services.PagoService;
import services.impl.PagoServiceImpl;

/**
 * Servlet implementation class PagoServlet
 */
@WebServlet("/pagos")
public class PagoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final PagoService pagoService;

    public PagoServlet() {
        super();
        pagoService = new PagoServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Pago> pagos = pagoService.listarPagos();
        request.setAttribute("pagos", pagos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/pagos.jsp");
        dispatcher.forward(request, response);
    }
}
