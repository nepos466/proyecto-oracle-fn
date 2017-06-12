/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nepo
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Miriam
 */
public class insertar {
    public static String guardarLibro(Integer idpersona,String nombre, String empresa, Integer edad, String telefono) throws Exception{
       Conexion c=new Conexion();
        Connection con=c.conectarse("system","system");
        
     CallableStatement guarda=con.prepareCall("{call GUARDAR_PERSONA(?,?,?,?,?)}");
    
            
        guarda.setInt(1,idpersona);//registerOutParameter(1,java.sql.Types.INTEGER);
        guarda.setString(2,nombre);
        guarda.setString(3,empresa);
        guarda.setInt(4,edad);
        guarda.setString(5,telefono);
        
        
        guarda.execute();
        con.close();
        
        return "Se guardo la el libro con id:"+ nombre; 
    }
     public static void main(String[] args) throws Exception{
       //System.out.println(guardarLibro(Integer idLibro,Integer autor, Integer editorial, String nombre, Float precio));  
    }
    
    
}

