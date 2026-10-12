/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Recursos;

import java.sql.Connection;
import java.sql.DriverManager;

// Conexión final con tus datos reales de MySQL Workbench
public class Conexion {
    
    // Nombre exacto de tu BD según tu foto y lo que me dijiste
    private static final String URL = "jdbc:mysql://localhost:3306/paginahellalighting?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "Mateolindo.1315"; // Tu clave

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conexión OK a paginahellalighting");
        } catch (Exception e) {
            System.out.println("Error de conexión: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}
/**
 *
 * @author Laura
 */


    

