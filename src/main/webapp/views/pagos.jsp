<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.Pago"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT - Pagos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
        <!-- Sidebar with links here -->
    </header>

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Pagos</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Pago</th>
                    <th class="py-2 px-4 border border-yellow-600">ID Cliente</th>
                    <th class="py-2 px-4 border border-yellow-600">Monto</th>
                    <th class="py-2 px-4 border border-yellow-600">Fecha Pago</th>
                    <th class="py-2 px-4 border border-yellow-600">Método de Pago</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Obtener los pagos desde el request
                    List<Pago> pagos = (List<Pago>) request.getAttribute("pagos");

                    if (pagos != null && !pagos.isEmpty()) {
                        for (Pago pago : pagos) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= pago.getIdPago() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= pago.getIdCliente() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= pago.getMonto() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= pago.getFechaPago() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= pago.getMetodoPago() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="5" class="py-2 px-4 text-center text-red-400">No se encontraron pagos.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (pagos != null && !pagos.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de pagos: <%= pagos.size() %></div>
        <% } %>
    </main>

</body>
</html>
