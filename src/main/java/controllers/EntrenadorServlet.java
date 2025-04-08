package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Entrenador;
import services.EntrenadorService;
import services.impl.EntrenadorServiceImpl;

/**
 * Servlet implementation class EntrenadorServlet
 */
@WebServlet("/entrenadores")
public class EntrenadorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final EntrenadorService entrenadorService;

    public EntrenadorServlet() {
        super();
        entrenadorService = new EntrenadorServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Entrenador> entrenadores = entrenadorService.listarEntrenadores();
        request.setAttribute("entrenadores", entrenadores);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/entrenadores.jsp");
        dispatcher.forward(request, response);
    }
}
