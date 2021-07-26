consultaAjax();
var datos = [];
var arrays;
//autocompletad(false);
var aux = [];
function consultaAjax() {
    $.ajax({
        method: "GET",
        url: "https://localhost:44351/api/examenes",

        success: function (data) {

            datos = data;
            llenarTabla();
        
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
function eliminarDato(id) {
    var json = {
        "ID": id
    };
    $.ajax({
        method: "DELETE",
        url: "https://localhost:44351/api/examenes",
        contentType: 'application/json',
        data: JSON.stringify(json),

        success: function (data) {
            consultaAjax();
            //document.getElementById("nombreCheck").checked = true;
//            autocompletad(data);
        },
        error: function (data) {
            console.log(data.status);
        }

    });

}
var id;
function editarDato(Id, Nombre, Apellido, FechaNacimiento, DNI, Genero,
        Leucocitos, Hemoglobina, Hematocrito, Hematies, VCM, HCM, CHCM, RDWCV,
        Linfocitos, Monocitos, Eosinofilos, Basofilos, VPM, Plaquetas, Diagnosticos) {
    id = Id;
    document.getElementById("Nombre").value = Nombre;
    document.getElementById("Apellido").value = Apellido;
    document.getElementById("FechaNacimiento").value = FechaNacimiento;
    document.getElementById("DNI").value = DNI;
    document.getElementById("Genero").value = Genero;
    document.getElementById("Leucocitos").value = Leucocitos;
    document.getElementById("Hemoglobina").value = Hemoglobina;
    document.getElementById("Hematocrito").value = Hematocrito;
    document.getElementById("Hematies").value = Hematies;
    document.getElementById("VCM").value = VCM;
    document.getElementById("HCM").value = HCM;
    document.getElementById("CHCM").value = CHCM;
    document.getElementById("RDWCV").value = RDWCV;
    document.getElementById("Linfocitos").value = Linfocitos;
    document.getElementById("Monocitos").value = Monocitos;
    document.getElementById("Eosinofilos").value = Eosinofilos;
    document.getElementById("Basofilos").value = Basofilos;
    document.getElementById("VPM").value = VPM;
    document.getElementById("Plaquetas").value = Plaquetas;
    document.getElementById("Diagnosticos").value = Diagnosticos;

}


function modificarDato() {
    var json = {
        "ID": id,
        "Nombre": document.getElementById("Nombre").value,
        "Apellido": document.getElementById("Apellido").value,
        "FechaNacimiento": document.getElementById("FechaNacimiento").value,
        "DNI": document.getElementById("DNI").value,
        "Genero": document.getElementById("Genero").value,
        "Leucocitos": document.getElementById("Leucocitos").value,
        "Hemoglobina": document.getElementById("Hemoglobina").value,
        "Hematocrito": document.getElementById("Hematocrito").value,
        "Hematies": document.getElementById("Hematies").value,
        "VCM": document.getElementById("VCM").value,
        "HCM": document.getElementById("HCM").value,
        "CHCM": document.getElementById("CHCM").value,
        "RDWCV": document.getElementById("RDWCV").value,
        "Linfocitos": document.getElementById("Linfocitos").value,
        "Monocitos": document.getElementById("Monocitos").value,
        "Eosinofilos": document.getElementById("Eosinofilos").value,
        "Basofilos": document.getElementById("Basofilos").value,
        "VPM": document.getElementById("VPM").value,
        "Plaquetas": document.getElementById("Plaquetas").value,
        "Diagnosticos": document.getElementById("Diagnosticos").value

    };
    $.ajax({
        method: "PUT",
        url: "https://localhost:44351/api/examenes",
        contentType: 'application/json',
        data: JSON.stringify(json),

        success: function (data) {
            consultaAjax();
            //document.getElementById("nombreCheck").checked = true;
            alert("Se guardó");
//            autocompletad(data);
        },
        error: function (data) {
                        alert("No Se guardó");
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
    console.log(Jdatos);
    let strJson;
    for (var i = 0; i < datos.length; i++)
    {
        strJson = JSON.stringify(datos[i]);
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
                "<td >" + datos[i].diagnosticos + "</td>" +
                "<td> <button onclick=\"eliminarDato(" + datos[i].id + ")\">Eliminar</button> " +
                "<button data-toggle=\"modal\" data-target=\"#editarModal\" onclick=\"editarDato(" + datos[i].id + ", '" +
                datos[i].nombre + "', '" + datos[i].apellido + "', '" + datos[i].fechaNacimiento + "', '" +
                datos[i].dni + "', '" + datos[i].genero + "', '" + datos[i].leucocitos + "', '" +
                datos[i].hemoglobina + "', '" + datos[i].hematocrito + "', '" +
                datos[i].hematies + "', '" + datos[i].vcm + "', '" + datos[i].hcm + "', '" +
                datos[i].ghcm + "', '" + datos[i].rdwcv + "', '" + datos[i].linfocitos + "', '" +
                datos[i].monocitos + "', '" + datos[i].eosinofilos + "', '" +
                datos[i].basofilos + "', '" + datos[i].vpm + "', '" + datos[i].plaquetas + "', '" +
                datos[i].diagnosticos + "')\">Modificar</button>  </td>" +
                "</tr> ";
    }

    table.innerHTML = cadena;
}