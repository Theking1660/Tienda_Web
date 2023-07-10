using Microsoft.AspNetCore.Mvc;
using System.Linq.Expressions;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Direccion")]
    public class DireccionController : Controller
    {
       
        [HttpGet]
        public async Task<ActionResult<List<MDireccion>>> Get()
        {
            var direccion = new DDireccion();
            var lista =  await direccion.Mostrar();
            return lista;
            
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MDireccion>>> Get_id(int ID)
        {
            var direccion = new DDireccion();
            var lista = await direccion.Mostrar_id(ID);
            return lista;
        }
    }
}
