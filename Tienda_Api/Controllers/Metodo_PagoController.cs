using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Metodo")]
    public class Metodo_PagoController : Controller
    {
        [HttpGet]
        public async Task<ActionResult<List<MMetodo_Pago>>> Get()
        {
            DMetodo_Pago metodo_Pago = new DMetodo_Pago();
            var lista = await metodo_Pago.Mostrar();
            return lista;
        }
    }
}
