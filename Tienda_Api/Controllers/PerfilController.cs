using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Perfil")]
    public class PerfilController : Controller
    {
        private DPerfil perfil = new DPerfil();
        public async Task<ActionResult<List<MPerfil>>> Get()
        {
            var lista = await perfil.Mostrar();
            return lista;
        }
    }
}
