<%-- 
    Document   : Rutas
    Created on : 21/11/2016, 07:44:17 PM
    Author     : Miriam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery/jquery-2.2.3.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet"  href="mio.css"/>
        
        <!--ESTILO -->
          <link rel="stylesheet" href="plantilla/css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="plantilla/css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="plantilla/css/style.css" type="text/css" media="all">
		<script type="text/javascript" src="plantilla/js/jquery-1.6.js" ></script>
		<script type="text/javascript" src="plantilla/js/cufon-yui.js"></script>
		<script type="text/javascript" src="plantilla/js/cufon-replace.js"></script>  
		<script type="text/javascript" src="plantilla/js/Vegur_300.font.js"></script>
		<script type="text/javascript" src="plantilla/js/PT_Sans_700.font.js"></script>
		<script type="text/javascript" src="plantilla/js/PT_Sans_400.font.js"></script>
		<script type="text/javascript" src="plantilla/js/tms-0.3.js"></script>
		<script type="text/javascript" src="plantilla/js/tms_presets.js"></script>
		<script type="text/javascript" src="plantilla/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="plantilla/js/atooltip.jquery.js"></script>
        
        <!--DATATABLES
        <link rel="stylesheet" type="text/css" href="DataTables-1.10.12/media/css/jquery.dataTables.min.css"/>       
        <script type="text/javascript" language="javascript" src="DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
            -->
        <title>Admin Rutas</title>
        
        <script>

        $(document).ready(function (e) {
         var numero='';
        $("#selectNumCiudades").change(function () {
            numero =$("#selectNumCiudades").val();
            console.log('cuantas ciudades '+ numero); 
       
            });
            
            $("#guardaRuta").click(function(){
                console.log('GuardarRuta');
               
                $.ajax({
                        
                        url: 'ServletGuardaRuta',  //BUSCAR ESTE METODO 
                        type: 'post',
                        data: {
                            id_ruta:    $("#id_ruta").val(),
                            matricula:  $("#matricula").val(),
                            km:         $("#km").val(),
                            origen:     $("#origen").val(),
                            destino:    $("#destino").val(),
                            numCiudades: numero    
                        },
                        
                      /*  if($("#id_ruta").val()==''){
                            alert('Ingresa el id de ruta');
                        }else if($("#matricula").val()==''{
                          alert('ingresa la matricula');  
                        }else if($("#origen").val()==''){
                            alert('ingresa el origen');
                        }else if( $("#destino").val()==''){
                            alert('ingresa el destino');
                        }else{*/
                            success: function (datos) {
                                $("#resultado").html(datos);
                                alert(datos);
                        
                            },
                        
                        failure: function () {
                            alert("algo muy malo paso");
                        }

                    });
            });
            $("#buscaRutas").click(function(){
                console.log('Buscar rutas');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        dataType: "json",  //va a recibir un formato json
                        url: "ServletBuscarRutas",
                        success: function (datos) {  //datos ahi se deposita todo el json 
                            alert(datos);
                            $("#mis-rutas").html("");   //length dice cuantos elemntos tiene
                            $.each(datos, function (key, val) {
                              $("#mis-rutas").append("<tr class='info'>")
                              $("#mis-rutas").append("<td>" + val.id_ruta+ "</td>"+
                                                     "<td>"+ val.matricula + "</td>"+
                                                     "<td>" +val.km + "</td>"+
                                                     "<td>" +val.origen + "</td>"+
                                                     "<td>" +val.destino + "</td>"+
                                                     "<td>" +val.numCiudades + "</td>"
                                                     )
                              $("#mis-rutas").append("</tr>")
                            });
                            
                            
                        }
                    });
                });
                
                $("#accionAct").click(function(){
                    console.log('actualiza la ruta');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletActualizarRutas",
                        data: {
                            idRuta  : $("#idRuta").val(),
                            KMAct   : $("#KMAct").val()
                        },
                        success: function (datos) {
                            $("#resultado").html(datos);
                            alert(datos);
                        },
                        failure: function () {
                            alert("algo muy malo paso");
                        }
                    });
                });
                
                $("#accionElim").click(function(){
                    console.log('elimina la ruta');
                    $.ajax({   //para que se conecte a un servicio asincronicamente
                        type: "post",  //va a recibir un formato json
                        url: "ServletEliminarRutas",
                        data: {
                            idRutaElim: $("#idRutaElim").val()
                        },
                        success: function (datos) {
                            $("#resultado").html(datos);
                            alert(datos);
                        },
                        failure: function () {
                            alert("algo muy malo paso");
                        }
                    });
                });
                
                /*
                $('#DTtable').DataTable({
                    "scrollY":        "200px",
                    "scrollCollapse": true,
                    "paging":         false
                    
                });
                */
  
     });
        </script>
            
        
    </head>
    <body>
   <!--header -->
			<header>
				<div class="wrapper">
					<h1><a href="index.html" id="logo">Administracion de Autobuses</a></h1>
				</div>
				<nav>
					<ul id="menu">
                                            <li ><a href="index.html"><span>Principal</span></a></li>
                                            <li class="active"><a href="Rutas.jsp"><span>Rutas</span></a></li>
                                            <li><a href="Ciudades.jsp"><span>Ciudades</span></a></li>
                                            <li><a href="Autobuses.jsp"><span>Autobuses</span></a></li>
                                           <li><a href="Conductores.jsp"><span>Condutores</span></a></li>
					</ul>
				</nav>
			</header>
<!--header end-->
        
        
        
       
        <div class="row">
            <div class="col-xs-6 col-sm-4"></div>
            <div class="col-xs-6 col-sm-4"></div>
            <div class="clearfix visible-xs-block"></div>
            <div class="col-xs-6 col-sm-4"><p class="text-right"><img src="imgs/ruta.jpg"></p> </div>
        </div>
     
        
    
        <div class="col-md-offset-1">
                    <button type="button" id="actualizarRuta" class="btn btn-warning" data-toggle="modal" data-target="#myModalAct" >Actualizar</button>
                    <button type="button" id="eliminarRuta" class="btn btn-danger" data-toggle="modal" data-target="#myModalElim">Eliminar</button>
        </div>
          
        <br>
            <div class="col-md-offset-1">
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">id ruta:</label>
                <input type="text"  id="id_ruta" class="form-control"  >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Matricula Autobus Asig:</label>
                <input type="text" id="matricula" class="form-control"  >
                </div>
                
                <div class="col-md-2">    
                <label for="exampleInputEmail1">Km Recorridos:</label>
                <input type="text" id="km" class="form-control"><label>km</label>
                </div>
            
                <div class="col-md-2"> 
                    <label for="exampleInputEmail1">Origen </label>
                    <select id="origen" class="form-control">
                        <option value="">--Seleccione Opción--</option>
                        <option>Aguascalientes-AGS</option>
                        <option>Ensenada-BC.</option>
                        <option>Mexicali-BC.</option>
                        <option>Tijuana-BC.</option>
                        <option>La Paz-BCS.</option>
                        <option>Los Cabos-BCS.</option>
                        <option>Campeche-CAMP.</option>
                        <option>Ciudad del Carmen-CAMP.</option>
                        <option>Saltillo-COAH.</option>
                        <option>Tecomán-COL.</option>
                        <option>Manzanillo-COL.</option>
                        <option>Tuxtla Gutiérrez-CHIAP.</option>
                        <option>Chihuahua-CHICH.</option>
                        <option>Juárez -CHIH.</option>
                        <option>Valle de México-CDMX.</option>
                        <option>Dgo-DGO.</option>
                        <option>Celaya-GTO.</option>
                        <option>Guanajuato-GTO.</option>
                        <option>Irapuato-GTO.</option>
                        <option>León-GTO.</option>
                        <option>Acapulco-GRO.</option>
                        <option>Chilpancingo -GRO.</option>
                        <option>Tula-HGO.</option>
                        <option>Tulancingo-HGO.</option>
                        <option>Pachuca-HGO.</option>
                        <option>Guadalajara-JAL.</option>
                        <option>Puerto Vallarta -JAL.</option>
                        <option>Toluca-MEX.</option>
                        <option>Morelia-MICH.</option>
                        <option>Cuernavaca-MOR.</option>
                        <option>Tepic-NAY</option>
                        <option>Monterrey-N.L</option>
                        <option> Oaxaca -OAX</option>

                    </select>
                
                </div>
                
                <div class="col-md-2"> 
                      <label for="exampleInputEmail1">Destino </label>
                    <select id="destino" class="form-control">
                        <option value="">--Seleccionar--</option>
                        <option>Aguascalientes-AGS</option>
                        <option>Ensenada-BC.</option>
                        <option>Mexicali-BC.</option>
                        <option>Tijuana-BC.</option>
                        <option>La Paz-BCS.</option>
                        <option>Los Cabos-BCS.</option>
                        <option>Campeche-CAMP.</option>
                        <option>Ciudad del Carmen-CAMP.</option>
                        <option>Saltillo-COAH.</option>
                        <option>Tecomán-COL.</option>
                        <option>Manzanillo-COL.</option>
                        <option>Tuxtla Gutiérrez-CHIAP.</option>
                        <option>Chihuahua-CHICH.</option>
                        <option>Juárez -CHIH.</option>
                        <option>Valle de México-CDMX.</option>
                        <option>Dgo-DGO.</option>
                        <option>Celaya-GTO.</option>
                        <option>Guanajuato-GTO.</option>
                        <option>Irapuato-GTO.</option>
                        <option>León-GTO.</option>
                        <option>Acapulco-GRO.</option>
                        <option>Chilpancingo -GRO.</option>
                        <option>Tula-HGO.</option>
                        <option>Tulancingo-HGO.</option>
                        <option>Pachuca-HGO.</option>
                        <option>Guadalajara-JAL.</option>
                        <option>Puerto Vallarta -JAL.</option>
                        <option>Toluca-MEX.</option>
                        <option>Morelia-MICH.</option>
                        <option>Cuernavaca-MOR.</option>
                        <option>Tepic-NAY</option>
                        <option>Monterrey-N.L</option>
                        <option> Oaxaca -OAX</option>

                    </select>
                
                </div>
                
             </div>
        <div class="col-md-2"></div>
        
        <div class="col-md-offset-0"> 
            <br>
            <div class="col-md-1">
                   <label>Num.Ciudades</label>
             
            
                <select id="selectNumCiudades" class="form-control">
                    <option value="">---</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        </div>
        <br><br><br><br><br>
        <div class="col-md-10 col-md-offset-1 "> 
            <div  class="col-md-12">
            <center>  <input type="button" id="guardaRuta" o class="btn btn-primary btn-lg"  value="Guardar"/>
            
            <button id="buscaRutas" class="btn btn-primary btn-lg" >Buscar</button></center>
            </div>
            
        <div id="resultado"></div>
            <br><br><br><br>
         <table class="table" id="DTtable">
            <thead>
                <tr class="info">
                    <th>Id Ruta</th>
                    <th>Matricula Bus</th>
                    <th>KM  </th>
                    <th>Origen </th>
                    <th>Destino </th>
                    <th>Ciudades </th>
                </tr>
            </thead>
            <tbody id="mis-rutas">
                
            </tbody>
        </table>
            
            
        </div>
        

        
        
        
  <!--MODALS-->

  <!-- Modal actualizar-->
<div class="modal fade" id="myModalAct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><center><label>Actualizar KM Ruta</label></center>
      </div>
      <div class="modal-body" id="modalBodyAct">
          <label>Id Ruta: </label><input type="text" id="idRuta" class="form-control" placeholder="id ruta">
          <label>Actualizar KM:  </label><input type="text" id="KMAct" class="form-control" placeholder="km">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="accionAct" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 

    <!-- Modal eliminar-->
<div class="modal fade" id="myModalElim" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header"><label><center>Eliminar ruta</center></label>
      </div>
      <div class="modal-body" id="modalBodyElim">
          <label>Id Ruta :    </label><input type="text" id="idRutaElim" class="form-control" placeholder="id ruta ">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" type="button" id="accionElim" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 

  
  
   
    </body>
</html>
