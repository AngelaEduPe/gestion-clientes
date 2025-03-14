<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Venta"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRM - Ventas</title>
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
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Oportunidades</a>
            <a href="/gestion-clientes/ventas" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer border border-white border-solid">Ventas</a>
            <a href="/gestion-clientes/reportes" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Reportes</a>
        </div>
    </header>

    <main class="p-4">
        <h1 class="text-gray-700 font-bold text-2xl text-center">Lista de Ventas</h1>
        <div class="w-full p-4">
            <table class="min-w-full bg-white border border-gray-300">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="py-2 px-4 border-b">Venta ID</th>
                        <th class="py-2 px-4 border-b">Cliente</th>
                        <th class="py-2 px-4 border-b">Oportunidad</th>
                        <th class="py-2 px-4 border-b">Monto</th>
                        <th class="py-2 px-4 border-b">Fecha</th>
                        <th class="py-2 px-4 border-b">Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Venta> ventas = (List<Venta>) request.getAttribute("ventas");
                        if (ventas != null && !ventas.isEmpty()) {
                            for (Venta venta : ventas) {
                    %>
                    <tr>
                        <td class="py-2 px-4 border-b"><%= venta.getIdVenta() %></td>
                        <td class="py-2 px-4 border-b"><%= venta.getCliente().getNombre() %> <%= venta.getCliente().getApellido() %></td>
                        <td class="py-2 px-4 border-b">
                            <% if (venta.getOportunidad() != null) { %>
                                Oportunidad ID: <%= venta.getOportunidad().getIdOportunidad() %>
                            <% } else { %>
                                Sin oportunidad vinculada
                            <% } %>
                        </td>
                        <td class="py-2 px-4 border-b">S/. <%= venta.getMonto() %></td>
                        <td class="py-2 px-4 border-b"><%= venta.getFecha() %></td>
                        <td class="py-2 px-4 border-b"><%= venta.getEstado() %></td>
                    </tr>
                    <% } %>
                    <% } else { %>
                    <tr>
                        <td colspan="6" class="py-2 px-4 text-center">No se encontraron registros</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="text-center mt-4">
            Total registros: <%= ventas != null ? ventas.size() : 0 %>
        </div>
    </main>

</body>
</html>
