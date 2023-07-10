using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Vendedor")]
    public class VendedorController : Controller
    {
        

        [HttpGet]
        public async Task<ActionResult<List<MVendedor>>> Get()
        {
            var vendedor = new DVendedor();
        var lista = await vendedor.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MVendedor>>> Get_id(int ID)
        {
            var vendedor = new DVendedor();
            var lista = await vendedor.Mostrar_id(ID);
            return lista;
        }
    }
}
