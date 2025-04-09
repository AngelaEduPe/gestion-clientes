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
        <!-- Sidebar with links here -->
    </header>

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Comentarios</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Comentario</th>
                    <th class="py-2 px-4 border border-yellow-600">ID Cliente</th>
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
                    <td class="py-2 px-4 border border-yellow-600"><%= comentario.getIdComentario() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= comentario.getIdCliente() %></td>
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
