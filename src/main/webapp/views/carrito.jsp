<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="models.VentaDetalle" %>
	<%@ page import="models.Producto, models.Clase, models.Suscripcion" %>
	<%@ page import="services.impl.ProductoServiceImpl, services.impl.ClaseServiceImpl, services.impl.SuscripcionServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANYRA POWERFIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>

<body class="bg-gray-100 text-gray-800">

<%
    List<VentaDetalle> carrito = (List<VentaDetalle>) session.getAttribute("carrito");
	ProductoServiceImpl productoService = new ProductoServiceImpl();
	ClaseServiceImpl claseService = new ClaseServiceImpl();
	SuscripcionServiceImpl suscripcionService = new SuscripcionServiceImpl();
	
	 List<Producto> productos = productoService.listarProductos();
	 List<Clase> clases = claseService.listarClases();
	 List<Suscripcion> suscripciones = suscripcionService.listarSuscripciones();
	 
	 String obtenerNombre (String tipo, int id) {
	        if (tipo.equals("producto")) {
	            for (Producto p : productos) {
	                if (p.getIdProducto() == id) return p.getNombre();
	            }
	        } else if (tipo.equals("clase")) {
	            for (Clase c : clases) {
	                if (c.getIdClase() == id) return c.getNombre();
	            }
	        } else if (tipo.equals("suscripcion")) {
	            for (Suscripcion s : suscripciones) {
	                if (s.getIdSuscripcion() == id) return s.getNombre();
	            }
	        }
	        return "Desconocido";
	    }

	    float total = 0;


%>

    <div class="container mx-auto p-6">
        <h1 class="text-2xl font-bold mb-6">🛒 Tu Carrito</h1>

        <% if (carrito.isEmpty()) { %>
            <p class="text-gray-600">El carrito está vacío.</p>
        <% } else { %>
            <table class="table-auto w-full bg-white rounded-lg shadow-md overflow-hidden">
                <thead class="bg-gray-200 text-left">
                    <tr>
                        <th class="px-4 py-2">Tipo</th>
                        <th class="px-4 py-2">ID</th>
                        <th class="px-4 py-2">Precio</th>
                        <th class="px-4 py-2">Cantidad</th>
                        <th class="px-4 py-2">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (VentaDetalle item : carrito) {
                        String tipo = item.getTipoItem();
                        int id = tipo.equals("producto") ? item.getIdProducto() :
                                 tipo.equals("clase") ? item.getIdClase() : item.getIdSuscripcion();
                        float precio = item.getPrecio();
                        int cantidad = item.getCantidad();
                        float subtotal = precio * cantidad;
                        total += subtotal;
                    %>
                        <tr class="border-t">
                            <td class="px-4 py-2"><%= tipo %></td>
                            <td class="px-4 py-2"><%= id %></td>
                            <td class="px-4 py-2">S/ <%= precio %></td>
                            <td class="px-4 py-2"><%= cantidad %></td>
                            <td class="px-4 py-2 font-semibold">S/ <%= subtotal %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="mt-6 flex justify-between items-center">
                <h2 class="text-xl font-bold">Total: S/ <%= total %></h2>
                <form action="venta" method="post">
                    <input type="hidden" name="montoTotal" value="<%= total %>" />
                    <label for="clienteId" class="mr-2">Cliente:</label>
                    <select name="clienteId" class="border rounded p-1" required>
                        <option value="">Seleccionar</option>
                        <!-- Aquí deberías llenar dinámicamente con clientes -->
                        <option value="1">Cliente 1</option>
                        <option value="2">Cliente 2</option>
                    </select>

                    <label for="metodoPago" class="ml-4 mr-2">Método de pago:</label>
                    <select name="metodoPago" class="border rounded p-1" required>
                        <option value="">Seleccionar</option>
                        <option value="efectivo">Efectivo</option>
                        <option value="tarjeta">Tarjeta</option>
                        <option value="yape">Yape</option>
                    </select>

                    <button type="submit" class="ml-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Finalizar Compra</button>
                </form>
            </div>
        <% } %>
    </div>

</body>
</html>