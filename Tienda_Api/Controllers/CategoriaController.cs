using Microsoft.AspNetCore.Mvc;
using System.ComponentModel;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Categoria")]
    public class CategoriaController : Controller
    {
        DCategoria categoria = new DCategoria();
        [HttpGet]
        public async Task<ActionResult<List<MCategoria>>> Get()
        {

            var lista = await categoria.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MCategoria>>> Get_id(int ID)
        {
            var lista = await categoria.Mostrar_id(ID);
            return lista;
        }
    }
}
