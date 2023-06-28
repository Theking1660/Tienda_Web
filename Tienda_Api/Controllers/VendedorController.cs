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
        public async Task<ActionResult<List<MVendedor>>> Get()
        {
            var lista = await vendedor.Mostrar();
            return lista;
        }
    }
}
