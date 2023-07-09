﻿using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Cupones")]
    public class CuponesController : Controller
    {
        private DCupones cupones = new DCupones();
        [HttpGet] 
        public async Task<ActionResult<List<MCupones>>> Get()
        {
            var lista = await cupones.Mostrar();
            return lista;
        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MCupones>>> Get_id(int ID)
        {
            var lista = await cupones.Mostrar_id(ID);
            return lista;
        }


    }
}
