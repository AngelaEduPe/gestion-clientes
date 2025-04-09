<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Clase"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
        <!-- Sidebar content (same as before) -->
    </header>

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Clases</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Clase</th>
                    <th class="py-2 px-4 border border-yellow-600">Nombre</th>
                    <th class="py-2 px-4 border border-yellow-600">Fecha</th>
                    <th class="py-2 px-4 border border-yellow-600">Hora</th>
                    <th class="py-2 px-4 border border-yellow-600">Entrenador</th>
                    <th class="py-2 px-4 border border-yellow-600">Capacidad</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Clase> clases = (List<Clase>) request.getAttribute("clases");

                    if (clases != null && !clases.isEmpty()) {
                        for (Clase clase : clases) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getIdClase() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getNombre() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getFecha() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getHora() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getEntrenadorNombre() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= clase.getCapacidad() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="6" class="py-2 px-4 text-center text-red-400">No se encontraron clases.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (clases != null && !clases.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de clases: <%= clases.size() %></div>
        <% } %>
    </main>
</body>
</html>
