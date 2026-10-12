<%-- 
    Document   : Recuperar
    Created on : 10 oct 2026, 5:37:59 p.m.
    Author     : Laura
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head><meta charset="UTF-8"><title>Recuperar - HellaLighting</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/materialize.min.css">
<link rel="icon" type="image/png" href="imagenes/logo hellalighting.png">
</head>

<body>
<nav class="indigo darken-4"><div class="nav-wrapper container"><a class="brand-logo">HELLALIGHTING</a></div></nav>
<div class="container" style="margin-top:50px; max-width:550px;">
  <h5 class="indigo-text">Verificación de identidad</h5>
  <p style="color:#666">Para recuperar tu contraseña, confirma 3 datos tuyos.</p>
  <% if(request.getParameter("error")!=null){ %>
    <div class="card-panel red lighten-4 red-text">Datos no coinciden. Verifica ID, correo y teléfono.</div>
  <% } %>
  <form action="RecuperarClave" method="POST">
    <div class="input-field"><i class="material-icons prefix">badge</i><input type="text" name="id" required><label>ID / Cédula registrada</label></div>
    <div class="input-field"><i class="material-icons prefix">email</i><input type="email" name="correo" required><label>Correo registrado</label></div>
    <div class="input-field"><i class="material-icons prefix">phone</i><input type="text" name="telefono" required><label>Teléfono registrado</label></div>
    <div class="input-field"><i class="material-icons prefix">lock_reset</i><input type="password" name="nueva" minlength="4" maxlength="8" required><label>Nueva contraseña (4 a 8 caracteres)</label></div>
    <button class="btn indigo darken-4" type="submit">Verificar y actualizar</button>
  </form>
  <br><a href="InicioSesion.jsp">Volver al Inicio de sesión</a>
</div>
<script src="js/materialize.min.js"></script>
</body></html>