
package Controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EliminarDelCarrito")
public class EliminarDelCarrito extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
        String idDetalle = req.getParameter("id_detalle");
        try(Connection con = Recursos.Conexion.getConexion()){
            PreparedStatement ps = con.prepareStatement("DELETE FROM detalle_pedido WHERE id_detalle=?");
            ps.setString(1, idDetalle);
            ps.executeUpdate();
        }catch(Exception e){ e.printStackTrace(); }
        res.sendRedirect("VerCarrito");
    }
}