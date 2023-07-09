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
        [HttpGet]
        public async Task<ActionResult<List<MPerfil>>> Get()
        {
            var lista = await perfil.Mostrar();
            return lista;
        }
        [HttpPost]
        public async Task Post([FromBody] MPerfil parameters)
        {
            await perfil.Insertar(parameters);
        }

        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MPerfil>>> Get_id(int ID)
        {
            var lista = await perfil.Mostrar_id(ID);
            return lista;
        }
    }
}

