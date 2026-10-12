package Controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import Recursos.Conexion;
import java.io.IOException;

@WebServlet("/FinalizarCompra")
public class FinalizarCompra extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, jakarta.servlet.ServletException{
        HttpSession ses = req.getSession(false);
        if(ses == null || ses.getAttribute("id") == null){
            res.sendRedirect("InicioSesion.jsp");
            return;
        }
        String idCliente = (String) ses.getAttribute("id");
        String idPedido = req.getParameter("id_pedido");
        
        try(Connection con = Conexion.getConexion()){
            // 1. Finaliza el pedido actual
            PreparedStatement ps = con.prepareStatement(
                "UPDATE pedido SET estado='finalizado', fecha=CURDATE() WHERE id_pedido=? AND id_cliente=?"
            );
            ps.setString(1, idPedido);
            ps.setString(2, idCliente);
            ps.executeUpdate();
            
            // 2. Manda a la página de éxito
            req.setAttribute("id_pedido", idPedido);
            req.getRequestDispatcher("CompraExitosa.jsp").forward(req, res);
            
        }catch(Exception e){ 
            e.printStackTrace(); 
            res.getWriter().println("Error Finalizar: "+e.getMessage());
        }
    }
}