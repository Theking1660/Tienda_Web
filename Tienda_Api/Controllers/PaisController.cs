using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Pais")]
    public class PaisController : Controller
    {
        [HttpGet]
        public async Task<ActionResult<List<MPais>>> Get()
        {
            DPais pais = new DPais();
            var lista = await pais.Mostrar();
            return lista;
        }
    }
}
