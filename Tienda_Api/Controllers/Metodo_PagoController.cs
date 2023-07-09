using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Metodo")]
    public class Metodo_PagoController : Controller
    {
        DMetodo_Pago metodo_Pago = new DMetodo_Pago();
        [HttpGet]
        public async Task<ActionResult<List<MMetodo_Pago>>> Get()
        {
           
            var lista = await metodo_Pago.Mostrar();
            return lista;
        }
       
    }
}
