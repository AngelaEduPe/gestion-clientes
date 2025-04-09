<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.Comentario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT - Comentarios</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
        <div class="logo-container p-2 mb-2">
            <img src="https://cdn.pixabay.com/photo/2025/04/08/05/54/05-54-53-172_1280.png" alt="Logo" class="w-50 mx-auto"> 
        </div>
        <div class="sidebar flex flex-col bg-black flex-grow">
            <a href="index.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 border-b-2 border-yellow-400 flex items-center">
                <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" alt="Inicio" class="w-5 mr-2">
                Inicio
            </a>
            <a href="clientes.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/share_2.png" alt="Clientes" class="w-5 mr-2">
                Clientes
            </a>
            <a href="entrenadores.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/dumbbell.png" alt="Entrenadores" class="w-5 mr-2">
                Entrenadores
            </a>
            <a href="suscripciones.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/contract-job.png" alt="Suscripciones" class="w-5 mr-2">
                Suscripciones
            </a>
            <a href="clases.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/bench-press-with-dumbbells.png" alt="Clases" class="w-5 mr-2">
                Clases
            </a>
            <a href="evaluacionesFisicas.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/win10/200w/FFFFFF/view.png" alt="Evaluaciones Físicas" class="w-5 mr-2">
                Evaluaciones Físicas
            </a>
            <a href="pagos.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://previews.123rf.com/images/sabuhinovruzov/sabuhinovruzov1705/sabuhinovruzov170501651/78710089-icono-de-vector-de-d%C3%B3lar-dinero-ilustraci%C3%B3n-de-efectivo-blanco-y-negro-esquema-de-icono-de-banca.jpg" alt="Pagos" class="w-5 mr-2">
                Pagos
            </a>
            <a href="categoriasProductos.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/product.png" alt="Venta de Productos" class="w-5 mr-2">
                Venta de Productos
            </a>
            <a href="comentarios.jsp" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
                <img src="https://img.icons8.com/ios7/600w/FFFFFF/communication.png" alt="Comentarios" class="w-5 mr-2">
                Comentarios
            </a>
        </div>
    </header>

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-600 font-bold text-2xl text-center mb-4">LISTA DE COMENTARIOS</h1>

        <table class="min-w-full bg-gray-900 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-500">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">Comentario</th>
                    <th class="py-2 px-4 border border-yellow-600">Fecha</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Obtener los comentarios desde el request
                    List<Comentario> comentarios = (List<Comentario>) request.getAttribute("comentarios");

                    if (comentarios != null && !comentarios.isEmpty()) {
                        for (Comentario comentario : comentarios) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= comentario.getComentario() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= comentario.getFecha() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="4" class="py-2 px-4 text-center text-red-400">No se encontraron comentarios.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (comentarios != null && !comentarios.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de comentarios: <%= comentarios.size() %></div>
        <% } %>
    </main>

</body>
</html>
