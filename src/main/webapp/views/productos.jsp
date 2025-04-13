<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.Cliente"%>
<%@ page import="models.Producto" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

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
        <a href="/gestion-clientes/categoriasProductos" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center 
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
    <main class="p-4 ml-[250px]">
    <div class="flex w-full justify-center p-4 gap-4 flex-wrap">
        <% 
	        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
	        if (productos != null && !productos.isEmpty()) {
	            for (Producto prod : productos) {
        %>
            <div class="flex bg-gray-800 w-[200px] justify-center flex-col p-4 gap-2 items-center rounded-md border border-gray-600 border-solid hover:border-yellow-600 cursor-pointer">
                <img class="rounded-sm" src="<%= prod.getImagenUrl() %>" width="150px">
                <span class="text-center font-bold text-yellow-400"><%= prod.getNombre() %></span>
                <span class="text-white">S/. <%= prod.getPrecio() %></span>
            </div>
        <% 
                }
            } else {
        %>
            <p class="text-yellow-400">No se encontraron productos para esta categoría</p>
        <% } %>
    </div>
</main>


</body>
</html>
