package Controlador;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import Recursos.Conexion;

@WebServlet("/AgregarCarrito")
public class AgregarCarrito extends HttpServlet{
    
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse res) throws java.io.IOException, jakarta.servlet.ServletException{
    HttpSession ses=req.getSession(false);
    if(ses==null||ses.getAttribute("id")==null){res.sendRedirect("InicioSesion.jsp"); return;}
    String idCliente=(String)ses.getAttribute("id");
    String idProd=req.getParameter("id_producto");
    float precio=Float.parseFloat(req.getParameter("precio"));
    
    try(java.sql.Connection con=Recursos.Conexion.getConexion()){
        // 1. Busca pedido en carrito
        java.sql.PreparedStatement ps=con.prepareStatement("SELECT id_pedido FROM pedido WHERE id_cliente=? AND estado='en_carrito' LIMIT 1");
        ps.setString(1,idCliente);
        java.sql.ResultSet rs=ps.executeQuery();
        String idPedido;
        if(rs.next()){
            idPedido=rs.getString(1);
        } else {
            idPedido="P"+ (System.currentTimeMillis() % 10000000);
            // AQUÍ ESTÁ EL FIX: llenamos id_cliente Y cliente_id_cliente
            java.sql.PreparedStatement ps2=con.prepareStatement("INSERT INTO pedido(id_pedido,id_cliente,fecha,estado,cliente_id_cliente) VALUES(?, ?, CURDATE(), 'en_carrito', ?)");
            ps2.setString(1,idPedido); ps2.setString(2,idCliente); ps2.setString(3,idCliente);
            ps2.executeUpdate();
        }
        String idDetalle="D"+ (System.currentTimeMillis() % 10000000) + (int)(Math.random()*100);
        java.sql.PreparedStatement ps3=con.prepareStatement("INSERT INTO detalle_pedido(id_detalle,id_pedido,id_producto,cantidad,subtotal) VALUES(?,?,?,?,?)");
        ps3.setString(1,idDetalle); ps3.setString(2,idPedido); ps3.setString(3,idProd); ps3.setInt(4,1); ps3.setFloat(5,precio);
        ps3.executeUpdate();
        
        res.sendRedirect("VerCarrito");
    }catch(Exception e){e.printStackTrace(); res.getWriter().println("Error carrito: "+e.getMessage());}
}}