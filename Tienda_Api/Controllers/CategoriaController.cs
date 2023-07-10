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
       
        [HttpGet]
        public async Task<ActionResult<List<MCategoria>>> Get()
        {
            var categoria = new DCategoria();
            var lista = await categoria.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MCategoria>>> Get_id(int ID)
        {
            var categoria = new DCategoria();
            var lista = await categoria.Mostrar_id(ID);
            return lista;
        }

    }
}
