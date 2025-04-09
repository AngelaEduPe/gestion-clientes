<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.EvaluacionFisica"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT - Evaluaciones Fisicas</title>
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

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-600 font-bold text-2xl text-center mb-4">LISTA DE EVALUACIONEES FISICAS</h1>

        <table class="min-w-full bg-gray-900 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-500">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Cliente</th>
                    <th class="py-2 px-4 border border-yellow-600">Peso</th>
                    <th class="py-2 px-4 border border-yellow-600">Altura</th>
                    <th class="py-2 px-4 border border-yellow-600">Grasa Corporal</th>
                    <th class="py-2 px-4 border border-yellow-600">Masa Muscular</th>
                    <th class="py-2 px-4 border border-yellow-600">Fecha Evaluación</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Obtener las evaluaciones desde el request
                    List<EvaluacionFisica> evaluaciones = (List<EvaluacionFisica>) request.getAttribute("evaluaciones");

                    if (evaluaciones != null && !evaluaciones.isEmpty()) {
                        for (EvaluacionFisica evaluacion : evaluaciones) {
                %>
                <tr class="hover:bg-gray-700">
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getIdCliente() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getPeso() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getAltura() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getGrasaCorporal() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getMasaMuscular() %></td>
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getFechaEvaluacion() %></td>
                </tr>
                <% } %>
                <% } else { %>
                <tr>
                    <td colspan="7" class="py-2 px-4 text-center text-red-400">No se encontraron evaluaciones.</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% if (evaluaciones != null && !evaluaciones.isEmpty()) { %>
            <div class="w-full p-4 text-white">Total de evaluaciones: <%= evaluaciones.size() %></div>
        <% } %>
    </main>

</body>
</html>
