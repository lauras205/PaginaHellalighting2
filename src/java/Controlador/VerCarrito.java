package Controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/VerCarrito")
public class VerCarrito extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, jakarta.servlet.ServletException{
        HttpSession ses=req.getSession(false);
        if(ses==null||ses.getAttribute("id")==null){res.sendRedirect("InicioSesion.jsp"); return;}
        String idCliente=(String)ses.getAttribute("id");
        try(Connection con=Recursos.Conexion.getConexion()){
            PreparedStatement ps=con.prepareStatement("SELECT id_pedido FROM pedido WHERE id_cliente=? AND estado='en_carrito' LIMIT 1");
            ps.setString(1,idCliente);
            ResultSet rs=ps.executeQuery();
            if(!rs.next()){
                req.setAttribute("vacio", true);
                req.getRequestDispatcher("Carrito.jsp").forward(req, res);
                return;
            }
            String idPedido=rs.getString(1);
            // Trae detalle + nombre del producto
            PreparedStatement ps2=con.prepareStatement(
               "SELECT dp.id_detalle, dp.id_producto, dp.cantidad, dp.subtotal, pr.nombre " +
                "FROM detalle_pedido dp JOIN producto pr ON dp.id_producto = pr.id_producto " +
                "WHERE dp.id_pedido=?");
            ps2.setString(1,idPedido);
            ResultSet rs2=ps2.executeQuery();
            req.setAttribute("id_pedido", idPedido);
            req.setAttribute("detalles", rs2); // pasamos ResultSet directo para no complicar
            req.getRequestDispatcher("Carrito.jsp").forward(req, res);
        }catch(Exception e){e.printStackTrace(); res.getWriter().println("Error VerCarrito: "+e.getMessage());}
    }
}