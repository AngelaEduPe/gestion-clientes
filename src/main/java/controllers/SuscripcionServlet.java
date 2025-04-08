package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Suscripcion;
import services.SuscripcionService;
import services.impl.SuscripcionServiceImpl;

/**
 * Servlet implementation class SuscripcionServlet
 */
@WebServlet("/suscripciones")
public class SuscripcionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final SuscripcionService suscripcionService;

    public SuscripcionServlet() {
        super();
        suscripcionService = new SuscripcionServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Suscripcion> suscripciones = suscripcionService.listarSuscripciones();
        request.setAttribute("suscripciones", suscripciones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/suscripciones.jsp");
        dispatcher.forward(request, response);
    }
}
