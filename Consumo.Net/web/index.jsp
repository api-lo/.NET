<%-- 
    Document   : index
    Created on : 15-jul-2021, 4:41:04
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container">
        <nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Laboratorio</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="nav-link btn" >
                            Información
                        </button>
                        <!--<a  href="#">información</a>-->
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Examenes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <button class="dropdown-item" data-toggle="modal" data-target="#exampleModal">Registrar</button>
                            <button class="dropdown-item" data-toggle="modal" >Editar Diagnostico</button>
                            <a class="dropdown-item" href="#">Ver listado</a>
                            <div class="dropdown-divider">Grafica de examenes</div>                            
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link " href="#">Salir</a>
                    </li>
                </ul>

            </div>
        </nav>
        <div class="row">
            <div class="col-12">
            </div>
        </div>
        <div class="row">
            <div class="col-12" >
                <div class="row">
                    <div class="col-12">
                        <h2>Buscar resultados de examen</h2>                                       
                    </div>                    
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <input id="busqueda" placeholder="Escriba el nombre o cedula del paciente" type="text" class="form-control" >
                            </div>
                            <div class="col-2">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-check">
                                            <input id="nombreCheck" onclick="autocompletad(true)" class="form-check-input" type="radio" value="" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                DNI
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input id="dniCheck" onclick="autocompletad(false)" class="form-check-input" type="radio" value="" id="flexCheckChecked">
                                            <label class="form-check-label" for="flexCheckChecked">
                                                Nombre
                                            </label>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <input value="Reset" onclick="consultaAjax()" type="button" class="btn btn-block btn-danger btn-sm">
                            </div> 
                            <div class="col-2">
                                <input value="Buscar" onclick="consultarPornombre()" type="button" class="btn btn-block btn-info btn-sm">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <div class="row">
                    <div class="col-2">                        
                        <select class="form-control form-control-sm" autocomplete="true" name="Marca">                            
                            <option>Con diagnóstico</option>
                            <option>Sin diagnóstico</option>                           
                        </select>
                    </div>
                    <div class="col-2">                        
                        <input class="form-control form-control-sm" type="number"  placeholder="Año" max="2080" min="1950"> 
                    </div>
                    <div class="col-2">                        
                        <select class="form-control-sm form-control" name="mes">
                            <option value="1">Enero</option>
                            <option value="2">Febrero</option>
                            <option value="3">Marzo</option>
                            <option value="4">Abril</option>
                            <option value="5">Mayo</option>
                            <option value="6">Junio</option>
                            <option value="7">Julio</option>
                            <option value="8">Agosto</option>
                            <option value="9">Septiembre</option>
                            <option value="10">Octubre</option>
                            <option value="11">Noviembre</option>
                            <option value="12">Diciembre</option>
                        </select>
                    </div>
                    <div class="col-2">                        
                        <input class="form-control form-control-sm" type="number"  placeholder="Día" max="1" min="31"> 
                    </div>
                    <div class="col-2">                        
                        <select class="form-control form-control-sm" autocomplete="true" name="Motos">                            
                            <option>Masculino</option>
                            <option>Femenino</option>
                            <option>Sin especificar</option>                            
                        </select>
                    </div>
                    <div class="col-2">
                        <input value="Buscar" onclick="consultaAjax()" type="button" class="btn btn-block btn-success btn-sm">
                    </div>
                </div>
            </div>
        </div>        

        <div class="row mt-3">
            <div class="col-12">
                <h6>Listado de examenes:</h6>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-12" style="max-width: 100%; overflow-x: auto; max-height: 500px; overflow-y: auto">
                <table  class="table">
                    <thead>
                        <tr>                           
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Nacimiento</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Genero</th>
                            <th scope="col">Leucocitos</th>                            
                            <th scope="col">Hemoglobina</th>                           
                            <th scope="col">Hematocrito</th>
                            <th scope="col">Hematies</th>
                            <th scope="col">VCM</th>
                            <th scope="col">HCM</th>
                            <th scope="col">CHCM</th>
                            <th scope="col">RDWCV</th>                            
                            <th scope="col">Linfocitos</th>
                            <th scope="col">Monocitos</th>
                            <th scope="col">Eosinofilos</th>
                            <th scope="col">Basofilos</th>
                            <th scope="col">VPM</th>
                            <th scope="col">Paquetes</th>
                            <th >Diagnostico</th>
                            <th scope="col">Accion</th>
                            <th scope="col"></th>
                            

                        </tr>
                    </thead>
                    <tbody id="autosTable">

                    </tbody>
                </table>
            </div>
        </div>



        <!--Modales para ingresar datos-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Formulario ingreso</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  enctype="" >
                        <div class="modal-body">

                            <div class="alert alert-danger" hidden="True" role="alert">
                                Toda la información debe ser llenada
                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Nombre:</label>
                                    <input name="Nombre" type="text" class="form-control form-control-sm" id="inputEmail4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Apellido:</label>
                                    <input name="Apellido"  type="text" class="form-control form-control-sm" id="inputPassword4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Fecha nacimientos:</label>
                                    <input name="FechaNacimiento"  type="text" class="form-control form-control-sm" id="inputEmail4">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputPassword4">DNI:</label>
                                    <input name="DNI" type="number" class="form-control form-control-sm" id="inputPassword4" >
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">Genero:</label>
                                    <select  class="form-control form-control-sm" name="Genero">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                        <option>Sin especificar</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label  for="inputEmail4">Leucocitos:</label>
                                    <input name="Leucocitos" type="number" class="form-control form-control-sm" id="inputEmail4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Hemoglobina:</label>
                                    <input name="Hemoglobina" type="number" class="form-control form-control-sm" id="inputPassword4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Hematocrito:</label>
                                    <input name="Hematocrito" type="number" class="form-control form-control-sm" id="inputEmail4" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Hematies:</label>
                                    <input name="Hematies" type="number" class="form-control form-control-sm" id="inputPassword4" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="inputEmail4">V.C.M</label>
                                    <input name="VCM" type="number" class="form-control form-control-sm" id="inputEmail4">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">H.C.M</label>
                                    <input name="HCM" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">C.H.C.M</label>
                                    <input name="CHCM" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">R.D.W.C.V</label>
                                    <input name="RDWCV" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Linfocitos:</label>
                                    <input name="Linfocitos" type="number" class="form-control form-control-sm" id="inputEmail4">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Monocitos:</label>
                                    <input name="Monocitos" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Eosinofilos:</label>
                                    <input name="Eosinofilos" type="number" class="form-control form-control-sm" id="inputEmail4">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Basofilos:</label>
                                    <input name="Basofilos" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">V.P.M.</label>
                                    <input name="VPM" type="number" class="form-control form-control-sm" id="inputEmail4">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Plaquetas:</label>
                                    <input name="Plaquetas" type="number" class="form-control form-control-sm" id="inputPassword4">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputAddress2">Diagnósticos medico:</label>
                                <textarea name="Diagnosticos" class="form-control" >                                    
                                </textarea>                                
                            </div>                          

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary" value="Guardar">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        q
    </body>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="ajax.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>
