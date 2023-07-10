using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Producto")]
    public class ProductoController : Controller
    {
        [HttpGet]
        public async Task<ActionResult<List<MProducto>>> Get()
        {
            var producto = new DProducto();
            var lista = await producto.Mostrar();
            return lista;
        }

        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MProducto>>> Get_id(int ID)
        {
            var producto = new DProducto();
            var lista = await producto.Mostrar_id(ID);
            return lista;
        }
        [HttpGet("{ID}/{Tipo}")]
        public async Task<ActionResult<List<MProducto>>> Get_Ca_Pr(int ID, bool Tipo)
        {
            var producto = new DProducto();
            var lista = await producto.Producto_Categoria(ID, Tipo);
            return lista;
        }
    }
}
