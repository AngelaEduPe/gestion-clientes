<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.CategoriaProducto" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
    <div class="logo-container p-2 mb-2">
        <img src="https://cdn.pixabay.com/photo/2025/04/08/05/54/05-54-53-172_1280.png" alt="Logo" class="w-50 mx-auto"> 
    </div>
    <div class="sidebar flex flex-col bg-black flex-grow">
        <a href="/gestion-clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" alt="Inicio" class="w-5 mr-2">
            Inicio
        </a>
        <a href="/gestion-clientes/clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/share_2.png" alt="Clientes" class="w-5 mr-2">
            Clientes
        </a>
        <a href="/gestion-clientes/entrenadores" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/dumbbell.png" alt="Entrenadores" class="w-5 mr-2">
            Entrenadores
        </a>
        <a href="/gestion-clientes/suscripciones" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/contract-job.png" alt="Suscripciones" class="w-5 mr-2">
            Suscripciones
        </a>
        <a href="/gestion-clientes/clases" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/bench-press-with-dumbbells.png" alt="Clases" class="w-5 mr-2">
            Clases
        </a>
        <a href="/gestion-clientes/evaluacionesFisicas" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/win10/200w/FFFFFF/view.png" alt="Evaluaciones Físicas" class="w-5 mr-2">
            Evaluaciones Físicas
        </a>
        <a href="/gestion-clientes/pagos" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://previews.123rf.com/images/sabuhinovruzov/sabuhinovruzov1705/sabuhinovruzov170501651/78710089-icono-de-vector-de-d%C3%B3lar-dinero-ilustraci%C3%B3n-de-efectivo-blanco-y-negro-esquema-de-icono-de-banca.jpg" alt="Pagos" class="w-5 mr-2">
            Pagos
        </a>
        <a href="/gestion-clientes/productos" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/product.png" alt="Venta de Productos" class="w-5 mr-2">
            Venta de Productos
        </a>
        <a href="/gestion-clientes/comentarios" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/communication.png" alt="Comentarios" class="w-5 mr-2">
            Comentarios
        </a>
    </div>
</header>

			<main class="p-4">
				<div class="flex w-full justify-center p-4 gap-4 flex-wrap">
					<% 
						List<CategoriaProducto> categorias = 
							(List<CategoriaProducto>) request.getAttribute("categoriasProductos");
			
						if (categorias != null && !categorias.isEmpty()) { 
							for(CategoriaProducto categoria: categorias) { 
					%>
						<a href="/galactus-store/subcategorias?idCategoria=<%= categoria.getIdCategoria() %>" class="flex bg-gray-200 w-[200px] justify-center flex-col p-4 gap-2 items-center rounded-md border border-gray-300 border-solid hover:border-green-600 cursor-pointer">
							<img class="rounded-sm" src="<%= categoria.getImagenUrl() %>" width="150px">
							<span class="text-center font-bold text-gray-600"><%= categoria.getNombreCategoria() %></span>
						</a>
					<% 
							} 
						} else { 
					%>
						<p>No se encontraron registros</p>
					<% } %>
				</div>
				
				<% if (categorias != null && !categorias.isEmpty()) { %>
					<div class="w-full p-4">Total registros: <%= categorias.size() %></div>
				<% } %>
			</main>



</body>
</html>
