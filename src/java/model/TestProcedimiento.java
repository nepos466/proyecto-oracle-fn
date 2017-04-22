package model;

import java.sql.CallableStatement;
import java.sql.Connection;

/**
 *
 * @author campitos
 */
public class TestProcedimiento {
    public static void main(String args[])throws Exception{
        Conexion c=new Conexion();
        Connection con=c.conectarse("system","system");
        CallableStatement callate=con.prepareCall("{call guardar_persona(?,?,?,?)}");
        callate.registerOutParameter(1,java.sql.Types.INTEGER);
        callate.setString(2,"Ivan");
        callate.setString(3,"Nepomuceno");
        callate.setInt(4,23);
      
        callate.execute();
        int pk=callate.getInt(1);
        System.out.println("El id ingresado es:"+pk);
    }
    
}