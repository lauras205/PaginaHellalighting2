
package Controlador;

import Modelo.ProductoDAO;
import Modelo.ProductoVO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListarProducto")
public class ListarProducto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);
        
        // CORREGIDO: Validamos "nombre" o "rol", no "usuario"
        if (sesion == null || sesion.getAttribute("nombre") == null) {
            System.out.println("SESIÓN VACÍA, regreso a login");
            response.sendRedirect("InicioSesion.jsp");
            return;
        }
        
        try {
            ProductoDAO dao = new ProductoDAO();
            List<ProductoVO> lista = dao.listar();
            System.out.println("Productos encontrados: " + lista.size());
            request.setAttribute("productos", lista);
            // CORREGIDO: P mayúscula
            request.getRequestDispatcher("PanelCliente.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("InicioSesion.jsp?error=bd");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}