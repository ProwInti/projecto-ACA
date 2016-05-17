package Controlador;

import Modelo.DatosConexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Matias
 */
public class Conexion {
    
    static Connection contacto = null;
    
    public static Connection getConexion(){
    
        String url = "jdbc:sqlserver://"+DatosConexion.SERVIDOR+
                ";"+DatosConexion.BASEDEDATOS;

        jdbc:sqlserver://HOSTNAME;integratedSecurity=true;database=DATABASE;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");         
        }catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null,
                    "no se pudo establecer la conexion... revisar el Driver");
        }
        
        try{
            contacto = DriverManager.getConnection(url,DatosConexion.USUARIO,DatosConexion.CLAVE);    
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Error: " + e.getLocalizedMessage(),
                    "Error de conexion ", JOptionPane.ERROR_MESSAGE);
        }
        return contacto;
    }
        
    public static ResultSet consulta (String consulta){
        Connection con = getConexion();
        Statement declara;
        try{
            declara = con.createStatement();
            ResultSet respuesta = declara.executeQuery(consulta);
            return respuesta;
        }catch(SQLException e){
        JOptionPane.showMessageDialog(null, "Error: " + e.getLocalizedMessage(),
                "Error de conexion ", JOptionPane.ERROR_MESSAGE);            
        return null;
        }
    } 
}
