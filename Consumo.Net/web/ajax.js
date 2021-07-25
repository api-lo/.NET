consultaAjax();
var datos = [];
var arrays;
//autocompletad(false);
var aux=[];
function consultaAjax() {
    $.ajax({
        method: "GET",
        url: "https://localhost:44351/api/examenes",
        
        success: function (data) {            
            
            datos = data;
            llenarTabla();
            document.getElementById("nombreCheck").checked = true;
//            autocompletad(data);
        },
        error: function (data) {
            console.log(data.status);
        }

    });
}
function consultarPornombre()
{
    if (!document.getElementById("nombreCheck").checked)
    {
        $.ajax({
            method: "GET",
            url: "https://localhost/Php/Nombre.php/?name=" + document.getElementById("busqueda").value + "",
            success: function (data) {
                llenarTabla(data);                                               
            },
            error: function (data) {
                console.log(data.status);
            }

        });
    } else
    {
        $.ajax({
            method: "GET",
            url: "https://localhost/Php/DNI.PHP/?DNI=" + document.getElementById("busqueda").value + "",
            success: function (data) {
                llenarTabla(data);
                
                
            },
            error: function (data) {
                console.log(data.status);
            }

        });
    }
}
function autocompletad(bandera)
{
    var frutas = [];
    var Jdatos = JSON.parse(datos);
    console.log(Jdatos);
    if (bandera)
    {
        document.getElementById("dniCheck").checked = false;      
        for (var i = 0; i < Jdatos.items.length; i++)
        {
            frutas.push(Jdatos.items[i].DNI);
        }
        $("#busqueda").autocomplete({
            source: frutas
        });
    } else
    {
        document.getElementById("nombreCheck").checked = false;
      
        for (var i = 0; i < Jdatos.items.length; i++)
        {
            frutas.push(Jdatos.items[i].Nombre);
        }
        $("#busqueda").autocomplete({
            source: frutas
        });
    }

}
function eliminarDato(id){
    var json= {
        "ID":id
    };
    $.ajax({
        method: "DELETE",
        url: "https://localhost:44351/api/examenes",
        contentType: 'application/json',
        data: JSON.stringify(json),
        
        success: function (data) {            
            consultaAjax();
            document.getElementById("nombreCheck").checked = true;
//            autocompletad(data);
        },
        error: function (data) {
            console.log(data.status);
        }

    });
    
}
var Jdatos = [];
function llenarTabla()
{
    var cadena = "";
    var table = document.getElementById("autosTable");
    table.innerHTML = cadena;    
//    Jdatos=datosl;
    console.log(Jdatos);
//    for (var item in datos) {
//        cadena += "<tr>" +
//                "<td>" + item.Nombre + "</td>" +
//                "<td>" + item.Apellido + "</td>" +
//                "<td>" + item.fecha + "</td>" +
//                "<td>" + item.DNI + "</td>" +
//                "<td>" + item.Genero + "</td>" +
//                "<td>" + item.Leucocitos + "</td>" +
//                "<td>" + item.Hemoglobina + "</td>" +
//                "<td>" + item.Hematocrito + "</td>" +
//                "<td>" + item.Hematies + "</td>" +
//                "<td>" + item.VCM + "</td>" +
//                "<td>" + item.HCM + "</td>" +
//                "<td>" + item.CHCM + "</td>" +
//                "<td>" + item.RDWCV + "</td>" +
//                "<td>" + item.Linfocitos + "</td>" +
//                "<td>" + item.Monocitos + "</td>" +
//                "<td>" +item.Eosinofilos + "</td>" +
//                "<td>" + item.Basofilos + "</td>" +
//                "<td>" + item.VPM + "</td>" +
//                "<td  >" + item.Plaquetas + "</td>" +
//                "<td colspan=\"10\" >" + item.Diagnosticos + "</td>" +
//                "</tr> ";
//    }
    for (var i = 0; i < datos.length; i++)
    {
        cadena += "<tr>" +
                "<td>" + datos[i].nombre + "</td>" +
                "<td>" + datos[i].apellido + "</td>" +
                "<td>" + datos[i].fechaNacimiento + "</td>" +
                "<td>" + datos[i].dni + "</td>" +
                "<td>" + datos[i].genero + "</td>" +
                "<td>" + datos[i].leucocitos + "</td>" +
                "<td>" + datos[i].hemoglobina + "</td>" +
                "<td>" + datos[i].hematocrito + "</td>" +
                "<td>" + datos[i].hematies + "</td>" +
                "<td>" + datos[i].vcm + "</td>" +
                "<td>" + datos[i].hcm + "</td>" +
                "<td>" + datos[i].ghcm + "</td>" +
                "<td>" + datos[i].rdwcv + "</td>" +
                "<td>" + datos[i].linfocitos + "</td>" +
                "<td>" + datos[i].monocitos + "</td>" +
                "<td>" + datos[i].eosinofilos + "</td>" +
                "<td>" + datos[i].basofilos + "</td>" +
                "<td>" + datos[i].vpm + "</td>" +
                "<td  >" + datos[i].plaquetas + "</td>" +
                "<td colspan=\"10\" >" + datos[i].diagnosticos + "</td>" +
                "<td colspan=\"10\" > <button onclick=\"eliminarDato("+datos[i].id+")\">Eliminar</button>  </td>"+
                "</tr> ";
    }

    table.innerHTML = cadena;
}