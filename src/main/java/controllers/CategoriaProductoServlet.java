package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.CategoriaProducto;
import services.CategoriaProductoService;
import services.impl.CategoriaProductoServiceImpl;

/**
 * Servlet implementation class CategoriaProductoServlet
 */
@WebServlet("/categorias-productos")
public class CategoriaProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final CategoriaProductoService categoriaProductoService;

    public CategoriaProductoServlet() {
        super();
        categoriaProductoService = new CategoriaProductoServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Llamada al método correctamente
        List<CategoriaProducto> categoriasProductos = categoriaProductoService.listarCategoriasProducto(); 
        request.setAttribute("categoriasProductos", categoriasProductos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/categorias_productos.jsp");
        dispatcher.forward(request, response);
    }
}
