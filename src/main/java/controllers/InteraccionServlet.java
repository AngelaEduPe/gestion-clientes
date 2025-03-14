package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Interaccion;
import services.InteraccionService;
import services.impl.InteraccionServiceImpl;

/**
 * Servlet implementation class InteraccionServlet
 */
@WebServlet("/interacciones")
public class InteraccionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    private final InteraccionService interaccionService;

    public InteraccionServlet() {
        super();
        interaccionService = new InteraccionServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Interaccion> interacciones = interaccionService.listarInteracciones();
        request.setAttribute("interacciones", interacciones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/interacciones.jsp");
        dispatcher.forward(request, response);
    }
}