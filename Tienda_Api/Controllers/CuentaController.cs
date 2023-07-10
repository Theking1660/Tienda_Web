using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Cuenta")]
    public class CuentaController : Controller
    {
        [HttpGet]
        public async Task<ActionResult<List<MCuenta>>> Get()
        {
            var cuenta = new DCuenta();
            var lista = await cuenta.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MCuenta>>> Get_id(int ID)
        {
            var cuenta = new DCuenta();
            var lista = await cuenta.Mostrar_id(ID);
            return lista;
        }
    }
}
