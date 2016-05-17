
package Modelo;

/**
 *
 * @author Matias
 */
public class HiloTiket extends Thread{
    ImprimirTiket im;
    private boolean seguir;
    
    public HiloTiket(){
        im = new ImprimirTiket();
        seguir = true;
    }
    public void parar(){
        seguir = false;
    }
    
    public void run(String titulo,String nombre,String fecha,String hora,String tipo){    
        while ( seguir == true){            
            im.printTexto(titulo,nombre,fecha,hora,tipo);
            this.parar();
        }       
    }
}
