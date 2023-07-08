using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using Tienda_Api.App_Data;
using Tienda_Api.Models;
using System.Data;

namespace Tienda_Api.Datos
{
    public class DCategoria
    {
        private string CN = Conexion.CN;
        public async Task<List<MCategoria>> Mostrar()
        {
            var lista = new List<MCategoria>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetCategoria", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCategoria categoria = new MCategoria();
                            categoria.Categoria_id = (int)item[0];
                            categoria.Categoria = (string)item[1];
                            lista.Add(categoria);

                        }
                    }
                }
            }
            return lista;
        }
        public async Task Insertar(MCategoria parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertCategoria", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Categoria", parameters.Categoria);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<List<MCategoria>> Mostrar_id(int ID)
        {
            var lista = new List<MCategoria>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetCategoria_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Categoria_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCategoria categoria = new MCategoria();
                            categoria.Categoria_id = (int)item[0];
                            categoria.Categoria = (string)item[1];
                            lista.Add(categoria);

                        }
                    }
                }
            }
            return lista;
        }
    }
}
