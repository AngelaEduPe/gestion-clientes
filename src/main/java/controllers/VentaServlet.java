package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Clase;
import models.Cliente;
import models.Producto;
import models.Suscripcion;
import models.Venta;
import models.VentaDetalle;
import services.impl.ClaseServiceImpl;
import services.impl.ClienteServiceImpl;
import services.impl.ProductoServiceImpl;
import services.impl.SuscripcionServiceImpl;
import services.impl.VentaDetalleServiceImpl;
import services.impl.VentaServiceImpl;

@WebServlet("/venta")
public class VentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private VentaServiceImpl ventaServiceImpl;
    private VentaDetalleServiceImpl ventaDetalleServiceImpl;
    private ProductoServiceImpl productoServiceImpl;
    private ClienteServiceImpl clienteServiceImpl;
    private ClaseServiceImpl claseServiceImpl;
    private SuscripcionServiceImpl suscripcionServiceImpl;

    public VentaServlet() {
        ventaServiceImpl = new VentaServiceImpl();
        ventaDetalleServiceImpl = new VentaDetalleServiceImpl();
        productoServiceImpl = new ProductoServiceImpl();
        clienteServiceImpl = new ClienteServiceImpl();
        claseServiceImpl = new ClaseServiceImpl();
        suscripcionServiceImpl = new SuscripcionServiceImpl();
    }

    // Muestra el formulario de venta con productos, clases, suscripciones, etc.
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = productoServiceImpl.listarProductos();
        List<Cliente> clientes = clienteServiceImpl.listarClientes();
        List<Clase> clases = claseServiceImpl.listarClases();
        List<Suscripcion> suscripciones = suscripcionServiceImpl.listarSuscripciones();

        request.setAttribute("productos", productos);
        request.setAttribute("clientes", clientes);
        request.setAttribute("clases", clases);
        request.setAttribute("suscripciones", suscripciones);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/venta.jsp");
        dispatcher.forward(request, response);
    }

    // Procesa el registro de una venta y sus detalles desde el carrito
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String sessionId = (String) session.getAttribute("sessionId"); 
        Venta venta = ventaServiceImpl.obtenerVentaPorCodigoInterno(sessionId);

        int idCliente = Integer.parseInt(request.getParameter("clienteId"));
        String metodoPago = request.getParameter("metodoPago");
        float montoTotal = Float.parseFloat(request.getParameter("montoTotal"));

        if (venta == null) {
            Venta nuevaVenta = new Venta();
            nuevaVenta.setCodigoInterno(sessionId);
            nuevaVenta.setIdCliente(idCliente);
            nuevaVenta.setMetodoPago(metodoPago);
            nuevaVenta.setMontoTotal(montoTotal);

            ventaServiceImpl.registrarVenta(nuevaVenta);
            venta = nuevaVenta;
        } else {
            venta.setIdCliente(idCliente);
            venta.setMetodoPago(metodoPago);
            venta.setMontoTotal(montoTotal);
            // si luego deseas actualizar la venta en BD, puedes implementar actualizarVenta()
        }


        // 2. Registrar cada ítem del carrito
        List<VentaDetalle> carrito = (List<VentaDetalle>) session.getAttribute("carrito");

        if (carrito != null && !carrito.isEmpty()) {
            for (VentaDetalle detalle : carrito) {
                detalle.setIdVenta(venta.getIdVenta()); // Asociar el idVenta generado a cada detalle
                ventaDetalleServiceImpl.insertarVentaDetalle(detalle); // Insertar en la BD
            }
            session.removeAttribute("carrito"); // Vaciar el carrito después de la venta
        }

        // 3. Redirigir a la página de confirmación
        response.sendRedirect("venta_confirmada.jsp");
    }

}