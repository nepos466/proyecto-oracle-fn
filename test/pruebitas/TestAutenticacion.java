/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebitas;

import model.Autenticacion;
import org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import org.junit.Test;


public class TestAutenticacion {
    @Test
    public void probarAutenticacion()throws Exception{
    boolean valor = Autenticacion.autenticar("system","system");
       assertEquals(true,valor);
    }
    
    @Test
    public void probarSuma()throws Exception{
        assertEquals(5,2+3);
    }
}
