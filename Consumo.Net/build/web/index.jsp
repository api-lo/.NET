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
            <a class="navbar-brand" href="#">Laboratorio todos mueren</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </nav>
        <div class="row">
            <div class="col-12">
            </div>
        </div>
        <div class="row">
            <div class="col-12" >
                <div class="row">
                    <div class="col-12">
                        <h2>Registro de examenes realizados</h2>                                       
                    </div>         
                        </div>
                    </div>
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


        <!--Modales para editar datos-->
        <!-- Modal -->
        <div class="modal fade" id="editarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Formulario para editar</h5>
                        
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
                                    <input name="Nombre" type="text" class="form-control form-control-sm" id="Nombre" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Apellido:</label>
                                    <input name="Apellido"  type="text" class="form-control form-control-sm" id="Apellido" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Fecha nacimientos:</label>
                                    <input name="FechaNacimiento"  type="text" class="form-control form-control-sm" id="FechaNacimiento">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputPassword4">DNI:</label>
                                    <input name="DNI" type="number" class="form-control form-control-sm" id="DNI" >
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">Genero:</label>
                                    <select  class="form-control form-control-sm" name="Genero" id="Genero">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                        <option>Sin especificar</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label  for="inputEmail4">Leucocitos:</label>
                                    <input name="Leucocitos" type="number" class="form-control form-control-sm" id="Leucocitos" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Hemoglobina:</label>
                                    <input name="Hemoglobina" type="number" class="form-control form-control-sm" id="Hemoglobina" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Hematocrito:</label>
                                    <input name="Hematocrito" type="number" class="form-control form-control-sm" id="Hematocrito" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Hematies:</label>
                                    <input name="Hematies" type="number" class="form-control form-control-sm" id="Hematies" >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="inputEmail4">V.C.M</label>
                                    <input name="VCM" type="number" class="form-control form-control-sm" id="VCM">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">H.C.M</label>
                                    <input name="HCM" type="number" class="form-control form-control-sm" id="HCM">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">C.H.C.M</label>
                                    <input name="CHCM" type="number" class="form-control form-control-sm" id="CHCM">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="inputPassword4">R.D.W.C.V</label>
                                    <input name="RDWCV" type="number" class="form-control form-control-sm" id="RDWCV">
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Linfocitos:</label>
                                    <input name="Linfocitos" type="number" class="form-control form-control-sm" id="Linfocitos">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Monocitos:</label>
                                    <input name="Monocitos" type="number" class="form-control form-control-sm" id="Monocitos">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Eosinofilos:</label>
                                    <input name="Eosinofilos" type="number" class="form-control form-control-sm" id="Eosinofilos">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Basofilos:</label>
                                    <input name="Basofilos" type="number" class="form-control form-control-sm" id="Basofilos">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">V.P.M.</label>
                                    <input name="VPM" type="number" class="form-control form-control-sm" id="VPM">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Plaquetas:</label>
                                    <input name="Plaquetas" type="number" class="form-control form-control-sm" id="Plaquetas">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputAddress2">Diagnósticos medico:</label>
                                <textarea name="Diagnosticos" class="form-control" id="Diagnosticos">                                    
                                </textarea>                                
                            </div>                          

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <input type="submit" class="btn btn-primary" value="Guardar" onclick="modificarDato()">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
    </body>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="ajax.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>
