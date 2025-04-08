package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comentario;
import services.ComentarioService;
import services.impl.ComentarioServiceImpl;

/**
 * Servlet implementation class ComentarioServlet
 */
@WebServlet("/comentarios")
public class ComentarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ComentarioService comentarioService;

    public ComentarioServlet() {
        super();
        comentarioService = new ComentarioServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Comentario> comentarios = comentarioService.listarComentarios();
        request.setAttribute("comentarios", comentarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/comentarios.jsp");
        dispatcher.forward(request, response);
    }
}
