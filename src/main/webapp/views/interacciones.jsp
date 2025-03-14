<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Interaccion"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRM - Gestión de Interacciones</title>
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
				class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer border border-white border-solid"">Interacciones</a>
            <a href="/gestion-clientes/oportunidades" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Oportunidades</a>
            <a href="/gestion-clientes/ventas" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Ventas</a>
            <a href="/gestion-clientes/reportes" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Reportes</a>
    </header>

    <main class="p-4">
        <h1 class="text-gray-700 font-bold text-2xl text-center">Lista de Interacciones</h1>
        <div class="w-full p-4">
            <table class="min-w-full bg-white border border-gray-300">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="py-2 px-4 border-b">Cliente ID</th>
                        <th class="py-2 px-4 border-b">Tipo</th>
                        <th class="py-2 px-4 border-b">Detalle</th>
                        <th class="py-2 px-4 border-b">Fecha</th>
                    </tr>
                </thead>
                <tbody>
				    <%
				        List<Interaccion> interacciones = (List<Interaccion>) request.getAttribute("interacciones");
				        if (interacciones != null && !interacciones.isEmpty()) {
				            for (Interaccion interaccion : interacciones) {
				    %>
				    <tr>
				        <td class="py-2 px-4 border-b"><%= interaccion.getCliente().getIdCliente() %></td>
				        <td class="py-2 px-4 border-b"><%= interaccion.getTipo() %></td>
				        <td class="py-2 px-4 border-b"><%= interaccion.getDetalle() %></td>
				        <td class="py-2 px-4 border-b"><%= interaccion.getFecha() %></td>
				    </tr>
				    <% } %>
				    <% } else { %>
				    <tr>
				        <td colspan="4" class="py-2 px-4 text-center">No se encontraron registros</td>
				    </tr>
				    <% } %>
				</tbody>

            </table>
        </div>
        <div class="text-center mt-4">
            Total registros: <%= interacciones != null ? interacciones.size() : 0 %>
        </div>
    </main>

</body>
</html>
