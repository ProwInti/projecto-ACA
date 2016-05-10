package Controlador;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import static javax.swing.text.html.HTML.Tag.S;

/**
 *
 * @author Matias
 */
public class DAO {
    
    Conexion c;
    
    int n;
    String t,f,RutUsuario,ClaveUsuario, EstadoDelay;
    static ResultSet ResResultado,ResEstadoDelay,ResTipo,ResTamañoTabla,ResUser,ResPass;
    
    public DAO(){
       c = new Conexion();
        
    }
    
    public String getUser(String pass){
           
        ResUser= c.Consulta("select Rut_Funcionario from USUARIO where Clave ='"+pass+"'");           
        try {              
            if(ResUser.next()){
                RutUsuario = ResUser.getString("Rut_Funcionario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return RutUsuario;
    }
    
    public String getPass(String user){
           
        ResPass = c.Consulta("select clave from usuario where Rut_Funcionario = '"+user+"'");          
        try {              
            if(ResPass.next()){
                ClaveUsuario = ResPass.getString("Clave");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return ClaveUsuario;
    }
    
    public Date HoraDelay(Date fecha, int segundos)
    {
      Calendar calendar = Calendar.getInstance();
      calendar.setTime(fecha); // Configuramos la fecha que se recibe    
      calendar.add(Calendar.SECOND, segundos);  // numero de horas a añadir, o restar en caso de horas<0  
        
      return calendar.getTime(); // Devuelve el objeto Date con las nuevas horas añadidas	
    }
    
    public String getFechaActual() 
    {
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
        return formateador.format(ahora);
    }
    
    public String getFuncionario(String rut){
        f= null;    
        ResResultado= c.Consulta("select Nombre_Completo from FUNCIONARIO where Rut ='"+rut+"'");           
        try {              
            if(ResResultado.next()){
                f = ResResultado.getString("Nombre_Completo");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return f;
    }
    
    public String getTipoDeEntrada(String rut){

        t= null;    
        ResTipo= c.Consulta("select Tipo_Reg from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun ='"+rut+"')");            
            try {              
                if(ResTipo.next()){
                    t = ResTipo.getString("Tipo_Reg");  
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
            }
            return t;
    }
    
    public String EstadoDelay(String rut) throws SQLException{     
        ResEstadoDelay = c.Consulta("IF (GETDATE()) > (select Hora_Delay from REGISTRO where Cod_Reg = (select MAX(Cod_Reg)from REGISTRO where Rut_Fun = '"+rut+"'))select 'TRUE'else select 'FALSE'go");          
            if(ResEstadoDelay.next()){                
                EstadoDelay = ResEstadoDelay.getString(1);
            }
           return EstadoDelay;
    }
        
    public static void RegistrarRegistros(
            String rut, String nombre, int modulo,
            String tipo) throws SQLException
    {
        CallableStatement consulta = Conexion.getConexion().prepareCall("{call RegistrarRegistro(?,?,?,?)}");
        consulta.setString(1,rut);
        consulta.setString(2,nombre);
        consulta.setInt(3,modulo);
        consulta.setString(4,tipo);
        consulta.execute();
    }
    
    public int getHayRegistros(String rut){
        n = 0;    
        ResTamañoTabla = c.Consulta("select COUNT(*) from REGISTRO where Rut_Fun = '"+rut+"' ");          
            try {              
                if(ResTamañoTabla.next()){
                    n = ResTamañoTabla.getInt(1);  
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
            }
        return n;
    }
    
    
}
