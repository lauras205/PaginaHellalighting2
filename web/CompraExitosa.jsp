<%-- 
    Document   : CompraExitosa
    Created on : 10 oct 2026, 9:36:24 p.m.
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><title>Compra Finalizada</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>.blue.darken-4{ background-color:#0D47A1 !important; color:white; }</style>
</head><body class="bg-light">
<div class="container mt-5 text-center">
<div class="card shadow p-4">
<h2 class="blue darken-4 p-3 rounded">✅ ¡Compra Finalizada!</h2>
<p>Tu pedido <b><%= request.getAttribute("id_pedido") %></b> fue registrado correctamente.</p>
<p>Estado: <b>finalizado</b></p>
<a href="PanelCliente.jsp" class="btn" style="background:#0D47A1;color:white;">Volver al catálogo</a>
<a href="VerCarrito" class="btn btn-secondary">Ver pedidos</a>
</div>
</div>
</body></html>
