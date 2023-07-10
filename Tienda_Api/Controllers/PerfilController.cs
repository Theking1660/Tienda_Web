using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Perfil")]
    public class PerfilController : Controller
    {
        
        [HttpGet]
        public async Task<ActionResult<List<MPerfil>>> Get()
        {
            var perfil = new DPerfil();
            var lista = await perfil.Mostrar();
            return lista;
        }
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] MPerfil parameters)
        {
            var perfil = new DPerfil();
            await perfil.Insertar(parameters);
            return Ok();
        }

        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MPerfil>>> Get_id(int ID)
        {
            var perfil = new DPerfil();
            var lista = await perfil.Mostrar_id(ID);
            return lista;
        }
    }
}

