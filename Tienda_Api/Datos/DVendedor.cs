using System.Data.SqlClient;
using System.Data;
using Tienda_Api.App_Data;
using Tienda_Api.Models;
using Microsoft.AspNetCore.Routing.Template;

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
        public async Task Insertar(MVendedor parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertVendedor", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Perfil_id", parameters.Perfil_id);
                    cmd.Parameters.AddWithValue("@Producto_id", parameters.Producto_id);
                    cmd.Parameters.AddWithValue("@Precio", parameters.Precio);
                    cmd.Parameters.AddWithValue("Infomacion", parameters.Informacion);
                    await sql.OpenAsync();
                    await cmd.ExecuteReaderAsync();
                }
            }
        }
        public async Task<List<MVendedor>> Mostrar_id(int ID)
        {
            var lista = new List<MVendedor>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetVendedor_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Vendedor_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MVendedor vendedor = new MVendedor();
                            vendedor.Perfil_id = (int)item[1];
                            vendedor.Producto_id = (int)item[2];
                            vendedor.Precio = (decimal)item[3];
                            vendedor.Informacion = (string)item[4];
                            lista.Add(vendedor);
                        }
                    }
                }
            }
            return lista;
        }
        public async Task Eliminar(int ID)
        {
            using(var sql=new SqlConnection(CN))
            {
                using (var cmd=new SqlCommand("DeleteVendedor"))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Vendedor_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
