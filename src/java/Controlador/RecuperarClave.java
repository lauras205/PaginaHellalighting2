package Controlador;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import Recursos.Conexion;

@WebServlet("/RecuperarClave")
public class RecuperarClave extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws java.io.IOException {
        String id = req.getParameter("id");
        String correo = req.getParameter("correo");
        String telefono = req.getParameter("telefono");
        String nueva = req.getParameter("nueva");
        try (Connection con = Conexion.getConexion()) {
            // AUTENTICACIÓN: 3 datos deben coincidir en la misma fila
            PreparedStatement ps = con.prepareStatement("SELECT id_cliente FROM cliente WHERE id_cliente=? AND correo=? AND telefono=?");
            ps.setString(1, id); ps.setString(2, correo); ps.setString(3, telefono);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                PreparedStatement upd = con.prepareStatement("UPDATE cliente SET `contraseña`=? WHERE id_cliente=?");
                upd.setString(1, nueva); upd.setString(2, id);
                upd.executeUpdate();
                res.sendRedirect("InicioSesion.jsp?recuperado=1");
            } else {
                res.sendRedirect("Recuperar.jsp?error=1");
            }
        } catch (Exception e) { e.printStackTrace(); res.getWriter().println("Error: "+e.getMessage());}
    }
}