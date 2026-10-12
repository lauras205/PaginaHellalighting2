<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs = (ResultSet) request.getAttribute("detalles");
    String idPedido = (String) request.getAttribute("id_pedido");
    Boolean vacio = (Boolean) request.getAttribute("vacio");
%>
<!DOCTYPE html>
<html><head><title>Mi Carrito - Hella Lighting</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .blue.darken-4{ background-color:#0D47A1 !important; color:white !important; }
    .btn-blue{ background-color:#0D47A1; color:white; border:none; }
    .btn-blue:hover{ background-color:#08306e; color:white; }
    .header-carrito{ background-color:#0D47A1; color:white; padding:15px; border-radius:8px; margin-bottom:20px; }
    .table thead{ background-color:#0D47A1; color:white; }
</style>
</head><body class="bg-light">
<div class="container mt-4">
<div class="header-carrito">
<h2 class="m-0">🛒 Mi Carrito</h2>
</div>

<% if(vacio!=null && vacio){ %>
<div class="alert alert-warning">Tu carrito está vacío. <a href="Catalogo.jsp">Ir al catálogo</a></div>
<% } else { 
    float total=0;
%>
<table class="table table-striped bg-white shadow-sm">
<thead>
<tr><th>Producto</th><th>Cantidad</th><th>Subtotal</th><th>Acción</th></tr>
</thead>
<tbody>
<% while(rs!=null && rs.next()){ total+=rs.getFloat("subtotal"); %>
<tr>
<td><%= rs.getString("nombre") %> (ID: <%= rs.getString("id_producto") %>)</td>
<td><%= rs.getInt("cantidad") %></td>
<td>$ <%= rs.getFloat("subtotal") %></td>
<td><a href="EliminarDelCarrito?id_detalle=<%= rs.getString("id_detalle") %>" class="btn btn-sm btn-danger">Quitar</a></td>
</tr>
<% } %>
<tr style="background:#E3F2FD; font-weight:bold;"><td colspan="2">Total</td><td colspan="2">$ <%= total %></td></tr>
</tbody>
</table>
<form action="FinalizarCompra" method="post" class="d-inline">
<input type="hidden" name="id_pedido" value="<%= idPedido %>">
<button class="btn btn-blue btn-lg">Finalizar Compra</button>
</form>
<a href="PanelCliente.jsp" class="btn btn-secondary btn-lg ms-2">Seguir comprando</a>
<% } %>
</div></body></html>