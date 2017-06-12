/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
/**
 *
 * @author Nepo
 */
public class persona {
    private Integer idpersona;
    private String nombre;
    private String empresa;
    private Integer edad;
    private String telefono;
    

public persona( Integer idpersona,String nombre, String empresa, Integer edad, String telefono) {
        this.idpersona = idpersona;
        this.nombre = nombre;
        this.empresa = empresa;
        this.edad = edad;
        this.telefono = telefono;
    }  

    public Integer getIdpersona() {
        return idpersona;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEmpresa() {
        return empresa;
    }

    public Integer getEdad() {
        return edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setIdpersona(Integer idpersona) {
        this.idpersona = idpersona;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    
}


