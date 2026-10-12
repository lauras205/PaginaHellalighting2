<%-- 
    Document   : index
    Created on : 9 oct 2026, 1:21:23 a.m.
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>hellalighting</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="css/materialize.min.css">
  <link rel="icon" type="image/png" href="imagenes/logo hellalighting.png">
</head>

<body>
  <nav class="indigo darken-4">
    <div class="nav-wrapper container">
      <a href="#" class="brand-logo"><img src="imagenes/hellalighting_white_transparent.png" alt="logo" style="width: 80px;"></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="index.jsp">Inicio</a></li>
        <%-- ESTOS DOS SON LOS QUE TE PIDEN EN LA EVIDENCIA --%>
        <li><a href="ListarProducto">Productos</a></li> <%-- Llama al servlet que lista --%>
        <li><a href="collapsible.html">Categorías</a></li>
        <li><a href="collapsible.html">Nosotros</a></li>
        <li><a href="https://wa.me/573232500572">Contacto</a></li>
        <li><a href="collapsible.html"><i class="material-icons">search</i></a></li>
        <li><a href="collapsible.html"><i class="material-icons">add_shopping_cart</i><h6>Add carro</h6></a></li>
        <%-- CORREGIDO: antes era "Inicio sesión.html" con espacio, ahora sin espacio y .jsp --%>
        <li><a href="InicioSesion.jsp"><i class="material-icons">person_outline</i><h6>Iniciar sesión</h6></a></li>
      </ul>
    </div>
  </nav>

  <div style=" text-align: left; max-width: 600px; padding: 40px 0 0 60px;" class="responsive">
    <div class="container">
      <h1 class="indigo-text text-darken-4">ILUMINA TU RUTA</h1>
      <p>Luces LED de alta potencia para tu vehiculo. Calidad,resistencia y tecnologia para conducir seguro en cualquier camino.</p>
    </div>
  </div>
  <div class="row" style="background: white; padding: 50px 0; margin:0;">
    <div class="col s12 m6 " style="padding-left: 60px;">
      <%-- CORREGIDO: el botón comprar ahora debe mandar al login --%>
      <a href="InicioSesion.jsp" class="btn indigo darken-4">Comprar ahora</a>
    </div>
    <div class="col s12 m6 right" style="margin-top: -200px; float: right;">
      <img class="responsive-img" src="imagenes/imagen fond.png" style="width: 400px; border-radius: 15px;">
    </div>
    <div class="responsive" style="display: flex; gap: 15px; margin-top: 5px; flex-wrap: wrap;">
      <%-- CORREGIDO: Registro.html -> Registro.jsp sin espacio --%>
      <a href="Registro.jsp" class="btn indigo darken-4" style="white-space: nowrap;transform: translateX(-300px);">Registrarse</a>
    </div>
  </div>

  <footer class="page-footer indigo darken-4 " style="height: 260px; margin-top: 240px;">
      <div class="container">
        <div class="row">
          <div class="col l6 s12">
            <h5 class="white-text"><i class="small material-icons">flash_on</i>HELLALIGHTING </h5>
            <p class="grey-text text-lighten-4">Iluminacion LED profesional para tu vehiculo. Calidad y confianza en cada ruta.</p>
          </div>
          <div class="col l4 offset-l2 s12">
            <h5 class="white-text">Encuentranos en:</h5>
            <ul>
              <li><img src="imagenes/logo tiktok.png" alt="tiktok" width="20px"><a class="grey-text text-lighten-3" href="https://www.tiktok.com/@hellalighting?_r=1&_t=ZS-99ynGRjFi7j" target="_blank">TikTok</a></li>
              <li><img src="imagenes/logo facebook.png" alt="Facebook" width="20px"><a class="grey-text text-lighten-3" href="https://www.facebook.com/profile.php?id=61574858726534&locale=es_LA" target="_blank">Facebook</a></li>
              <li><img src="imagenes/logo whatsapp.png" alt="whatsapp" width="20px"><a class="grey-text text-lighten-3" href=" https://wa.me/573232500572" target="_blank">Whatsapp</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">© 2026 Copyright Text</div>
      </div>
    </footer>
    <script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>