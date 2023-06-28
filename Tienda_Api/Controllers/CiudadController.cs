using Microsoft.AspNetCore.Mvc;
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
    }
}
