using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Producto")]
    public class ProductoController : Controller
    {
        private DProducto producto = new DProducto();
        public async Task<ActionResult<List<MProducto>>> get()
        {
            var lista = await producto.Mostrar();
            return lista;
        }

        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MProducto>>> Get_id(int ID)
        {
            var lista = await producto.Mostrar_id(ID);
            return lista;
        }

    }
}
