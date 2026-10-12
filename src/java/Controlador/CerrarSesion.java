package Controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

// Este servlet se encarga de cerrar la sesión del usuario
// Se llama desde un link o botón: <a href="CerrarSesion">Salir</a>
@WebServlet("/CerrarSesion")
public class CerrarSesion extends HttpServlet {

    // Usamos doGet porque cerrar sesión es una acción que viene por link (GET)
    // Esto cumple con el requisito del profe de usar métodos GET y POST
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        // 1. Obtiene la sesión actual del usuario (si existe)
        HttpSession sesion = request.getSession(false);
        
        // 2. Si hay sesión, la destruye (invalida)
        // Esto borra los atributos "correo" y "rol" que guardamos en ValidarAcceso
        if (sesion != null) {
            sesion.invalidate(); // Cierra la sesión completamente
        }
        
        // 3. Redirige de nuevo al login
        // Así el usuario no puede volver atrás sin volver a loguearse
        response.sendRedirect("InicioSesion.jsp");
    }

    // doPost por si alguien lo llama por POST, hace lo mismo que GET
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response); // Reutilizamos la lógica de cerrar sesión
    }
}