using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Tipo_Perfil")]
    public class Tipo_PerfilController : Controller
    {
        [HttpGet]
        public async Task<ActionResult<List<MTipo_Perfil>>> Get()
        {
            DTipo_Perfil tipo_Perfil = new DTipo_Perfil();
            var lista = await  tipo_Perfil.Mostrar();
            return lista;
        }
    }
}
