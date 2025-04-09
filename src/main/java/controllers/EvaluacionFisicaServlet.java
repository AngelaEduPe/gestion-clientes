package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.EvaluacionFisica;
import services.EvaluacionFisicaService;
import services.impl.EvaluacionFisicaServiceImpl;

/**
 * Servlet implementation class EvaluacionFisicaServlet
 */
@WebServlet("/evaluaciones-fisicas")
public class EvaluacionFisicaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final EvaluacionFisicaService evaluacionFisicaService;

    public EvaluacionFisicaServlet() {
        super();
        evaluacionFisicaService = new EvaluacionFisicaServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EvaluacionFisica> evaluacionesFisicas = evaluacionFisicaService.listarEvaluacionesFisicas();
        request.setAttribute("evaluacionesFisicas", evaluacionesFisicas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/evaluacionesFisicas.jsp");
        dispatcher.forward(request, response);
    }
}
