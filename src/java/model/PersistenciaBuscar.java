/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Nepo
 */


import java.sql.*;   
import java.util.*;
import org.codehaus.jackson.map.ObjectMapper;
public class PersistenciaBuscar {
//crearemos un metod que se metera a la base de datos y sacar la informacion
    public static String buscarTodosLosLibros() throws Exception{    //BUSCARtODOS no lleva argumentos
        //primero: nos conectamos a oracle con la clase conxion
        
        Connection con=Conexion.conectarse("system","system");
        //segundo: generamos un statemenr de sql con la conexion anterior
             Statement st=con.createStatement();
             //3: llevamos a cabo la consulta select 
             ResultSet res=st.executeQuery("select * from persona");  //reset arreglo enmutado de java  estructura de  datos
             System.out.println("depues del select");
             int indice=0;
             ArrayList<persona> personas=new ArrayList<persona>();
             while(res.next()){   //del primero hasta el ultimo prod que vea SI PONGO SECUENCIA NO ENTRA AL WHILE
                                   Integer id=  res.getInt(1);     
                                   String nombre=res.getString(2);
                                   String empresa=res.getString(3);
                                   Integer edad=res.getInt(4);
                                   String telefono=res.getString(5);
                                  
                 ///llenamos el arrayList en cada vuelta
                      personas.add(new persona(id,nombre,empresa,edad,telefono));
                      
                      System.out.println("estoy en el array list despues del select");
             }
             
             //el paso final, transformamos a objeto json con jackson
             ObjectMapper maper=new ObjectMapper();   //mapeo a objeto jackson
             
             st.close();
             con.close();
             System.out.println("convirtiendo el json");
             return maper.writeValueAsString(personas);
             
    }
 
    
}

