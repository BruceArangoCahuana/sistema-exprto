/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Vista;
import org.jpl7.Query;
/**
 *
 * @author edgar
 */
public class interfaz extends javax.swing.JFrame {

    /**
     * Creates new form interfaz
     */
    public interfaz() {
        initComponents();
        this.setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        label_diagnostico = new javax.swing.JLabel();
        btn_enviar = new javax.swing.JToggleButton();
        label_pregunta = new javax.swing.JLabel();
        btn_salir = new javax.swing.JButton();
        jSeparator2 = new javax.swing.JSeparator();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 22)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(132, 37, 220));
        jLabel1.setText("Sistema Experto - Covid-19");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 11, 342, -1));

        label_diagnostico.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        label_diagnostico.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        getContentPane().add(label_diagnostico, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 220, 304, 29));

        btn_enviar.setBackground(new java.awt.Color(0, 0, 0));
        btn_enviar.setFont(new java.awt.Font("Yu Gothic Medium", 1, 14)); // NOI18N
        btn_enviar.setForeground(new java.awt.Color(255, 255, 255));
        btn_enviar.setText("Comenzar");
        btn_enviar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_enviarActionPerformed(evt);
            }
        });
        getContentPane().add(btn_enviar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 340, -1));

        label_pregunta.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        label_pregunta.setForeground(new java.awt.Color(255, 0, 0));
        label_pregunta.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        getContentPane().add(label_pregunta, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 80, 304, 29));

        btn_salir.setBackground(new java.awt.Color(0, 0, 0));
        btn_salir.setFont(new java.awt.Font("Segoe UI Historic", 1, 14)); // NOI18N
        btn_salir.setForeground(new java.awt.Color(255, 255, 255));
        btn_salir.setText("Salir");
        btn_salir.setBorder(new javax.swing.border.MatteBorder(null));
        btn_salir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_salirActionPerformed(evt);
            }
        });
        getContentPane().add(btn_salir, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 130, 100, 30));
        getContentPane().add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 350, 10));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btn_enviarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_enviarActionPerformed
        // TODO add your handling code here:
        String conexion = "consult('diagnostico.pl')";
        Query objConsulta = new Query (conexion);
        
        if (objConsulta.hasSolution()){
            System.out.println(conexion + "" + (objConsulta.hasMoreSolutions() ? "ACEPTADO" : "FALLADO"));
            String predicado = "start.";
            Query a = new Query(predicado);
            String diagnostico = a.oneSolution().get("Paciente")+", usted probablementen tenga "+a.oneSolution().get("Enfermedad");
            label_diagnostico.setText(diagnostico);
            /*String rpta = txt_respuesta.getText();
            String pregunta = label_pregunta.getText();*/
            
        }
    }//GEN-LAST:event_btn_enviarActionPerformed

    private void btn_salirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_salirActionPerformed
        // TODO add your handling code here:
        System.exit(0);
    }//GEN-LAST:event_btn_salirActionPerformed

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new interfaz().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton btn_enviar;
    private javax.swing.JButton btn_salir;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JLabel label_diagnostico;
    private javax.swing.JLabel label_pregunta;
    // End of variables declaration//GEN-END:variables
}
