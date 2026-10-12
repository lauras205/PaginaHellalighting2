<%-- 
    Document   : InicioSesion
    Created on : 9 oct 2026, 1:26:27 a.m.
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio_sesión_hellalighting</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css">
    <link rel="icon" type="image/png" href="imagenes/logo hellalighting.png">
</head>
<body>
    <%-- POPUP REGISTRO EXITOSO --%>
<% if(request.getParameter("registro") != null){ %>
<div id="modalExito" class="modal">
  <div class="modal-content center-align">
    <i class="large material-icons green-text">check_circle</i>
    <h4 class="indigo-text text-darken-4">¡Registro exitoso!</h4>
    <p>Tu cuenta fue creada correctamente. Ahora inicia sesión.</p>
  </div>
  <div class="modal-footer">
    <a href="#!" class="modal-close waves-effect waves-light btn indigo darken-4">Continuar</a>
  </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function(){
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems);
    var modal = M.Modal.getInstance(document.getElementById('modalExito'));
    modal.open();
  });
</script>
<% } %>
    <nav class="indigo darken-4" style="height: 200px; line-height: 200px"> 
    <div class="nav-wrapper container">
      <a href="#" class="brand-logo"><img src="imagenes/hellalighting_white_transparent.png" alt="logo" style="width: 200px;"></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="collapsible.html">Nosotros</a></li>
        <li><a href="https://wa.me/573232500572">Contacto</a></li>
        <%-- CORREGIDO: Registro.html -> Registro.jsp --%>
        <li><a href="Registro.jsp">¿Aún no tienes cuenta?,registrate aquí</a></li>
      </ul>
    </div>
  </nav>

<div class="container">
  <h1 class="indigo-text text-darken-4" style="margin-top: 150px;">Bienvenido de nuevo</h1>
  <p>Ingresa a tu cuenta para gestionar tus luces LED y seguir iluminando el camino.</p>
 
  <%-- MENSAJES DE ERROR QUE VIENEN DEL SERVLET --%>
  <% if(request.getParameter("error") != null){ %>
    <p class="red-text"><b>Correo o contraseña incorrectos (verifica cliente y vendedor)</b></p>
  <% } %>
  <% if(request.getParameter("registro") != null){ %>
    <p class="green-text"><b>Registro OK, inicia sesión</b></p>
  <% } %>
  
  <% if(request.getParameter("recuperado") != null){ %>
  <p class="green-text"><b>¡Clave actualizada! Inicia sesión con tu nueva contraseña</b></p>
<% } %>

  <%-- AQUÍ EMPIEZA EL FORMULARIO QUE HABLA CON ValidarAcceso --%>
  <form action="ValidarAcceso" method="POST">
       
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">email</i>
          <%-- AGREGADO name="correo" para que el servlet lo lea --%>
          <input id="email" type="email" name="correo" class="validate" required>
          <label for="email">Correo electronico</label>
          <span class="helper-text" data-error="Correo inválido" data-success="Correcto"></span>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">lock</i>
          <%-- AGREGADO name="clave" --%>
          <input id="password" type="password" name="clave" class="validate" maxlength="8" minlength="4" required>
          <label for="password">Contraseña</label>
          <i class="material-icons" id="verClave" style="position: absolute; right: 15px; top: 12px; cursor: pointer;">visibility_off</i>
          <script>
            const ver = document.getElementById('verClave');
            const clave = document.getElementById('password');
            ver.addEventListener('click', function() {
              clave.type = clave.type === 'password' ? 'text' : 'password';
              this.textContent = clave.type === 'password' ? 'visibility_off' : 'visibility';
            });
          </script> 
        </div> 
      </div>
          
     <div class="container">
       <p>
      <label>
        <input type="checkbox">
        <span class="black-text">Recordarme</span>
      </label>
      <div class="row">
      <div class="col s6">
        <a href="Recuperar.jsp" class="indigo-text text-darken-4 right" style="font-size: 13px; margin-top: -10px;">¿Olvidaste tu contraseña?</a>
  </div>
</div>
    </p>
     <%-- CORREGIDO: quitamos el <a href="productos.html"> y dejamos solo el botón submit --%>
     <button class="btn waves-effect waves-light indigo darken-4" style="color: white;" type="submit" name="action">Ingresar
        <i class="material-icons right">send</i>
     </button>
  </div>
  </form>
  </div>

<footer class="page-footer indigo darken-4 " style="height: 260px; margin-top: 240px;">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text"><i class="small material-icons">flash_on</i>HELLALIGHTING </h5>
                <p class="grey-text text-lighten-4">Iluminacion LED profesional para tu vehiculo.</p>
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


<script>
  document.addEventListener('DOMContentLoaded', function() { 
    var elems = document.querySelectorAll('select');
    M.FormSelect.init(elems);

    var elemsModal = document.querySelectorAll('.modal');
    M.Modal.init(elemsModal);
  }); 
</script>
</body></html>
   