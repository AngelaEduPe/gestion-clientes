<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List"%>
<%@ page import="models.EvaluacionFisica"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ANYRA POWERFIT - Evaluaciones Físicas</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

    <header class="flex flex-col bg-black w-[250px] h-screen p-4 fixed top-0 left-0">
        <!-- Sidebar with links here -->
    </header>

    <!-- Contenido principal -->
    <main class="ml-[260px] p-4">
        <h1 class="text-gray-100 font-bold text-2xl text-center mb-4">Lista de Evaluaciones Físicas</h1>

        <table class="min-w-full bg-gray-800 text-white rounded-lg overflow-hidden">
            <thead class="bg-yellow-700">
                <tr>
                    <th class="py-2 px-4 border border-yellow-600">ID Evaluación</th>
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
                    <td class="py-2 px-4 border border-yellow-600"><%= evaluacion.getIdEvaluacionFisica() %></td>
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
