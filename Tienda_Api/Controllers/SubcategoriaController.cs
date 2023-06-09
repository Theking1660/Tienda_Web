﻿using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Subcategoria")]
    public class SubcategoriaController : Controller
    {
      
        [HttpGet]
        public async Task<ActionResult<List<MSubcategoria>>> Get()
        {
            var subcategoria = new DSubcategoria();
            var lista = await subcategoria.Mostrar();
            return lista;
        }

        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MSubcategoria>>> Get_id(int ID)
        {
            var subcategoria = new DSubcategoria();
            var lista = await subcategoria.Mostrar_id(ID);
            return lista;
        }
    }
}
