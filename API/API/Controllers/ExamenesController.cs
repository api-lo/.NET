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
				string sql = string.Format("UPDATE examenes set Nombre='{0}',Apellido='{1}', " +
					"FechaNacimiento='{2}',DNI = '{3}', Genero = '{4}', Leucocitos = '{5}', " +
					"Hemoglobina = '{6}', Hematocrito = '{7}', Hematies = '{8}', " + "VCM = '{9}', HCM = '{10}', " +
					"CHCM = '{11}', RDWCV = '{12}', " + "Linfocitos = '{13}', Monocitos = '{14}', " +
					"Eosinofilos = '{15}', Basofilos = '{16}', VPM = '{17}', Plaquetas = '{18}', " +
					"Diagnosticos = '{19}'" + " where ID = '{20}'", model.Nombre, model.Apellido,model.FechaNacimiento,
					model.DNI,model.Genero,model.Leucocitos,model.Hemoglobina,model.Hematocrito,model.Hematies,
					model.VCM,model.HCM,model.GHCM, model.RDWCV,model.Linfocitos,model.Monocitos,model.Eosinofilos,
					model.Basofilos,model.VPM,model.Plaquetas,model.Diagnosticos, model.ID);
					result = db.Execute(sql);
			}
			return Ok(result);
		}
		
		[HttpDelete]

		public IActionResult Delete(Models.Examenes model)
		{
			int result=0;
			using(var db= new MySqlConnection(_connection))
				{
				var sql="delete from examenes where ID=@ID";
				result = db.Execute(sql, model);						
				}
			return Ok(result);
		}
	
	}
}
