<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro_hellalighting</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/logo hellalighting.png">
</head>
<body>

    <nav class="indigo darken-4" style="height: 200px; line-height: 200px"> 
        <div class="nav-wrapper container">
          <a href="#" class="brand-logo"><img src="${pageContext.request.contextPath}/imagenes/hellalighting_white_transparent.png" alt="logo" style="width: 200px;"></a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="InicioSesion.jsp">¿ya estás registrado?,ingresa aquí</a></li>
          </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="indigo-text text-darken-4" style="margin-top: 80px;">Crea tu cuenta</h1>
        <p>Únete a mas de 10.000 conductores que ya mejoraron su visibilidad nocturna</p>

        <%-- POPUP USUARIO YA EXISTE --%>
        <% if(request.getParameter("duplicado") != null){ %>
        <div id="modalDuplicado" class="modal">
          <div class="modal-content center-align">
            <i class="material-icons large red-text">error_outline</i>
            <h5 class="indigo-text text-darken-4">Usuario ya existe</h5>
            <p>No puedes registrarte porque <b>ese correo o ese ID ya existe</b> como cliente o vendedor.</p>
          </div>
          <div class="modal-footer">
            <a href="InicioSesion.jsp" class="btn indigo darken-4">Ir a iniciar sesión</a>
            <a href="#!" class="modal-close btn-flat">Cerrar</a>
          </div>
        </div>
        <% } %>

        <% if(request.getParameter("error") != null){ %>
            <div class="card-panel red lighten-4 red-text text-darken-4"><b>Error:</b> <%= request.getParameter("error") %></div>
        <% } %>

        <form id="formRegistro" action="${pageContext.request.contextPath}/RegistroUsuario" method="POST" class="col s12" style="margin-top: 20px;">
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">account_circle</i>
              <input id="id" type="text" name="id" class="validate" required maxlength="20">
              <label for="id">ID (Ej: C001 o V001)</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">account_circle</i>
              <input id="nombre" type="text" name="nombre" class="validate" required>
              <label for="nombre">Nombre completo</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">phone</i>
              <input id="telephone" type="tel" name="telefono" class="validate" required>
              <label for="telephone">Telefono</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">email</i>
              <input id="email" type="email" name="correo" class="validate" required>
              <label for="email">Correo electronico</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">home</i>
              <input id="dir" type="text" name="dir_de_envio" class="validate" required>
              <label for="dir">Dirección de envío</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">store</i>
              <select id="rol" name="rol">
                <option value="" disabled selected>Elige tu rol</option>
                <option value="cliente">Cliente</option>
                <option value="vendedor">Vendedor</option>
              </select>
              <label>Tipo de usuario</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">lock</i>
              <input id="password" type="password" name="clave" class="validate" required minlength="4">
              <label for="password">Contraseña</label>
            </div>
            <div class="input-field col s12">
              <i class="material-icons prefix">lock</i>
              <input id="password2" type="password" class="validate" required>
              <label for="password2">Confirmar contraseña</label>
              <span class="helper-text" id="msgConfirmar"></span>
            </div>
          </div>
          <p>
            <label>
              <input type="checkbox" id="terminos">
              <span>Acepto terminos y condiciones</span>
            </label>
          </p>
          <button class="btn waves-effect waves-light indigo darken-4" type="submit">Registrar
            <i class="material-icons right">send</i>
          </button>
        </form>
    </div>

    <footer class="page-footer indigo darken-4" style="height: 260px; margin-top: 100px;">
        <div class="container"><div class="row"><div class="col l6 s12"><h5 class="white-text"><i class="small material-icons">flash_on</i>HELLALIGHTING </h5><p class="grey-text text-lighten-4">Iluminacion LED profesional para tu vehiculo.</p></div></div></div>
        <div class="footer-copyright"><div class="container">© 2026 Copyright</div></div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        M.FormSelect.init(document.querySelectorAll('select'));
        M.Modal.init(document.querySelectorAll('.modal'));
        <% if(request.getParameter("duplicado") != null){ %>
            var instance = M.Modal.getInstance(document.getElementById('modalDuplicado'));
            instance.open();
        <% } %>
      });

      const pass1 = document.getElementById('password');
      const pass2 = document.getElementById('password2');
      const msg = document.getElementById('msgConfirmar');

      function validar(){
        if(pass2.value === ''){ msg.textContent=''; return; }
        if(pass1.value === pass2.value){
            msg.textContent='Contraseñas coinciden'; msg.style.color='green';
        } else {
            msg.textContent='No coinciden'; msg.style.color='red';
        }
      }
      pass1.addEventListener('input', validar);
      pass2.addEventListener('input', validar);

      document.getElementById('formRegistro').addEventListener('submit', function(e){
        if(pass1.value !== pass2.value){
            e.preventDefault();
            M.toast({html: 'Las contraseñas no coinciden', classes: 'red'});
            return false;
        }
        if(document.getElementById('rol').value === ''){
            e.preventDefault();
            M.toast({html: 'Elige tu rol', classes: 'red'});
            return false;
        }
        if(!document.getElementById('terminos').checked){
            e.preventDefault();
            M.toast({html: 'Debes aceptar términos', classes: 'red'});
            return false;
        }
      });
    </script>
</body>
</html>