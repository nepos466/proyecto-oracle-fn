/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Nepo
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import model.Conexion;
import model.insertar;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Autenticacion;

/**
 *
 * @author Miriam
 */
public class ServeltGuardar extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       int id= Integer.parseInt(request.getParameter("id"));
       String nombre= request.getParameter("nombre");
       String empresa= request.getParameter("empresa");
       int edad= Integer.parseInt(request.getParameter("edad"));
       String telefono= request.getParameter("telefono");
       
       
          try{
       Conexion c=new Conexion();
        Connection con=c.conectarse("system","system");
        CallableStatement guarda=con.prepareCall("{call GUARDAR_PERSONA(?,?,?,?,?)}");  /// call y el nombre de tu procedimiento Y EL NUMERO DE PROCEDIMIENTOS QUE TENGAMOS
        
        guarda.setInt(1,id);
        guarda.setString(2,nombre);   ///tantos campos como se necesiten de nuestro proyecto de los my_ y respetrando su tipo de dato
        guarda.setString(3,empresa);
        guarda.setInt(4,edad);
        guarda.setString(5,telefono);
        
        
        guarda.execute();
       
        out.println("Se guardo la persona");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
        }
      }  

}
