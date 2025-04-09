<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Entrenador"%>
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
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Entrenadores</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Entrenador</th>
                    <th class="py-2 px-4 border border-yellow-600">Nombre</th>
                    <th class="py-2 px-4 border border-yellow-600">Apellido</th>
                    <th class="py-2 px-4 border border-yellow-600">Especialidad</th>
                    <th class="py-2 px-4 border border-yellow-600">Teléfono</th>
                    <th class="py-2 px-4 border border-yellow-600">Email</th>
                    <th class="py-2 px-4 border border-yellow-600">Fecha de Contratación</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Entrenador> entrenadores = (List<Entrenador>) request.getAttribute("entrenadores");

                    if (entrenadores != null && !entrenadores.isEmpty()) {
                        for (Entrenador entrenador : entrenadores) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getIdEntrenador() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getNombre() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getApellido() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getEspecialidad() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getTelefono() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getEmail() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= entrenador.getFechaContratacion() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="7" class="py-2 px-4 text-center text-red-400">No se encontraron entrenadores.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (entrenadores != null && !entrenadores.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de entrenadores: <%= entrenadores.size() %></div>
        <% } %>
    </main>
</body>
</html>
