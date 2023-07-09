using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Ciudad")]
    public class CiudadController : Controller
    {
        private DCiudad ciudad = new DCiudad();
        [HttpGet]
        public async Task<ActionResult<List<MCiudad>>> Get()
        {
            var lista = await ciudad.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MCiudad>>> Get_id(int ID)
        {
            var lista = await ciudad.Mostrar_id(ID);
            return lista;
        }

    }
}
