package Controlador;

import Modelo.ProductoDAO;
import Modelo.ProductoVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;
import Recursos.Conexion;

@WebServlet("/ValidarAcceso")
public class ValidarAcceso extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");

        try (Connection con = Conexion.getConexion()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT id_cliente, nombre_cx FROM cliente WHERE correo=? AND `contraseña`=?");
            ps.setString(1, correo);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("id", rs.getString("id_cliente"));
                sesion.setAttribute("nombre", rs.getString("nombre_cx"));
                sesion.setAttribute("correo", correo);
                sesion.setAttribute("rol", "cliente");
                
                // PRUEBA DIRECTA: nos saltamos ListarProducto y vamos directo al panel
                ProductoDAO dao = new ProductoDAO();
                List<ProductoVO> lista = dao.listar();
                request.setAttribute("productos", lista);
                request.getRequestDispatcher("PanelCliente.jsp").forward(request, response);
                return;
            }
            
            // Si no es cliente, prueba vendedor
            PreparedStatement psV = con.prepareStatement(
                "SELECT id_vendedor, nombre_vendedor FROM vendedor WHERE correo_vendedor=? AND `contraseña_vendedor`=?");
            psV.setString(1, correo);
            psV.setString(2, clave);
            ResultSet rsV = psV.executeQuery();
            if(rsV.next()){
                HttpSession sesion = request.getSession();
                sesion.setAttribute("nombre", rsV.getString("nombre_vendedor"));
                sesion.setAttribute("rol", "vendedor");
                response.sendRedirect("PanelVendedor.jsp");
                return;
            }

            response.sendRedirect("InicioSesion.jsp?error=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>ERROR REAL: " + e.getMessage() + "</h1>");
        }
    }
}