<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.Cliente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRM - Sistema de Gestión de Clientes</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
	<header>
		<div
			class="flex gap-4 bg-blue-600 justify-center h-[50px] items-center">
			<a href="/gestion-clientes"
				class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Inicio</a>
			<a href="/gestion-clientes/clientes"
				class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer border border-white border-solid">Clientes</a>
			<a href="/gestion-clientes/interacciones" 
				class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Interacciones</a>
            <a href="/gestion-clientes/oportunidades" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Oportunidades</a>
            <a href="/gestion-clientes/ventas" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Ventas</a>
            <a href="/gestion-clientes/reportes" 
            	class="h-auto text-white hover:bg-blue-700 p-2 rounded-md cursor-pointer">Reportes</a>
		</div>
 	</header>

    <main class="p-4">
        <div class="flex w-full justify-center p-4 gap-4 flex-wrap">
            <%
                List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                if (clientes != null && !clientes.isEmpty()) {
                    for (Cliente cliente : clientes) {
            %>
            <div class="flex bg-gray-200 w-[200px] justify-center flex-col p-4 gap-2 items-center rounded-md border border-gray-300 border-solid hover:border-blue-600 cursor-pointer">
                <p class="text-center font-bold text-gray-600"><%= cliente.getNombre() %> <%= cliente.getApellido() %></p>
                <p class="text-center text-gray-600"><%= cliente.getCorreo() %></p>
                <p class="text-center text-gray-600"><%= cliente.getTelefono() %></p>
                <p class="text-center text-gray-600"><%= cliente.getEmpresa() %></p>
            </div>
            <% } %>
            <% } else { %>
            <p>No se encontraron registros</p>
            <% } %>
        </div>
        <div>
            Total registros:
            <%= clientes != null ? clientes.size() : 0 %>
        </div>

    		</main>


</body>
</html>