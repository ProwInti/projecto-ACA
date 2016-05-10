package Controlador;

import java.awt.*;
import java.awt.print.*;
import javax.print.PrintService;
import javax.print.attribute.*;
import javax.print.attribute.standard.*;
import static java.awt.print.Printable.PAGE_EXISTS;

public class ImprimirTiket implements Printable{
    private PrintService[] printService;
    private String tl, nb, fc, hr, tp;
    private PrinterJob pj;
    private PrintRequestAttributeSet pras;

    public ImprimirTiket() {
        this.printService = PrinterJob.lookupPrintServices();
        pras = new HashPrintRequestAttributeSet();
        pras.add(MediaSizeName.ISO_A4);
        pras.add(new PageRanges(1,1));
        pras.add(new Copies(1));
        pj = PrinterJob.getPrinterJob();
        pj.setPrintable(this);
    }
    
    public void printTexto(String titulo,String nombre,String fecha,String hora,String tipo ) {
 
         tl = titulo;
         tp = tipo;
         nb = nombre;
         fc = fecha;
         hr = hora;
         
         
        try {
            pj.setPrintService(printService[0]);
            pj.print(pras);
            
        } catch (PrinterException err) {
            System.err.println(err);
        }
    }
 
    public int print(Graphics g, PageFormat pf, int pageIndex) throws PrinterException {
        Graphics2D g2 = (Graphics2D) g; 
        g2.translate(pf.getImageableX(), pf.getImageableY());
        
        g.setFont(new Font("Arial Narrow", Font.PLAIN, 24));
        g.drawString(String.valueOf(tl), 30, 20);
        g.setFont(new Font("Arial Narrow", Font.PLAIN, 13));
        g.drawString(String.valueOf(tp), 77, 36);
        g.drawString(String.valueOf("Nombre: "+nb), 3, 50);
        g.drawString(String.valueOf("Fecha:  "+fc), 3, 62);
        g.drawString(String.valueOf("Hora:   "+hr), 3, 75);
        g.setColor(Color.white);
        g.setFont(new Font("Arial Narrow", Font.PLAIN, 13));
        g.drawString("no se vera ", 89, 110);
        g.dispose();
         
        return PAGE_EXISTS; 
    }
}

