package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Clase;
import services.ClaseService;
import services.impl.ClaseServiceImpl;

/**
 * Servlet implementation class ClaseServlet
 */
@WebServlet("/clases")
public class ClaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ClaseService claseService;

    public ClaseServlet() {
        super();
        claseService = new ClaseServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Clase> clases = claseService.listarClases();
        request.setAttribute("clases", clases);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clases.jsp");
        dispatcher.forward(request, response);
    }
}
