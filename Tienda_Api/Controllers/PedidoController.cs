using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Pedido")]
    public class PedidoController : Controller
    {
        [HttpGet] 
        public async Task<ActionResult<List<MPedido>>> Get()
        {
            DPedido pedido = new DPedido();
            var lista = await pedido.Mostrar();
            return lista;
        }
    }
}
