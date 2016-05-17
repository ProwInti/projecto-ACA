package Controlador;

import Modelo.*;
import Vista.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Matias
 */
public class DAO {
    
    Conexion conexion;//variable del objeo Conexion
    
    int n,codigoFuncionario; //variables del tipo numerico
    String t,nf,ap,am,rutUsuario,claveUsuario, estadoDelay,rutBusqueda,verificador,digitoVerificador;//variables de tipo texto
    static ResultSet RESRESULTADO,RESESTADODELAY,RESTIPO,RESTAMAÑOTABLA,RESUSER,
            RESPASS,RESREGISTROS,RESRUT,BUSCAVERIFICADOR, RESCODIGOFUNCIONARIO; //variables de tipo Resultset
    
    public DAO(){
       conexion = new Conexion();//instancia al objeto Conexion
    }
    
    /**
     * metodo al que se le entrega un int pass
     * y retorna el codigo del funcionario al cual pertenece ese dato
     */
    public String getUser(String pass){
           
        RESUSER= conexion.consulta("select Codigo_Funcionario from USUARIO where Clave_Funcionario ='"+pass+"'");//consulta que rescata el codigo de un funcionario en funcion de su rut           
        try {              
            if(RESUSER.next()){
                rutUsuario = RESUSER.getString("Codigo_Funcionario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return rutUsuario;//retorno del codigo del funcionario
    }
    
    /**
     * metodo al que se le entrega un String user
     * y retorna la clave del funcionario al cual pertenece ese dato
     */
    public String getPass(String user){
           
        RESPASS = conexion.consulta("select Clave_Funcionario from USUARIO where Codigo_Funcionario = '"+user+"'");          
        try {              
            if(RESPASS.next()){
                claveUsuario = RESPASS.getString("Clave_Funcionario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return claveUsuario;
    }
    
    
      /**
     * metodo que retorna la cantidad de registros de la tabla REGISTROS
     */
    public ResultSet registros(){
        RESREGISTROS= Conexion.consulta("select  Nom_Funcionario, Tipo_Registro   from REGISTRO order by Codigo_Registro DESC ");
        return RESREGISTROS;
    }
 
     /**
     * metodo al que se le entrega un int pass
     * y retorna el codigo del funcionario al cual pertenece ese dato
     */
    public Date horaDelay(Date fecha, int segundos)
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
    
    public String verificarRutFuncionario( String rut){
       
           RESRUT = conexion.consulta("select Rut_Funcionario, DigitoV_Funcionario  from FUNCIONARIO where Rut_Funcionario ='"+rut+"'");

            try {
                if(RESRUT.next()){
                    rutBusqueda = RESRUT.getString("Rut_Funcionario");
                    verificador = RESRUT.getString("DigitoV_Funcionario");
                    rutBusqueda = rutBusqueda + verificador;
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        
          return rutBusqueda;      
        
    }
    
    public String  getDigitoVerificador(String rut) {
     
        BUSCAVERIFICADOR = conexion.consulta("select  DigitoV_Funcionario  from FUNCIONARIO where Rut_Funcionario ='"+rut+"'");
   
        try {            
            if(BUSCAVERIFICADOR.next()){
                digitoVerificador = BUSCAVERIFICADOR.getString("DigitoV_Funcionario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return digitoVerificador;
    }
  
    
    public String getNombreFuncionario(String rut){
        nf= null;  
        ap= null;
        am= null;
        
        RESRESULTADO= conexion.consulta("select Nombre_Funcionario, ApellidoP_Funcionario, ApellidoM_Funcionario  from FUNCIONARIO where Rut_Funcionario ='"+rut+"'");           
        try {              
            if(RESRESULTADO.next()){
                nf = RESRESULTADO.getString("Nombre_Funcionario");
                ap = RESRESULTADO.getString("ApellidoP_Funcionario");
                am = RESRESULTADO.getString("ApellidoM_Funcionario");
                
                nf = nf+" "+ap+" "+am;              
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
        }
        return nf;
        
    }
    
    public String getTipoDeEntrada(String rut){
        t= null;    
        RESTIPO= conexion.consulta("select Tipo_Registro from REGISTRO where Codigo_Registro = (select MAX(Codigo_Registro)from REGISTRO where Rut_Funcionario ='"+rut+"')");            
            try {              
                if(RESTIPO.next()){
                    t = RESTIPO.getString("Tipo_Registro");  
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
            }
            return t;
    }
    
    public String estadoDelay(String rut) {     
        RESESTADODELAY = conexion.consulta("IF (GETDATE()) > (select Hora_Delay_registro from REGISTRO where Codigo_Registro = (select MAX(Codigo_Registro)from REGISTRO where Rut_Funcionario = '"+rut+"'))select 'TRUE'else select 'FALSE'go");          
        try {                
            if(RESESTADODELAY.next()){
                estadoDelay = RESESTADODELAY.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
           return estadoDelay;
    }
      

    public int getCodigoFuncionario(String rut) {
     
        codigoFuncionario = 0;
        RESCODIGOFUNCIONARIO = conexion.consulta("select Codigo_Funcionario from FUNCIONARIO where Rut_Funcionario = '"+rut+"'");
             
        try {
            if(RESCODIGOFUNCIONARIO.next()){
                codigoFuncionario = RESCODIGOFUNCIONARIO.getInt("Codigo_Funcionario");;            
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return codigoFuncionario;
    }
    
    
    public static void registrarRegistros( int codigo,
            String rut,  String verificador, String nombre, int modulo,
            String tipo) throws SQLException
    {
        CallableStatement consulta = Conexion.getConexion().prepareCall("{call Registrar_Registro(?,?,?,?,?,?)}");
        consulta.setInt(1,codigo);
        consulta.setString(2,rut);
        consulta.setString(3,verificador);
        consulta.setString(4,nombre);
        consulta.setInt(5,modulo);
        consulta.setString(6,tipo);
        consulta.execute();
    }
    
    public int getHayRegistros(String rut){
        n = 0;    
        RESTAMAÑOTABLA = conexion.consulta("select COUNT(*) from REGISTRO where Rut_Funcionario = '"+rut+"' ");          
            try {              
                if(RESTAMAÑOTABLA.next()){
                    n = RESTAMAÑOTABLA.getInt(1);  
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);                      
            }
        return n;
    }
}
