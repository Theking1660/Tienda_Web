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
        private  DDireccion direccion = new DDireccion();
        [HttpGet]
        public async Task<ActionResult<List<MDireccion>>> Get()
        {
           
            var lista =  await direccion.Mostrar();
            return lista;
            
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MDireccion>>> Get_id(int ID)
        {
            var lista = await direccion.Mostrar_id(ID);
            return lista;
        }
    }
}
