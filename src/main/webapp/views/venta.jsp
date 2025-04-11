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

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Inter', sans-serif;
    }
</style>


<%
		List<Producto> productos = (List<Producto>) request.getAttribute("productos");
		List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
		List<Clase> clases = (List<Clase>) request.getAttribute("clases");
		List<Suscripcion> suscripciones = (List<Suscripcion>) request.getAttribute("suscripciones");
		    
%>

<!-- Sidebar -->
<header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
    <div class="logo-container p-2 mb-2">
        <img src="https://cdn.pixabay.com/photo/2025/04/08/05/54/05-54-53-172_1280.png" alt="Logo" class="w-50 mx-auto"> 
    </div>
    <div class="sidebar flex flex-col bg-black flex-grow">
        <!-- (Tus enlaces están intactos) -->
        <!-- ... enlaces del sidebar aquí ... -->
        <a href="/gestion-clientes" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600/FFFFFF/home.png" alt="Inicio" class="w-5 mr-2">
            Inicio
        </a>
        <!-- ... otros enlaces ... -->
        <a href="/venta" class="text-white hover:text-yellow-400 p-2 pl-4 flex items-center">
            <img src="https://img.icons8.com/ios7/600w/FFFFFF/cash-register.png" alt="Ventas" class="w-5 mr-2">
            Ventas
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
        <h1 class="text-4xl font-bold text-yellow-500 mb-6 text-center" style="font-family: 'Bebas Neue', sans-serif;">
            Registrar Nueva Venta
        </h1>

        <form action="venta" method="post" class="space-y-6">
            <!-- Cliente -->
        <div class="mb-4">
            <label for="clienteId" class="block font-medium">Seleccionar Cliente:</label>
            <select name="clienteId" id="clienteId" class="w-full p-2 border rounded bg-gray-800 text-white" required>
			    <option value="">-- Seleccione un cliente --</option>
			    <% for (Cliente c : clientes) { %>
			        <option value="<%= c.getIdCliente() %>"><%= c.getNombres() %> <%= c.getApellidoPaterno() %> <%= c.getApellidoMaterno() %></option>
			    <% } %>
			</select>

        </div>

        <!-- Método de pago -->
        <div class="mb-4">
            <label for="metodoPago" class="block font-medium">Método de Pago:</label>
            <select name="metodoPago" id="metodoPago" class="w-full p-2 border rounded bg-gray-800 text-white" required>
                <option value="">-- Seleccione un método --</option>
                <option value="EFECTIVO">Efectivo</option>
                <option value="TARJETA">Tarjeta</option>
                <option value="TRANSFERENCIA">Transferencia</option>
            </select>
        </div>

        <!-- Productos -->
        <div class="mb-6">
            <h2 class="text-lg font-semibold mb-2">Productos disponibles</h2>
            <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
			    <% for (Producto p : productos) { %>
			        <div class="border p-3 rounded shadow bg-gray-900 text-gray-100">
			            <p class="font-semibold text-yellow-400 text-lg"><%= p.getNombre() %></p>
			            <p class="text-sm text-gray-300 italic mt-1"><%= p.getDescripcion() %></p>
			            <p class="text-sm text-green-400 mt-2 font-medium">S/. <%= p.getPrecio() %></p>
			            <button type="button"
						        onclick="console.log('Botón de agregar presionado'); agregarAlCarrito('producto', <%= p.getIdProducto() %>, '<%= p.getNombre() %>', <%= p.getPrecio() %>)"
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
	                        onclick="agregarAlCarrito('clase', <%= c.getIdClase() %>, '<%= c.getNombre() %>', 0)" 
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
					    <button type="button"
					            onclick="agregarAlCarrito('suscripcion', <%= s.getIdSuscripcion() %>, '<%= s.getTipo() %>', <%= s.getPrecio() %>)"
					            class="mt-3 bg-purple-500 hover:bg-purple-600 text-white px-3 py-1 rounded transition">
					        Agregar
					    </button>
					</div>


                <% } %>
            </div>
        </div>

        <!-- Carrito -->
        <div class="mb-4">
            <h2 class="text-xl font-semibold mb-2">Carrito</h2>
            <table class="w-full border bg-gray-800 text-white rounded shadow">
                <thead class="bg-gray-700 text-white">
                    <tr>
                        <th class="p-2">Tipo</th>
                        <th class="p-2">Nombre</th>
                        <th class="p-2">Precio</th>
                        <th class="p-2">Acción</th>
                    </tr>
                </thead>
                <tbody id="carritoBody">
                    <!-- JS llenará los items -->
                </tbody>
            </table>
        </div>

        <!-- Monto total -->
        <div class="mb-4 text-right text-lg font-medium">
            Total: S/. <span id="montoTotal">0.00</span>
            <input type="hidden" name="montoTotal" id="inputMontoTotal">
            <input type="hidden" name="itemsJson" id="itemsJson">
        </div>

        <!-- Botón de enviar -->
        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded">Registrar Venta</button>
    </form>

</div>

<!-- Script para manejar el carrito -->
<script>
    let carrito = [];

    function agregarAlCarrito(tipo, id, nombre, precio) {
        console.log("Producto agregado:", tipo, nombre, precio);  // Verifica los datos
        carrito.push({ tipo, id, nombre, precio });
        renderCarrito();
    }


    function eliminarItem(index) {
        carrito.splice(index, 1);
        renderCarrito();
    }

    function renderCarrito() {
        const tbody = document.getElementById("carritoBody");
        tbody.innerHTML = "";
        let total = 0;

        carrito.forEach((item, i) => {
            total += item.precio;
            tbody.innerHTML += `
                <tr class="border-t">
                    <td class="p-2 text-white">${item.tipo}</td>
                    <td class="p-2 text-white">${item.nombre}</td>
                    <td class="p-2 text-white">S/. ${item.precio.toFixed(2)}</td>
                    <td class="p-2">
                        <button onclick="eliminarItem(${i})" class="text-red-500">Eliminar</button>
                    </td>
                </tr>`;
        });

        document.getElementById("montoTotal").innerText = total.toFixed(2);
        document.getElementById("inputMontoTotal").value = total.toFixed(2);
    }



    function prepararVenta() {
        if (carrito.length === 0) {
            alert("Debe agregar al menos un ítem al carrito.");
            return false;
        }

        document.getElementById("itemsJson").value = JSON.stringify(carrito);
        return true;
    }
</script>

</body>
</html>