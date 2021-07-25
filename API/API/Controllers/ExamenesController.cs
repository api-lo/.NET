using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Dapper;
using System.Web.Http.Cors;

namespace API.Controllers
{
	
	[Route("api/[controller]")]
	
	[ApiController]
	public class ExamenesController : ControllerBase
	{
		private string _connection = "Server=localhost;Port=3306;Database=examenes;Uid=root;Pwd=121298;Pooling=False;";
		
		[HttpGet]
		public IActionResult Get()
		{
			{
				IEnumerable<Models.Examenes> lst = null;
				using (var db = new MySqlConnection(_connection))
				{
					var sql = "SELECT * FROM examenes";

					lst = db.Query<Models.Examenes>(sql);
				}

				return Ok(lst);
			}
		}
		[HttpPost]

		public IActionResult Insert(Models.Examenes model)
		{
			int result = 0;
			using (var db = new MySqlConnection(_connection))
			{
				var sql = "insert into examenes(Nombre,Apellido, FechaNacimiento,DNI, " +
					"Genero, Leucocitos, Hemoglobina, Hematocrito, Hematies, VCM, HCM, CHCM, " +
					"RDWCV, Linfocitos, Monocitos, Eosinofilos, Basofilos,VPM, Plaquetas, Diagnosticos)"+" " +
					"values(@Nombre, @Apellido, @FechaNacimiento,@DNI, @Genero, @Leucocitos, @Hemoglobina," +
					" @Hematocrito, @Hematies, @VCM, @HCM, @CHCM, @RDWCV, @Linfocitos, @Monocitos, " +
					"@Eosinofilos, @Basofilos,@VPM, @Plaquetas, @Diagnosticos)";
					result = db.Execute(sql, model);
			}
			return Ok(result);
		}

		[HttpPut]

		public IActionResult Edit(Models.Examenes model)
		{
			int result = 0;
			using (var db = new MySqlConnection(_connection))
			{
				var sql = "UPDATE examenes set Nombre=@Nombre,Apellido=@Apellido, " +
					"FechaNacimiento=@FechaNacimiento,DNI = @DNI, Genero = @Genero, Leucocitos = @Leucocitos, " +
					"Hemoglobina = @Hemoglobina, Hematocrito = @Hematocrito, Hematies = @Hematies, " +
					"VCM = @VCM, HCM = @HCM, " +
					"CHCM = @CHCM, RDWCV = @RDWCV, " + "Linfocitos = @Linfocitos, Monocitos = @Monocitos, " +
					"Eosinofilos = @Eosinofilos, Basofilos = @Basofilos, VPM = @VPM, Plaquetas = @Plaquetas, " +
					"Diagnosticos = @Diagnosticos"+" where ID = @ID";
					result = db.Execute(sql, model);
			}
			return Ok(result);
		}

	
	}
}