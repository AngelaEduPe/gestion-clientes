<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Oportunidad"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRM - Gestión de Oportunidades</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>

    <header>
        <div class="flex gap-4 bg-blue-600 justify-center h-[50px] items-center">
            <a href="/gestion-clientes"
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Inicio</a>
            <a href="/gestion-clientes/clientes"
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Clientes</a>
            <a href="/gestion-clientes/interacciones" 
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Interacciones</a>
            <a href="/gestion-clientes/oportunidades" 
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer border border-white border-solid">Oportunidades</a>
            <a href="/gestion-clientes/ventas" 
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Ventas</a>
            <a href="/gestion-clientes/reportes" 
                class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Reportes</a>
        </div>
    </header>

    <main class="p-4">
        <h1 class="text-gray-700 font-bold text-2xl text-center">Lista de Oportunidades</h1>
        <div class="w-full p-4">
            <table class="min-w-full bg-white border border-gray-300">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="py-2 px-4 border-b">Oportunidad ID</th>
                        <th class="py-2 px-4 border-b">Cliente</th>
                        <th class="py-2 px-4 border-b">Estado</th>
                        <th class="py-2 px-4 border-b">Monto Estimado</th>
                        <th class="py-2 px-4 border-b">Fecha de Cierre</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Oportunidad> oportunidades = (List<Oportunidad>) request.getAttribute("oportunidades");
                        if (oportunidades != null && !oportunidades.isEmpty()) {
                            for (Oportunidad oportunidad : oportunidades) {
                    %>
                    <tr>
                        <td class="py-2 px-4 border-b"><%= oportunidad.getIdOportunidad() %></td>
                        <td class="py-2 px-4 border-b"><%= oportunidad.getCliente().getNombre() %> <%= oportunidad.getCliente().getApellido() %></td>
                        <td class="py-2 px-4 border-b"><%= oportunidad.getEstado() %></td>
                        <td class="py-2 px-4 border-b">S/. <%= oportunidad.getMontoEstimado() %></td>
                        <td class="py-2 px-4 border-b"><%= oportunidad.getFechaCierre() %></td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <tr>
                        <td colspan="5" class="py-2 px-4 text-center">No se encontraron registros</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="text-center mt-4">
            Total registros: <%= oportunidades != null ? oportunidades.size() : 0 %>
        </div>
    </main>

</body>
</html>
