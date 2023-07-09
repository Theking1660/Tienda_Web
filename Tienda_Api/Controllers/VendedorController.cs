using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Vendedor")]
    public class VendedorController : Controller
    {
        private DVendedor vendedor = new DVendedor();

        [HttpGet]
        public async Task<ActionResult<List<MVendedor>>> Get()
        {
            var lista = await vendedor.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MVendedor>>> Get_id(int ID)
        {
            var lista = await vendedor.Mostrar_id(ID);
            return lista;
        }
    }
}
