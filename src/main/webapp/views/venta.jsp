<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
	<%@ page import="models.Producto, models.Cliente, models.VentaDetalle, models.Clase, models.Suscripcion" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ANYRA POWERFIT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<body class="text-white font-sans bg-black">



<%
		List<Producto> productos = (List<Producto>) request.getAttribute("productos");
		List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
		List<Clase> clases = (List<Clase>) request.getAttribute("clases");
		List<Suscripcion> suscripciones = (List<Suscripcion>) request.getAttribute("suscripciones");
		    
%>

<!-- Sidebar -->
<header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
    <div class="logo-container p-2 mb-2">
        <img src="https://i.postimg.cc/vTjLxPDs/Logo-Anyra-Powe-Fit.png" alt="Logo" class="w-50 mx-auto"> 
    </div>
    <div class="sidebar flex flex-col bg-black flex-grow">
        <a href="/gestion-clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" alt="Inicio" class="w-5 mr-2">
            Inicio
        </a>
        <a href="/gestion-clientes/clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/dumbbell.png" alt="Clientes" class="w-5 mr-2">
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
        <a href="/gestion-clientes/venta" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/product.png" alt="Venta de Productos" class="w-5 mr-2">
            Venta de Productos
        </a>
        <a href="/gestion-clientes/comentarios" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/communication.png" alt="Comentarios" class="w-5 mr-2">
            Comentarios
        </a>
    </div>
</header>

<!-- Main -->
<main class="relative ml-[150px] mt-8 p-8 h-[calc(100vh-2rem)] overflow-auto"> 

    <!-- Fondo oscuro con imágenes -->
    <div class="absolute inset-0 ml-[100px] mt-[-50px] z-0">
        <img src="https://images.unsplash.com/photo-1623874514711-0f321325f318?q=80&w=2070&auto=format&fit=crop" class="w-full h-full object-cover brightness-50 rounded-0xl" />
    </div>
    <div class="absolute inset-0 ml-[100px] mt-[-50px] z-0">
        <img src="https://tablered.mx.arauco.com/wp-content/uploads/2020/04/Negro.jpg" class="w-full h-full object-cover opacity-30 rounded-0xl" />
    </div>

    <!-- Contenido principal -->
    <div class="relative z-20 bg-black bg-opacity-70 p-8 rounded-2xl shadow-lg text-white max-w-4xl mx-auto mt-8">
        
        <!-- Botón carrito de ventas -->
        <div class="flex justify-end mb-6">
            <a href="/gestion-clientes/registroventa" class="bg-yellow-500 hover:bg-yellow-600 text-black font-semibold py-2 px-4 rounded shadow">
                🛒 Carrito de Ventas
            </a>
        </div>
        
        <h1 class="text-4xl font-bold text-yellow-500 mb-6 text-center" style="font-family: 'Bebas Neue', sans-serif;">
            Agregar Servicios y Productos
        </h1>
     
        

        <!-- Productos -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold mb-2">Productos disponibles</h2>
            <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
			    <% for (Producto p : productos) { %>
			        <div class="border p-3 rounded shadow bg-gray-900 text-gray-100">
			            <p class="font-semibold text-yellow-400 text-lg"><%= p.getNombre() %></p>
			            <p class="text-sm text-gray-300 italic mt-1"><%= p.getDescripcion() %></p>
			            <p class="text-sm text-green-400 mt-2 font-medium">S/. <%= p.getPrecio() %></p>
			            <div class="flex items-center mt-3 space-x-2">
                            <input id="producto-<%=p.getIdProducto()%>" type="number" value="1" min="1" class="w-12 text-center bg-black border border-gray-600 rounded" />
                        </div>
			            <button type="button"
						        onclick="agregarCarrito(<%= p.getIdProducto() %>, 'producto')"
						        class="mt-3 bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded transition">
						    Agregar
						</button>

			        </div>
			    <% } %>
			</div>

        </div>

        <!-- Clases -->
        <div class="mb-6">
	    <h2 class="text-lg font-semibold mb-2 text-white">Clases disponibles</h2>
	    <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
	        <% for (Clase c : clases) { %>
	            <div class="border p-3 rounded shadow bg-gray-800 text-white">
	                <p class="font-medium text-yellow-400"><%= c.getNombre() %></p>
	                <p class="text-sm text-gray-300">Fecha: <%= c.getFecha() %> - Hora: <%= c.getHora() %></p>
	                <p class="text-sm text-green-400 italic">Incluido en tu plan</p>
	                <button type="button" 
	                        onclick="agregarCarrito(<%= c.getIdClase() %>, 'clase')" 
	                        class="mt-2 bg-green-500 text-white px-2 py-1 rounded">
	                    Agregar
	                </button>
	            </div>
	        <% } %>
	    </div>
	</div>


        <!-- Suscripciones -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold mb-2">Suscripciones disponibles</h2>
            <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                <% for (Suscripcion s : suscripciones) { %>
                    <div class="border p-3 rounded shadow bg-gray-900 text-gray-100">
					    <p class="font-semibold text-yellow-400 text-lg"><%= s.getTipo() %></p>
					    <p class="text-sm text-gray-300 italic mt-1"><%= s.getBeneficios() %></p>
					    <p class="text-sm text-green-400 mt-2 font-medium">S/. <%= s.getPrecio() %></p>
					    <div class="flex items-center mt-3 space-x-2">
                            <input id="suscripcion-<%=s.getIdSuscripcion()%>" type="number" value="1" min="1" class="w-12 text-center bg-black border border-gray-600 rounded" />
                        </div>
					    
					    <button type="button"
					            onclick="agregarCarrito(<%= s.getIdSuscripcion() %>, 'suscripcion')"
					            class="mt-3 bg-purple-500 hover:bg-purple-600 text-white px-3 py-1 rounded transition">
					        Agregar
					    </button>
					</div>


                <% } %>
            </div>
        </div>
        


        

<!-- Script para manejar el carrito -->

<script>
	
	async function registrarVenta(idItem){
		console.log('registrarVenta', idItem);
	
		fetch('/gestion-clientes/venta?idItem='+idItem, {
			method: 'POST'
		});
	}

</script>


</div>
</main>
</body>
</html>