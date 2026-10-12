
package Controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RegistroUsuario")
public class RegistroUsuario extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, jakarta.servlet.ServletException{
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String nombre = req.getParameter("nombre");
        String correo = req.getParameter("correo");
        String clave = req.getParameter("clave");
        String telefono = req.getParameter("telefono");
        String dir = req.getParameter("dir_de_envio");
        String rol = req.getParameter("rol");

        if(id == null || id.isEmpty()){
            res.sendRedirect("Registro.jsp?error=ID+vacio");
            return;
        }

        try(Connection con = Recursos.Conexion.getConexion()){
            
            // Validar duplicado con nombres REALES de tus tablas
            try(PreparedStatement chkCli = con.prepareStatement("SELECT id_cliente FROM cliente WHERE id_cliente=? OR correo=?")){
                chkCli.setString(1, id);
                chkCli.setString(2, correo);
                if(chkCli.executeQuery().next()){
                    res.sendRedirect("Registro.jsp?duplicado=1");
                    return;
                }
            }
            try(PreparedStatement chkVen = con.prepareStatement("SELECT id_vendedor FROM vendedor WHERE id_vendedor=? OR correo_vendedor=?")){
                chkVen.setString(1, id);
                chkVen.setString(2, correo);
                if(chkVen.executeQuery().next()){
                    res.sendRedirect("Registro.jsp?duplicado=1");
                    return;
                }
            }

            if("vendedor".equals(rol)){
                try(PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO vendedor(id_vendedor, nombre_vendedor, correo_vendedor, `contraseña_vendedor`) VALUES (?,?,?,?)")){
                    ps.setString(1, id); ps.setString(2, nombre); ps.setString(3, correo); ps.setString(4, clave);
                    ps.executeUpdate();
                }
            } else {
                try(PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO cliente(id_cliente, nombre_cx, correo, telefono, `contraseña`, dir_de_envio) VALUES (?,?,?,?,?,?)")){
                    ps.setString(1, id); ps.setString(2, nombre); ps.setString(3, correo); ps.setString(4, telefono); ps.setString(5, clave); ps.setString(6, dir);
                    ps.executeUpdate();
                }
            }
            
            // ESTO ES LO QUE TE DA EL POPUP DE ÉXITO EN LOGIN
            res.sendRedirect("InicioSesion.jsp?registro=ok");
            
        }catch(Exception e){
            e.printStackTrace();
            res.sendRedirect("Registro.jsp?error="+java.net.URLEncoder.encode(e.getMessage(),"UTF-8"));
        }
    }
}