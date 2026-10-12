<%-- 
    Document   : PanelCliente
    Created on : 9 oct 2026, 2:59:55 a.m.
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.ProductoVO" %>
<%
HttpSession sesion = request.getSession(false);
    if (sesion == null || sesion.getAttribute("nombre") == null) {
        response.sendRedirect("InicioSesion.jsp");
        return;
    }
    String usuario = (String) sesion.getAttribute("nombre");
    List<ProductoVO> productos = (List<ProductoVO>) request.getAttribute("productos");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HellaLighting - Panel Cliente</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css">
    <link rel="icon" type="image/png" href="imagenes/logo hellalighting.png">
    <style>
      .card-hella{ border-radius:15px; overflow:hidden; border: 1px solid #d8cb1c; background:#181818; height: 460px; display:flex; flex-direction:column; }
      .card-hella .card-image{ height:220px; overflow:hidden; display:flex; align-items:center; justify-content:center; background:#222; }
      .card-hella .card-image img{ object-fit:contain; width:100%; height:100%; }
      .card-hella .card-title{ color:#d8cb1c !important; font-weight:bold; font-size:18px !important; line-height:22px !important; }
      .badge-hella{ background:#d8cb1c; color:black; padding:4px 10px; border-radius:20px; font-size:11px; font-weight:bold; position:absolute; top:10px; left:10px; z-index:2; }
      .btn-hella{ background:#d8cb1c !important; color:black !important; border-radius:30px; font-weight:bold; width:100%; }
      .precio-hella{ color:#FFED00; font-size:20px; font-weight:bold; }
      .card-content{ flex-grow:1; }
    </style>
</head>
<body style="background:white">
    <nav class="indigo darken-4"> 
      <div class="nav-wrapper container">
        <a href="index.jsp" class="brand-logo"><img src="imagenes/hellalighting_white_transparent.png" alt="logo" style="width: 80px; margin-top:5px;"></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li><a>Hola, <%= usuario %></a></li>
          <li><a href="ListarProducto">Productos</a></li>
          <li><a href="index.jsp">Inicio</a></li>
          <li><a href="CerrarSesion"><i class="material-icons">person_outline</i></a></li>
          <li><a href="#"><i class="material-icons">add_shopping_cart</i></a></li>
        </ul>
      </div>
    </nav>

<div class="container" style="margin-top:30px;">
    <h5 class="indigo-text text-darken-4">Nuestros Productos Hella</h5>
  <div class="row">
    <% if (productos != null) {
         for (ProductoVO p : productos) { %>
      <div class="col s12 m6 l4">
        <div class="card card-hella hoverable">
          <div class="card-image">
            <span class="badge-hella"><%= p.getCategoria() %></span>
            <img src="imagenes/<%= p.getImagen() %>">
          </div>
          <div class="card-content white-text">
            <span class="card-title"><%= p.getNombre() %></span>
            <p style="color:#aaa; font-size:13px;"><%= p.getDescripcion() %></p>
            <p class="precio-hella" style="margin-top:10px;">$<%= p.getPrecio() %> COP</p>
          </div>
          <div class="card-action" style="border-top:1px solid #333;">
           <form action="AgregarCarrito" method="POST">
  <input type="hidden" name="id_producto" value="<%= p.getId() %>">
  <input type="hidden" name="precio" value="<%= p.getPrecio() %>">
  <button class="btn yellow darken-2 black-text" type="submit">
    <i class="material-icons left">shopping_cart</i> AGREGAR AL CARRITO
  </button>
</form>
          </div>
        </div>
      </div>
    <% } } else { %>
      <p class="white-text">No hay productos registrados en la BD.</p>
    <% } %>
  </div>
</div>

<footer class="page-footer indigo darken-4" style="margin-top:100px;">
  <div class="container">
    <div class="row">
      <div class="col l6 s12">
        <h5 class="white-text"><i class="small material-icons">flash_on</i>HELLALIGHTING </h5>
        <p class="grey-text text-lighten-4">Iluminación LED profesional para tu vehículo. Calidad y confianza en cada ruta.</p>
      </div>
      <div class="col l4 offset-l2 s12">
        <h5 class="white-text">Encuentranos en:</h5>
        <ul>
          <li><img src="imagenes/logo tiktok.png" width="20px"> <a class="grey-text text-lighten-3" href="https://www.tiktok.com/@hellalighting" target="_blank">TikTok</a></li>
          <li><img src="imagenes/logo facebook.png" width="20px"> <a class="grey-text text-lighten-3" href="https://www.facebook.com/profile.php?id=61574858726534" target="_blank">Facebook</a></li>
          <li><img src="imagenes/logo whatsapp.png" width="20px"> <a class="grey-text text-lighten-3" href="https://wa.me/573232500572" target="_blank">Whatsapp</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="footer-copyright">
    <div class="container">© 2026 Copyright Text</div>
  </div>
</footer>
<script src="js/materialize.min.js"></script>
</body>
</html>
