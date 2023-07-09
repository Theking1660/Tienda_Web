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
        public async Task<List<MCategoria>> Get()
        {
            DCategoria categoria = new DCategoria();
            var lista = await categoria.Mostrar();

            return lista;
        }
    }
}
