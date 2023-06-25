using Tienda_Api.Models;
using System.Data.SqlClient;
using System.Data;
using Tienda_Api.App_Data;

namespace Tienda_Api.Datos
{
    public class DSubcategoria
    {
        private string CN = Conexion.CN;
        public async Task<List<MSubcategoria>> Mostrar()
        {
            var lista = new List<MSubcategoria>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("Select * from Tienda.Subcategoria", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.Text;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            var subcatoriga = new MSubcategoria();
                            subcatoriga.Subcategoria_id = (int)item[0];
                            subcatoriga.Categoria_id = (int)item[1];
                            subcatoriga.Subcategoria = (string)item[2];
                            lista.Add(subcatoriga);
                        }
                    }
                }
            }
            return lista;

        }

        public async Task Insertar(MSubcategoria parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InseetSubcategoria", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Categoria_id", parameters.Categoria_id);
                    cmd.Parameters.AddWithValue("@Subcategoria", parameters.Subcategoria);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }


    }
}
