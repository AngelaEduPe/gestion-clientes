<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Suscripcion"%>
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
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Suscripciones</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Suscripción</th>
                    <th class="py-2 px-4 border border-yellow-600">Tipo</th>
                    <th class="py-2 px-4 border border-yellow-600">Precio</th>
                    <th class="py-2 px-4 border border-yellow-600">Duración (Meses)</th>
                    <th class="py-2 px-4 border border-yellow-600">Beneficios</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Suscripcion> suscripciones = (List<Suscripcion>) request.getAttribute("suscripciones");

                    if (suscripciones != null && !suscripciones.isEmpty()) {
                        for (Suscripcion suscripcion : suscripciones) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= suscripcion.getIdSuscripcion() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= suscripcion.getTipo() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= suscripcion.getPrecio() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= suscripcion.getDuracionMeses() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= suscripcion.getBeneficios() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="5" class="py-2 px-4 text-center text-red-400">No se encontraron suscripciones.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (suscripciones != null && !suscripciones.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de suscripciones: <%= suscripciones.size() %></div>
        <% } %>
    </main>
</body>
</html>
