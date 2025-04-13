<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, models.Producto, models.Cliente, models.VentaDetalle, models.Clase, models.Suscripcion" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registro de Venta - ANYRA POWERFIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
	<body class="bg-[#1f1f1f] p-8">
	
	<%
		List<Producto> productos = (List<Producto>) request.getAttribute("productos");
		List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
		List<Clase> clases = (List<Clase>) request.getAttribute("clases");
		List<Suscripcion> suscripciones = (List<Suscripcion>) request.getAttribute("suscripciones");
		List<VentaDetalle> detalles =(List<VentaDetalle>) request.getAttribute("detalles");    
	%>
	
	
	<header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0 z-30">
        <div class="logo-container p-2 mb-2">
            <img src="https://i.postimg.cc/vTjLxPDs/Logo-Anyra-Powe-Fit.png" alt="Logo" class="w-50 mx-auto">
        </div>
        <div class="sidebar flex flex-col bg-black flex-grow">
            <a href="/gestion-clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" class="w-5 mr-2">Inicio
            </a>
            <a href="/gestion-clientes/clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/share_2.png" class="w-5 mr-2">Clientes
            </a>
            <a href="/gestion-clientes/entrenadores" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
	            <img src="https://img.icons8.com/ios7/600w/FFFFFF/dumbbell.png" alt="Entrenadores" class="w-5 mr-2">
	            Entrenadores
	        </a>
	        <a href="/gestion-clientes/suscripciones" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
	            <img src="https://img.icons8.com/ios7/600w/FFFFFF/contract-job.png" alt="Suscripciones" class="w-5 mr-2">
	            Suscripciones
	        </a>
	        <a href="/gestion-clientes/clases" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
	            <img src="https://img.icons8.com/ios7/600w/FFFFFF/bench-press-with-dumbbells.png" alt="Clases" class="w-5 mr-2">
	            Clases
	        </a>
	        <a href="/gestion-clientes/evaluacionesFisicas" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
	            <img src="https://img.icons8.com/win10/200w/FFFFFF/view.png" alt="Evaluaciones Físicas" class="w-5 mr-2">
	            Evaluaciones Físicas
	        </a>
	        <a href="/gestion-clientes/pagos" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
	            <img src="https://previews.123rf.com/images/sabuhinovruzov/sabuhinovruzov1705/sabuhinovruzov170501651/78710089-icono-de-vector-de-d%C3%B3lar-dinero-ilustraci%C3%B3n-de-efectivo-blanco-y-negro-esquema-de-icono-de-banca.jpg" alt="Pagos" class="w-5 mr-2">
	            Pagos
	        </a>
            <a href="/gestion-clientes/venta" class="text-yellow-400 font-bold p-2 pl-4 flex items-center bg-gray-800 rounded">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/product.png" class="w-5 mr-2">Venta de Productos
            </a>
            <a href="/gestion-clientes/comentarios" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/comentarios")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/communication.png" alt="Comentarios" class="w-5 mr-2">
            Comentarios
        </a>
        </div>
    </header>
		<main class="relative ml-[150px] mt-8 p-8 h-[calc(100vh-2rem)] overflow-auto">
		    <!-- Fondo oscuro con imágenes -->
		    <div class="absolute inset-0 ml-[100px] mt-[-50px] z-0">
		        <img src="https://images.unsplash.com/photo-1623874514711-0f321325f318?q=80&w=2070&auto=format&fit=crop" class="w-full h-full object-cover brightness-50 rounded-0xl" />
		    </div>
		    <div class="absolute inset-0 ml-[100px] mt-[-50px] z-0">
		        <img src="https://tablered.mx.arauco.com/wp-content/uploads/2020/04/Negro.jpg" class="w-full h-full object-cover opacity-30 rounded-0xl" />
		    </div>
		
		    <!-- Contenido principal -->
		    <div class="relative z-20 bg-black bg-opacity-70 p-8 rounded-2xl shadow-lg text-white max-w-4xl mx-auto mt-8">
		        <h1 class="text-4xl font-bold text-yellow-500 mb-6 text-center" style="font-family: 'Bebas Neue', sans-serif;">
		            Registrar Nueva Venta
		        </h1>

        <!-- Formulario de cliente -->
        <form action="VentaServlet" method="post">
            <!-- Cliente -->
            <div class="mb-6">
                <label for="clienteId" class="block font-medium mb-1">Seleccionar Cliente:</label>
                <select name="clienteId" id="clienteId" class="w-full p-2 border rounded bg-gray-800 text-white" required>
                    <option value="">-- Seleccione un cliente --</option>
                    <% for (Cliente c : clientes) { %>
                        <option value="<%= c.getIdCliente() %>"><%= c.getNombres() %> <%= c.getApellidoPaterno() %> <%= c.getApellidoMaterno() %></option>
                    <% } %>
                </select>
            </div>

            <!-- Método de pago -->
            <div class="mb-6">
                <label for="metodoPago" class="block font-medium mb-1">Método de Pago:</label>
                <select name="metodoPago" id="metodoPago" class="w-full p-2 border rounded bg-gray-800 text-white" required>
                    <option value="">-- Seleccione un método --</option>
                    <option value="EFECTIVO">Efectivo</option>
                    <option value="TARJETA">Tarjeta</option>
                    <option value="TRANSFERENCIA">Transferencia</option>
                </select>
            </div>

            <!-- Resumen del carrito -->
			<div class="mb-6">
			    <h2 class="text-2xl font-bold text-yellow-400 mb-3">Resumen de Ítems en Carrito</h2>
			    <table class="w-full text-white text-sm bg-gray-900 rounded-lg overflow-hidden">
			        <thead>
        <tr>
            <th class="py-2 px-4 text-left">Tipo</th>
            <th class="py-2 px-4 text-left">Nombre</th>
            <th class="py-2 px-4 text-left">Cantidad</th>
            <th class="py-2 px-4 text-left">Precio Unitario</th>
            <th class="py-2 px-4 text-left">Subtotal</th>
        </tr>
		    </thead>
		    <tbody>
		        <% for (VentaDetalle detalle : detalles) { %>
		            <tr>
		                <td class="py-2 px-4"><%= detalle.getTipoItem() %></td>
		                <td class="py-2 px-4">
		                    <% if ("producto".equals(detalle.getTipoItem())) { %>
		                        <%= detalle.getNombreProducto() %>
		                    <% } else if ("clase".equals(detalle.getTipoItem())) { %>
		                        <%= detalle.getNombreClase() %>
		                    <% } else if ("suscripcion".equals(detalle.getTipoItem())) { %>
		                        <%= detalle.getNombreSuscripcion() %>
		                    <% } %>
		                </td>
		                <td class="py-2 px-4"><%= detalle.getCantidad() %></td>
		                <td class="py-2 px-4"><%= detalle.getPrecioUnitario() != null ? detalle.getPrecioUnitario() : 0.0f %></td>
		                <td class="py-2 px-4"><%= (detalle.getPrecioUnitario() != null ? detalle.getPrecioUnitario() : 0.0f) * detalle.getCantidad() %></td>
		            </tr>
		        <% } %>
		    </tbody>

			    </table>
			</div>


            <!-- Botón Registrar Venta -->
            <div class="text-center mt-8">
                <button type="submit" class="bg-yellow-500 hover:bg-yellow-600 text-black font-bold py-2 px-6 rounded text-lg">
                    Registrar Venta
                </button>
            </div>
        </form>
    </div>
</main>

</body>
</html>