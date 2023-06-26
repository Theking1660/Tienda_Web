using Microsoft.AspNetCore.Razor.TagHelpers;
using System.ComponentModel;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DProducto
    {
        public async Task<List<MProducto>> Mostrar()
        {
            var lista = new List<MProducto>();
            using (var sql = new SqlConnection(Conexion.CN))
            {
                using (var cmd = new SqlCommand("GetProducto", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MProducto producto = new MProducto();
                            producto.Producto_id = (int)item["Producto_id"];
                            producto.Categoria_id = (int)item["Categoria_id"];
                            producto.Producto = (string)item["Producto"];
                            producto.Precio = (decimal)item["Precio"];
                            producto.Descuento = (decimal)item["Descuento"];
                            lista.Add(producto);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
