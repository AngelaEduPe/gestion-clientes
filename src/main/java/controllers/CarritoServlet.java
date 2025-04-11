package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.VentaDetalle;

/**
 * Servlet implementation class CarritoServlet
 */
@WebServlet("/carrito")
public class CarritoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
     // Obtener el valor de una cookie directamente
        String sessionId = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("sessionId")) {
                    sessionId = cookie.getValue();
                    break;
                }
            }
        }

        List<VentaDetalle> carrito = (List<VentaDetalle>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        String tipo = request.getParameter("tipo"); // producto, clase, suscripcion
        int idItem = Integer.parseInt(request.getParameter("id"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        VentaDetalle detalle = new VentaDetalle();
        detalle.setTipoItem(tipo);
        detalle.setPrecio(precio);
        detalle.setCantidad(cantidad);

        // Dependiendo del tipo, asignamos el ID correspondiente
        switch (tipo) {
            case "producto": detalle.setIdProducto(idItem); break;
            case "clase": detalle.setIdClase(idItem); break;
            case "suscripcion": detalle.setIdSuscripcion(idItem); break;
        }

        carrito.add(detalle);
        session.setAttribute("carrito", carrito);

        response.sendRedirect("views/carrito.jsp"); // Puedes redirigir a carrito.jsp o de vuelta a venta.jsp
    }
}