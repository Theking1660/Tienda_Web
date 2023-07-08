using Tienda_Api.Models;
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace Tienda_Api.Datos
{
    public class DCiudad
    {
        private string CN = Conexion.CN;

        public async Task<List<MCiudad>> Mostrar()
        {
            var lista = new List<MCiudad>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetCiudad", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCiudad ciudad = new MCiudad();
                            ciudad.ID = (int)item[0];
                            ciudad.Ciudad_id = (string)item[1];
                            ciudad.Pais_id = (string)(item[2]);
                            ciudad.Ciudad = (string)item[3];
                            lista.Add(ciudad);
                        }
                    }
                }
            }
            return lista;
        }

        public async Task Insertar(MCiudad parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertCiudad", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Ciudad_id", parameters.Ciudad_id);
                    cmd.Parameters.AddWithValue("@Pais_id", parameters.Pais_id);
                    cmd.Parameters.AddWithValue("@Ciudad", parameters.Ciudad);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<List<MCiudad>> Mostrar_id(int ID)
        {
            var lista = new List<MCiudad>();
            using(var sql =  new SqlConnection(CN))
            {
                using(var cmd= new SqlCommand("GetCiudad_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Ciudad_id", ID);
                    await cmd.ExecuteNonQueryAsync();

                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCiudad ciudad = new MCiudad();
                            ciudad.ID = (int)item[0];
                            ciudad.Ciudad_id = (string)item[1];
                            ciudad.Pais_id = (string)(item[2]);
                            ciudad.Ciudad = (string)item[3];
                            lista.Add(ciudad);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
