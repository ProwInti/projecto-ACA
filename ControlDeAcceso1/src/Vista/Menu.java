
package Vista;

import Modelo.*;
import Controlador.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Matias
 */
public class Menu extends javax.swing.JFrame {        
    
   
    private DAO dao;
    private java.util.Date hora;
    private String clave,usuario;
    private int codigoFuncionario, tamañoTabla = 0;
    private String rutBusquedaTxt,resutadoNombre, resultadoTipo, verificandoRut,
            buscandoRut,digitoVerificador;
    private int numModulo = 2;
    private JOptionPane msg;
    private static ResultSet REGISTROS;

    public Menu() {     
        deshabilitar();
        initComponents();  
        dao = new DAO();
        hora = new Date();
        cargarRegistros();
        inVisible();
        fullScrean();
        iniciarReloj();
        inicio();    
    }

    private void inicio(){        
        JPanelMenuApp.setVisible(false);
//        TxtUsuarioMenu.setText("");
//        TxtPassMenu.setText("");
        TxtUsuarioMenu.requestFocus();
        TxtRutFuncionario.requestFocus();
        TxtRutFuncionario.setText("");
        TxtNombreFuncionario.setText("");
        BtnE.isSelected();
    }

    private void iniciarReloj(){
        Reloj hilo = new Reloj(LblHora);
        hilo.start();
    }
    
    private void deshabilitar (){
        this.setUndecorated(true);
        this.setAlwaysOnTop(true);
        this.setResizable(false);
        this.setVisible(true);
    }

    private void inVisible(){
        BtnCerrar.setOpaque(false);
        BtnCerrar.setContentAreaFilled(false);                  
        BtnCerrar.setBorderPainted(false);
    }
    
    private void fullScrean (){   
        Toolkit tk = Toolkit.getDefaultToolkit();
            int xsize = (int) tk.getScreenSize().getWidth();
            int ysize = (int) tk.getScreenSize().getHeight();         
        this.setSize(xsize,ysize);     
    }
    
    public void cargarRegistros(){       
        DefaultTableModel modelo = (DefaultTableModel)  Tabla.getModel();
        modelo.setRowCount(0);
        REGISTROS = dao.registros();
        try {
            while(REGISTROS.next()){
                Vector v= new Vector();
                v.add(REGISTROS.getString(1));
                v.add(REGISTROS.getString(2));
                modelo.addRow(v);
                Tabla.setModel(modelo);
            }
        } catch (Exception e) {
        }
    }
    
    public void jopMensaje(String mensaje, int tipo, String titulo ){
        
        msg =  new  JOptionPane (  ""+mensaje+"",  tipo); 
        final  JDialog dlg = msg . createDialog (this, ""+titulo+"" ); 
        dlg . setDefaultCloseOperation ( JDialog . DO_NOTHING_ON_CLOSE ); 
        dlg.setBounds(402,538,476,148);
        new  Thread ( new  Runnable ()  { 
          @Override 
          public  void run ()  { 
            try  { 
              Thread . sleep ( 3000 ); 
            }  catch  ( InterruptedException e )  { 
              e . printStackTrace (); 
            } 
            dlg . setVisible ( false ); 
            
          } 
        }). start (); 
        dlg . setVisible ( true );
    }
    
      
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        GrupoEntradaSalida = new javax.swing.ButtonGroup();
        JPanelMenuApp = new javax.swing.JDesktopPane();
        PanelPrincipal = new javax.swing.JPanel();
        PanelFuncionario = new javax.swing.JPanel();
        TxtNombreFuncionario = new javax.swing.JTextField();
        TxtRutFuncionario = new javax.swing.JTextField();
        LblHora = new javax.swing.JLabel();
        BtnE = new javax.swing.JRadioButton();
        BtnS = new javax.swing.JRadioButton();
        TxtTipoFuncionario = new javax.swing.JTextField();
        PanelTecladoNumerico = new javax.swing.JPanel();
        Btn2 = new javax.swing.JButton();
        BtnRegistrar = new javax.swing.JButton();
        Btn1 = new javax.swing.JButton();
        Btn4 = new javax.swing.JButton();
        Btn5 = new javax.swing.JButton();
        Btn3 = new javax.swing.JButton();
        Btn6 = new javax.swing.JButton();
        Btn7 = new javax.swing.JButton();
        Btn8 = new javax.swing.JButton();
        Btn9 = new javax.swing.JButton();
        BtnK = new javax.swing.JButton();
        Btn0 = new javax.swing.JButton();
        BtnBorrar = new javax.swing.JButton();
        PanelRegistros = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        Tabla = new javax.swing.JTable();
        BtnCerrar = new javax.swing.JButton();
        JPanelMenuLogeo = new javax.swing.JDesktopPane();
        PanelLogeo = new javax.swing.JPanel();
        PanelLogeoInterior = new javax.swing.JPanel();
        TxtUsuarioMenu = new javax.swing.JTextField();
        TxtPassMenu = new javax.swing.JPasswordField();
        BtnEntrar = new javax.swing.JButton();
        BtnSalir = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        JPanelMenuApp.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        PanelPrincipal.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153), 8));
        PanelPrincipal.setPreferredSize(new java.awt.Dimension(600, 500));

        PanelFuncionario.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Funcionario", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Segoe UI", 1, 30))); // NOI18N

        TxtNombreFuncionario.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        TxtNombreFuncionario.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        TxtNombreFuncionario.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        TxtNombreFuncionario.setRequestFocusEnabled(false);

        TxtRutFuncionario.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        TxtRutFuncionario.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        TxtRutFuncionario.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        TxtRutFuncionario.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TxtRutFuncionarioKeyPressed(evt);
            }
        });

        LblHora.setFont(new java.awt.Font("Segoe UI", 1, 70)); // NOI18N
        LblHora.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        LblHora.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);

        GrupoEntradaSalida.add(BtnE);
        BtnE.setFont(new java.awt.Font("Segoe UI", 1, 48)); // NOI18N
        BtnE.setSelected(true);
        BtnE.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/BotonEntrada1.png"))); // NOI18N
        BtnE.setPreferredSize(new java.awt.Dimension(200, 50));
        BtnE.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/BotoneEntrada2.png"))); // NOI18N
        BtnE.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnEActionPerformed(evt);
            }
        });

        GrupoEntradaSalida.add(BtnS);
        BtnS.setFont(new java.awt.Font("Segoe UI", 1, 48)); // NOI18N
        BtnS.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/BotonSalida1.png"))); // NOI18N
        BtnS.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/BotonSalirda2.png"))); // NOI18N
        BtnS.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSActionPerformed(evt);
            }
        });

        TxtTipoFuncionario.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        TxtTipoFuncionario.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        TxtTipoFuncionario.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        TxtTipoFuncionario.setRequestFocusEnabled(false);

        javax.swing.GroupLayout PanelFuncionarioLayout = new javax.swing.GroupLayout(PanelFuncionario);
        PanelFuncionario.setLayout(PanelFuncionarioLayout);
        PanelFuncionarioLayout.setHorizontalGroup(
            PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelFuncionarioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PanelFuncionarioLayout.createSequentialGroup()
                        .addGroup(PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(TxtTipoFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(TxtNombreFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 354, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(BtnE, javax.swing.GroupLayout.PREFERRED_SIZE, 362, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(BtnS, javax.swing.GroupLayout.PREFERRED_SIZE, 362, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 2, Short.MAX_VALUE))
                    .addGroup(PanelFuncionarioLayout.createSequentialGroup()
                        .addComponent(TxtRutFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 224, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
            .addComponent(LblHora, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        PanelFuncionarioLayout.setVerticalGroup(
            PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PanelFuncionarioLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(LblHora, javax.swing.GroupLayout.PREFERRED_SIZE, 118, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(PanelFuncionarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(TxtRutFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TxtTipoFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(TxtNombreFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(BtnE, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(BtnS, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        PanelTecladoNumerico.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Teclado Numerico", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Segoe UI", 1, 30))); // NOI18N

        Btn2.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn2.setText("2");
        Btn2.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn2ActionPerformed(evt);
            }
        });

        BtnRegistrar.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        BtnRegistrar.setText("REGISTRAR");
        BtnRegistrar.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        BtnRegistrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnRegistrarActionPerformed(evt);
            }
        });

        Btn1.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn1.setText("1");
        Btn1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn1ActionPerformed(evt);
            }
        });

        Btn4.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn4.setText("4");
        Btn4.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn4ActionPerformed(evt);
            }
        });

        Btn5.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn5.setText("5");
        Btn5.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn5ActionPerformed(evt);
            }
        });

        Btn3.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn3.setText("3");
        Btn3.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn3ActionPerformed(evt);
            }
        });

        Btn6.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn6.setText("6");
        Btn6.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn6ActionPerformed(evt);
            }
        });

        Btn7.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn7.setText("7");
        Btn7.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn7ActionPerformed(evt);
            }
        });

        Btn8.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn8.setText("8");
        Btn8.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn8ActionPerformed(evt);
            }
        });

        Btn9.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn9.setText("9");
        Btn9.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn9ActionPerformed(evt);
            }
        });

        BtnK.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        BtnK.setText("K");
        BtnK.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        BtnK.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnKActionPerformed(evt);
            }
        });

        Btn0.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        Btn0.setText("0");
        Btn0.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        Btn0.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Btn0ActionPerformed(evt);
            }
        });

        BtnBorrar.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        BtnBorrar.setText("<<");
        BtnBorrar.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        BtnBorrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnBorrarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout PanelTecladoNumericoLayout = new javax.swing.GroupLayout(PanelTecladoNumerico);
        PanelTecladoNumerico.setLayout(PanelTecladoNumericoLayout);
        PanelTecladoNumericoLayout.setHorizontalGroup(
            PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelTecladoNumericoLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(BtnRegistrar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(PanelTecladoNumericoLayout.createSequentialGroup()
                        .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(PanelTecladoNumericoLayout.createSequentialGroup()
                                .addComponent(BtnK, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(Btn0, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, PanelTecladoNumericoLayout.createSequentialGroup()
                                    .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(Btn1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(Btn4, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(Btn7, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(Btn5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addComponent(Btn8, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addComponent(Btn2, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(Btn6, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(Btn9, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(Btn3, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(BtnBorrar, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        PanelTecladoNumericoLayout.setVerticalGroup(
            PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PanelTecladoNumericoLayout.createSequentialGroup()
                .addContainerGap(50, Short.MAX_VALUE)
                .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(Btn3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Btn2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Btn1, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PanelTecladoNumericoLayout.createSequentialGroup()
                        .addComponent(Btn4, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(Btn7, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Btn8, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(Btn9, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(Btn5, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(Btn6, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(PanelTecladoNumericoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(BtnK, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(Btn0, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(BtnBorrar, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(BtnRegistrar, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(48, 48, 48))
        );

        PanelRegistros.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Registros", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Segoe UI", 1, 30))); // NOI18N

        Tabla.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        Tabla.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null},
                {null, null},
                {null, null},
                {null, null}
            },
            new String [] {
                "Nombre", "TIPO"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        Tabla.setColumnSelectionAllowed(true);
        Tabla.setEnabled(false);
        Tabla.setRowHeight(40);
        Tabla.setRowMargin(2);
        jScrollPane1.setViewportView(Tabla);
        Tabla.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
        if (Tabla.getColumnModel().getColumnCount() > 0) {
            Tabla.getColumnModel().getColumn(0).setResizable(false);
            Tabla.getColumnModel().getColumn(0).setPreferredWidth(200);
            Tabla.getColumnModel().getColumn(1).setResizable(false);
        }

        javax.swing.GroupLayout PanelRegistrosLayout = new javax.swing.GroupLayout(PanelRegistros);
        PanelRegistros.setLayout(PanelRegistrosLayout);
        PanelRegistrosLayout.setHorizontalGroup(
            PanelRegistrosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 355, Short.MAX_VALUE)
        );
        PanelRegistrosLayout.setVerticalGroup(
            PanelRegistrosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelRegistrosLayout.createSequentialGroup()
                .addComponent(jScrollPane1)
                .addContainerGap())
        );

        javax.swing.GroupLayout PanelPrincipalLayout = new javax.swing.GroupLayout(PanelPrincipal);
        PanelPrincipal.setLayout(PanelPrincipalLayout);
        PanelPrincipalLayout.setHorizontalGroup(
            PanelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelPrincipalLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(PanelRegistros, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(PanelFuncionario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(PanelTecladoNumerico, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        PanelPrincipalLayout.setVerticalGroup(
            PanelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelPrincipalLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(PanelPrincipalLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(PanelRegistros, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(PanelFuncionario, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(PanelTecladoNumerico, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        BtnCerrar.setBackground(new java.awt.Color(59, 87, 114));
        BtnCerrar.setDefaultCapable(false);
        BtnCerrar.setOpaque(false);
        BtnCerrar.setPreferredSize(new java.awt.Dimension(100, 50));
        BtnCerrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnCerrarActionPerformed(evt);
            }
        });

        JPanelMenuApp.setLayer(PanelPrincipal, javax.swing.JLayeredPane.DEFAULT_LAYER);
        JPanelMenuApp.setLayer(BtnCerrar, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout JPanelMenuAppLayout = new javax.swing.GroupLayout(JPanelMenuApp);
        JPanelMenuApp.setLayout(JPanelMenuAppLayout);
        JPanelMenuAppLayout.setHorizontalGroup(
            JPanelMenuAppLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JPanelMenuAppLayout.createSequentialGroup()
                .addComponent(BtnCerrar, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 3048, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelMenuAppLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(PanelPrincipal, javax.swing.GroupLayout.PREFERRED_SIZE, 1150, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        JPanelMenuAppLayout.setVerticalGroup(
            JPanelMenuAppLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelMenuAppLayout.createSequentialGroup()
                .addComponent(BtnCerrar, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(PanelPrincipal, javax.swing.GroupLayout.PREFERRED_SIZE, 631, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        BtnCerrar.getAccessibleContext().setAccessibleName("BtnCerrarApp");
        BtnCerrar.getAccessibleContext().setAccessibleDescription("");

        JPanelMenuLogeo.setBorder(javax.swing.BorderFactory.createMatteBorder(5, 5, 5, 5, new java.awt.Color(0, 0, 0)));
        JPanelMenuLogeo.setAlignmentX(0.0F);
        JPanelMenuLogeo.setAlignmentY(0.0F);

        PanelLogeo.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(153, 153, 153), 6));
        PanelLogeo.setAlignmentX(0.0F);
        PanelLogeo.setAlignmentY(0.0F);
        PanelLogeo.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        PanelLogeoInterior.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Logeo", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Segoe UI", 1, 30))); // NOI18N

        TxtUsuarioMenu.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        TxtUsuarioMenu.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        TxtUsuarioMenu.setText("198");
        TxtUsuarioMenu.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        TxtUsuarioMenu.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));

        TxtPassMenu.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        TxtPassMenu.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        TxtPassMenu.setText("123456");
        TxtPassMenu.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));

        BtnEntrar.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        BtnEntrar.setText("ENTRAR");
        BtnEntrar.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        BtnEntrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnEntrarActionPerformed(evt);
            }
        });

        BtnSalir.setFont(new java.awt.Font("Segoe UI", 1, 30)); // NOI18N
        BtnSalir.setText("SALIR");
        BtnSalir.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 0, 0), 2, true));
        BtnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSalirActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout PanelLogeoInteriorLayout = new javax.swing.GroupLayout(PanelLogeoInterior);
        PanelLogeoInterior.setLayout(PanelLogeoInteriorLayout);
        PanelLogeoInteriorLayout.setHorizontalGroup(
            PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelLogeoInteriorLayout.createSequentialGroup()
                .addContainerGap(30, Short.MAX_VALUE)
                .addGroup(PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(TxtPassMenu, javax.swing.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE)
                    .addComponent(TxtUsuarioMenu))
                .addGap(37, 37, 37)
                .addGroup(PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(BtnEntrar, javax.swing.GroupLayout.PREFERRED_SIZE, 250, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(BtnSalir, javax.swing.GroupLayout.PREFERRED_SIZE, 250, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(31, Short.MAX_VALUE))
        );
        PanelLogeoInteriorLayout.setVerticalGroup(
            PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelLogeoInteriorLayout.createSequentialGroup()
                .addContainerGap(24, Short.MAX_VALUE)
                .addGroup(PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(BtnEntrar, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TxtUsuarioMenu, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(PanelLogeoInteriorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(BtnSalir, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(TxtPassMenu, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 23, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout PanelLogeoLayout = new javax.swing.GroupLayout(PanelLogeo);
        PanelLogeo.setLayout(PanelLogeoLayout);
        PanelLogeoLayout.setHorizontalGroup(
            PanelLogeoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PanelLogeoLayout.createSequentialGroup()
                .addContainerGap(50, Short.MAX_VALUE)
                .addComponent(PanelLogeoInterior, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(50, Short.MAX_VALUE))
        );
        PanelLogeoLayout.setVerticalGroup(
            PanelLogeoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, PanelLogeoLayout.createSequentialGroup()
                .addContainerGap(43, Short.MAX_VALUE)
                .addComponent(PanelLogeoInterior, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(44, Short.MAX_VALUE))
        );

        JPanelMenuLogeo.setLayer(PanelLogeo, javax.swing.JLayeredPane.MODAL_LAYER);

        javax.swing.GroupLayout JPanelMenuLogeoLayout = new javax.swing.GroupLayout(JPanelMenuLogeo);
        JPanelMenuLogeo.setLayout(JPanelMenuLogeoLayout);
        JPanelMenuLogeoLayout.setHorizontalGroup(
            JPanelMenuLogeoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelMenuLogeoLayout.createSequentialGroup()
                .addContainerGap(1124, Short.MAX_VALUE)
                .addComponent(PanelLogeo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(1125, Short.MAX_VALUE))
        );
        JPanelMenuLogeoLayout.setVerticalGroup(
            JPanelMenuLogeoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelMenuLogeoLayout.createSequentialGroup()
                .addContainerGap(701, Short.MAX_VALUE)
                .addComponent(PanelLogeo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(701, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelMenuLogeo)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(JPanelMenuApp))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelMenuLogeo)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(JPanelMenuApp))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void BtnCerrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnCerrarActionPerformed
        int seleccion = JOptionPane.showOptionDialog(
        this, // Componente padre
        "¿DESEA SALIR DEL PROGRAMA?", //Mensaje
        "SELECCIONE UNA OPCION", // Título
        JOptionPane.YES_NO_CANCEL_OPTION,
        JOptionPane.QUESTION_MESSAGE,
        null,    // null para icono por defecto.
        new Object[] { "SI", "NO"},    // null para YES, NO y CANCEL
        "SI");
        //PREGUNTA
            if (seleccion != -1){
                if((seleccion + 1)==1){
                   System.exit(0);
                }else{
          // PRESIONO NO
                }
        }
    }//GEN-LAST:event_BtnCerrarActionPerformed

    private void Btn1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn1ActionPerformed
       TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"1");
       TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn1ActionPerformed

    private void Btn2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn2ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"2");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn2ActionPerformed

    private void Btn3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn3ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"3");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn3ActionPerformed

    private void Btn4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn4ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"4");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn4ActionPerformed

    private void Btn5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn5ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"5");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn5ActionPerformed

    private void Btn6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn6ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"6");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn6ActionPerformed

    private void Btn7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn7ActionPerformed
       TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"7");
       TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn7ActionPerformed

    private void Btn8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn8ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"8");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn8ActionPerformed

    private void Btn9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn9ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"9");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn9ActionPerformed

    private void BtnKActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnKActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"k");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_BtnKActionPerformed

    private void Btn0ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Btn0ActionPerformed
        TxtRutFuncionario.setText(TxtRutFuncionario.getText()+"0");
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_Btn0ActionPerformed

    private void BtnBorrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnBorrarActionPerformed
        String cadena;
        cadena= TxtRutFuncionario.getText();
                
        if(cadena.length()>0){
            
            cadena = cadena.substring(0, cadena.length() - 1);
            TxtRutFuncionario.setText(cadena);
        }
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_BtnBorrarActionPerformed

    private void BtnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSalirActionPerformed
        int seleccion = JOptionPane.showOptionDialog(
            this, // Componente padre
              "¿DESEA SALIR DEL PROGRAMA?", //Mensaje
        "SELECCIONE UNA OPCION", // Título
            JOptionPane.YES_NO_CANCEL_OPTION,
            JOptionPane.QUESTION_MESSAGE,
            null,    // null para icono por defecto.
            new Object[] { "SI", "NO"},    // null para YES, NO y CANCEL
            "SI");
        //PREGUNTA
        if (seleccion != -1){
            if((seleccion + 1)==1){
                // PRESIONO SI
                System.exit(0);
            }else{
                // PRESIONO NO
            }
        }
    }//GEN-LAST:event_BtnSalirActionPerformed

    private void BtnEntrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnEntrarActionPerformed
        String usuario = TxtUsuarioMenu.getText();
        String clave = TxtPassMenu.getText();
        
        usuario = dao.getUser(clave);
        clave   = dao.getPass(usuario);
        
         if(TxtUsuarioMenu.getText().equals(usuario) && TxtPassMenu.getText().equals(clave)){             
            JPanelMenuApp.setVisible(true);
            JPanelMenuLogeo.setVisible(false);
            PanelLogeo.setVisible(false);
            TxtRutFuncionario.requestFocus();
        }else{
            JOptionPane.showMessageDialog(this, "INGRESE USUARIO Y CLAVE CORRECTA","ERROR DE AUTENTIFICACION",1,null);
            TxtUsuarioMenu.setText("");
            TxtPassMenu.setText("");
            TxtUsuarioMenu.requestFocus();
        }
    }//GEN-LAST:event_BtnEntrarActionPerformed
 
    private void BtnRegistrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnRegistrarActionPerformed
                                
        HiloTiket hiloTiket = new HiloTiket();
        
        rutBusquedaTxt = TxtRutFuncionario.getText();
         
         //que no sea null
        if(!rutBusquedaTxt.trim().equals("")){
            //que sea mayor a 7
             if(rutBusquedaTxt.trim().length() >=7){
                 
                //corta rut segun largo 
                if(rutBusquedaTxt.trim().length() <=  8){
                    buscandoRut = rutBusquedaTxt.substring(0,7);
                }else if(rutBusquedaTxt.trim().length() >=  8){
                    buscandoRut = rutBusquedaTxt.substring(0,8);
                }
                
                verificandoRut = dao.verificarRutFuncionario(buscandoRut);

                //que exista en la BD
                if(rutBusquedaTxt.equals(verificandoRut)){
                    
                    resutadoNombre = dao.getNombreFuncionario(buscandoRut);
                    resultadoTipo = dao.getTipoDeEntrada(buscandoRut);
                    tamañoTabla = dao.getHayRegistros(buscandoRut);
                    codigoFuncionario = dao.getCodigoFuncionario(buscandoRut);
                    digitoVerificador = dao.getDigitoVerificador(buscandoRut);
                   
                    System.out.println(tamañoTabla);

                    if(tamañoTabla == 0){
                        if(BtnE.isSelected()){
                             try {
                                TxtNombreFuncionario.setText(resutadoNombre);
                                TxtTipoFuncionario.setText("ENTRADA");
                                dao.registrarRegistros(codigoFuncionario, buscandoRut ,digitoVerificador, resutadoNombre, numModulo, "ENTRADA");
                                hiloTiket.run("Instituto Ingles", resutadoNombre, dao.getFechaActual(), LblHora.getText(), "INPUT");
                                cargarRegistros();
                            } catch (SQLException ex) {
                                Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            jopMensaje("ENTRADA REGISTRADA",1,"REGISTRADO");                             
                        }else{                          
                            jopMensaje("SU PRIMER REGISTRO DEBE SER ENTRADA",0,"ERROR");
                        }
                    }else 
//                        if(d.estadoDelay(BuscandoRut).equals("TRUE")){        
                            if(BtnE.isSelected() && (dao.getTipoDeEntrada(buscandoRut).equals("SALIDA"))) {
                                try {
                                    TxtNombreFuncionario.setText(resutadoNombre);
                                    TxtTipoFuncionario.setText("ENTRADA");
                                    dao.registrarRegistros(codigoFuncionario, buscandoRut ,digitoVerificador, resutadoNombre, numModulo, "ENTRADA");
                                    hiloTiket.run("Instituto Ingles", resutadoNombre, dao.getFechaActual(), LblHora.getText(), "INPUT");
                                    cargarRegistros();
                                } catch (SQLException ex) {
                                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                 jopMensaje("ENTRADA REGISTRADA",1,"REGISTRADO"); 
                            }else if(BtnS.isSelected() && (dao.getTipoDeEntrada(buscandoRut).equals("ENTRADA"))){
                                 try {
                                    TxtNombreFuncionario.setText(resutadoNombre);
                                    TxtTipoFuncionario.setText("SALIDA");
                                    dao.registrarRegistros(codigoFuncionario, buscandoRut ,digitoVerificador, resutadoNombre, numModulo, "SALIDA");
                                    hiloTiket.run("Instituto Ingles", resutadoNombre, dao.getFechaActual(), LblHora.getText(), "OUTPUT");
                                    cargarRegistros();
                                } catch (SQLException ex) {
                                    Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                 jopMensaje("ENTRADA REGISTRADA",1,"REGISTRADO"); 
                            }else if(BtnS.isSelected() && (dao.getTipoDeEntrada(buscandoRut).equals("SALIDA"))){
                                TxtNombreFuncionario.setText(resutadoNombre);
                                TxtTipoFuncionario.setText("SALIDA");
                                jopMensaje("SU ULTIMO REGISTRO FUE SALIDA, FAVOR DE MARCAR ENTRADA",0,"ERROR");
                            }else{
                                TxtNombreFuncionario.setText(resutadoNombre);
                                TxtTipoFuncionario.setText("ENTRADA");
                                jopMensaje("SU ULTIMO REGISTRO FUE ENTRADA, FAVOR DE MARCAR SALIDA",0,"ERROR");
                            }                          
//                        }else{
//                            jopMensaje("ESPERE UNOS SEGUNDOS PARA VOLVER A REGISTRAR",2,"ERROR");    
//                        }
                }else{       
                    jopMensaje("USUARIO NO REGISTRADO",0,"ERROR"); 
                }     
            }else{       
                jopMensaje("USUARIO NO REGISTRADO",0,"ERROR"); 
            }
        }else{
             jopMensaje("INGRESE DATOS",0,"ERROR");     
        }  
        
        TxtRutFuncionario.setText("");
        TxtNombreFuncionario.setText("");
        TxtRutFuncionario.requestFocus();
        TxtTipoFuncionario.setText("");
    }//GEN-LAST:event_BtnRegistrarActionPerformed

    private void BtnEActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnEActionPerformed
        TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_BtnEActionPerformed

    private void TxtRutFuncionarioKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TxtRutFuncionarioKeyPressed
    
    int key=evt.getKeyCode();
        if(key==KeyEvent.VK_ENTER)
        {     
            BtnRegistrar.doClick();                             
        }
    }//GEN-LAST:event_TxtRutFuncionarioKeyPressed

    private void BtnSActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSActionPerformed
         TxtRutFuncionario.requestFocus();
    }//GEN-LAST:event_BtnSActionPerformed

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Menu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Menu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Btn0;
    private javax.swing.JButton Btn1;
    private javax.swing.JButton Btn2;
    private javax.swing.JButton Btn3;
    private javax.swing.JButton Btn4;
    private javax.swing.JButton Btn5;
    private javax.swing.JButton Btn6;
    private javax.swing.JButton Btn7;
    private javax.swing.JButton Btn8;
    private javax.swing.JButton Btn9;
    private javax.swing.JButton BtnBorrar;
    private javax.swing.JButton BtnCerrar;
    private javax.swing.JRadioButton BtnE;
    private javax.swing.JButton BtnEntrar;
    private javax.swing.JButton BtnK;
    private javax.swing.JButton BtnRegistrar;
    private javax.swing.JRadioButton BtnS;
    private javax.swing.JButton BtnSalir;
    private javax.swing.ButtonGroup GrupoEntradaSalida;
    private javax.swing.JDesktopPane JPanelMenuApp;
    private javax.swing.JDesktopPane JPanelMenuLogeo;
    private javax.swing.JLabel LblHora;
    private javax.swing.JPanel PanelFuncionario;
    private javax.swing.JPanel PanelLogeo;
    private javax.swing.JPanel PanelLogeoInterior;
    private javax.swing.JPanel PanelPrincipal;
    private javax.swing.JPanel PanelRegistros;
    private javax.swing.JPanel PanelTecladoNumerico;
    private javax.swing.JTable Tabla;
    private javax.swing.JTextField TxtNombreFuncionario;
    private javax.swing.JPasswordField TxtPassMenu;
    private javax.swing.JTextField TxtRutFuncionario;
    private javax.swing.JTextField TxtTipoFuncionario;
    private javax.swing.JTextField TxtUsuarioMenu;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
