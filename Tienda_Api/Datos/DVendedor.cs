using System.Data.SqlClient;
using System.Data;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DVendedor
    {
        private string CN = Conexion.CN;
        public async Task<List<MVendedor>> Mostrar()
        {
            var lista = new List<MVendedor>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetVendedor", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MVendedor vendedor = new MVendedor();
                            vendedor.Vendedor_id = (int)item["Vendedor_id"];
                            vendedor.Perfil_id = (int)item["Perfil_id"];
                            vendedor.Producto_id = (int)item["Producto_id"];
                            vendedor.Precio = (decimal)item["Precio"];
                            vendedor.Informacion = (string)item["Informacion"];
                            lista.Add(vendedor);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
