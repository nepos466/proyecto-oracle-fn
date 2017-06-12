package controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Autenticacion;

@WebServlet (name = "ServletAutenticar", urlPatterns = {"/Ingresar"})
public class ServletAutenticar extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        //Creamos el modelo
        
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        
        boolean autenticado = Autenticacion.autenticar(login, password);
        if(autenticado){
            RequestDispatcher despachador = request.getRequestDispatcher("/Bienvenido.html");
            despachador.forward(request, response);
        }else{
            RequestDispatcher despachador = request.getRequestDispatcher("/Error.html");
            despachador.forward(request, response);
        }
        }
    }   