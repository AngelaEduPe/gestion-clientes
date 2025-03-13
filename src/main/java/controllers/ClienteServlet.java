package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Cliente;
import services.ClienteService;
import services.impl.ClienteServiceImpl;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet("/clientes")
public class ClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    private final ClienteService clienteService;

    public ClienteServlet() {
        super();
        clienteService = new ClienteServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> clientes = clienteService.listarClientes();
        request.setAttribute("clientes", clientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/clientes.jsp");
        dispatcher.forward(request, response);
    }
}


