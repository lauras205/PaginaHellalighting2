
package Modelo;

import Recursos.Conexion;
import java.sql.*;
import java.util.*;

public class ProductoDAO {

    public List<ProductoVO> listar() {
        List<ProductoVO> lista = new ArrayList<>();
        String sql = "SELECT id_producto, nombre, descripcion, precio, categoria, imagen FROM producto WHERE estado='disponible'";
        try (Connection con = Conexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductoVO p = new ProductoVO();
                p.setId(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setCategoria(rs.getString("categoria"));
                p.setImagen(rs.getString("imagen"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}