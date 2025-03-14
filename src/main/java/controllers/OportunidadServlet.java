package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Oportunidad;
import services.OportunidadService;
import services.impl.OportunidadServiceImpl;

@WebServlet("/oportunidades")
public class OportunidadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final OportunidadService oportunidadService;

    public OportunidadServlet() {
        super();
        oportunidadService = new OportunidadServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Oportunidad> oportunidades = oportunidadService.listarOportunidades();
        request.setAttribute("oportunidades", oportunidades);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/oportunidades.jsp");
        dispatcher.forward(request, response);
    }
}
