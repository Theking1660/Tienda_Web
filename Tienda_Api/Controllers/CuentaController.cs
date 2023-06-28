using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Cuenta")]
    public class CuentaController : Controller
    {
        private DCuenta cuenta = new DCuenta();
        public async Task<ActionResult<List<MCuenta>>> get()
        {
            var lista = await cuenta.Mostrar();
            return lista;
        }
    }
}
