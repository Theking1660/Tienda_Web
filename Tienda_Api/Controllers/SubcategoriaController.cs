using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Subcategoria")]
    public class SubcategoriaController : Controller
    {
        [HttpGet]
        public async Task<List<MSubcategoria>> Get()
        {
            DSubcategoria subcategoria = new DSubcategoria();
            var lista = await subcategoria.Mostrar();
            return lista;
        }
    }
}
