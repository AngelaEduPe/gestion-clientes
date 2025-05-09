<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.Cliente"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white">

   <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
    <div class="logo-container p-2 mb-2">
        <img src="https://i.postimg.cc/vTjLxPDs/Logo-Anyra-Powe-Fit.png" alt="Logo" class="w-50 mx-auto"> 
    </div>
    <div class="sidebar flex flex-col bg-black flex-grow">
        <a href="/gestion-clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().endsWith("/gestion-clientes")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" alt="Inicio" class="w-5 mr-2">
            Inicio
        </a>
        <a href="/gestion-clientes/clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/clientes")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/share_2.png" alt="Clientes" class="w-5 mr-2">
            Clientes
        </a>
        <a href="/gestion-clientes/entrenadores" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/entrenadores")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/dumbbell.png" alt="Entrenadores" class="w-5 mr-2">
            Entrenadores
        </a>
        <a href="/gestion-clientes/suscripciones" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/suscripciones")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/contract-job.png" alt="Suscripciones" class="w-5 mr-2">
            Suscripciones
        </a>
        <a href="/gestion-clientes/clases" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/clases")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/bench-press-with-dumbbells.png" alt="Clases" class="w-5 mr-2">
            Clases
        </a>
        <a href="/gestion-clientes/evaluacionesFisicas" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/evaluacionesFisicas")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/win10/200w/FFFFFF/view.png" alt="Evaluaciones Físicas" class="w-5 mr-2">
            Evaluaciones Físicas
        </a>
        <a href="/gestion-clientes/pagos" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/pagos")) { %>text-yellow-400<% } %>">
            <img src="https://previews.123rf.com/images/sabuhinovruzov/sabuhinovruzov1705/sabuhinovruzov170501651/78710089-icono-de-vector-de-d%C3%B3lar-dinero-ilustraci%C3%B3n-de-efectivo-blanco-y-negro-esquema-de-icono-de-banca.jpg" alt="Pagos" class="w-5 mr-2">
            Pagos
        </a>
        <a href="/gestion-clientes/venta" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/categoriasProductos")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/product.png" alt="Venta de Productos" class="w-5 mr-2">
            Venta de Productos
        </a>
        <a href="/gestion-clientes/comentarios" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
            <% if (request.getRequestURI().contains("/comentarios")) { %>text-yellow-400<% } %>">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/communication.png" alt="Comentarios" class="w-5 mr-2">
            Comentarios
        </a>
    </div>
</header>

<!-- Contenido principal -->
		<main class="ml-[260px] p-6 bg-[#1e1e1e] min-h-screen text-white">
    <h1 class="text-yellow-400 font-bold text-2xl text-center mb-6 tracking-wide uppercase">Lista de Clientes</h1>

    <table class="min-w-full bg-[#151515] text-white rounded-lg overflow-hidden">
        <thead class="bg-yellow-500">
            <tr>
                <th class="py-2 px-4 border border-yellow-600">Nombres</th>
                <th class="py-2 px-4 border border-yellow-600">Apellido Materno</th>
                <th class="py-2 px-4 border border-yellow-600">Apellido Paterno</th>
                <th class="py-2 px-4 border border-yellow-600">Fecha de Nacimiento</th>
                <th class="py-2 px-4 border border-yellow-600">Teléfono</th>
                <th class="py-2 px-4 border border-yellow-600">Email</th>
                <th class="py-2 px-4 border border-yellow-600">Fecha de Registro</th>
                <th class="py-2 px-4 border border-yellow-600">ID Suscripción</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

                if (clientes != null && !clientes.isEmpty()) {
                    for (Cliente cliente : clientes) {
                        String fechaNacFormateada = cliente.getFechaNacimiento() != null ? sdf.format(cliente.getFechaNacimiento()) : "";
                        String fechaRegFormateada = cliente.getFechaRegistro() != null ? sdf.format(cliente.getFechaRegistro()) : "";
            %>
            <tr class="hover:bg-gray-800 transition-colors">
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getNombres() %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getApellidoPaterno() %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getApellidoMaterno() %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= fechaNacFormateada %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getTelefono() %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getEmail() %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= fechaRegFormateada %></td>
                <td class="py-2 px-4 border border-yellow-600"><%= cliente.getIdSuscripcion() %></td>
            </tr>
            <% } %>
            <% } else { %>
            <tr>
                <td colspan="8" class="py-4 px-4 text-center text-red-400">No se encontraron clientes.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <% if (clientes != null && !clientes.isEmpty()) { %>
        <div class="w-full p-4 text-gray-300 mt-2">Total de clientes: <%= clientes.size() %></div>
    <% } %>
</main>




</body>
</html>
