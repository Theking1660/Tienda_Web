
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DDireccion
    {
        private string CN = Conexion.CN;

        public async Task<List<MDireccion>> Mostrar()
        {
            var lista = new List<MDireccion>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetDireccion", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MDireccion direccion = new MDireccion();
                            direccion.Direccion_id = (int)item[0];
                            direccion.Pais_id = (char)item[1];
                            direccion.Ubicacion = (string)item[2];
                            direccion.Codigo_Postal = (int)item[3];
                            direccion.Ciudad_id = (int)item[4];
                            lista.Add(direccion);
                        }
                    }
                }
                return lista;
            }
        }

        public async Task Insertar(MDireccion parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertDireccion", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Pais_id", parameters.Pais_id);
                    cmd.Parameters.AddWithValue("@Ciudad_id", parameters.Ciudad_id);
                    cmd.Parameters.AddWithValue("@Ubicacion", parameters.Ubicacion);
                    cmd.Parameters.AddWithValue("@Codigo_Postal", parameters.Codigo_Postal);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task<List<MDireccion>> Mostrar_id(int ID)
        {
            var lista = new List<MDireccion>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetDireccion_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Direccion_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MDireccion direccion = new MDireccion();
                            direccion.Direccion_id = (int)item[0];
                            direccion.Pais_id = (char)item[1];
                            direccion.Ubicacion = (string)item[2];
                            direccion.Codigo_Postal = (int)item[3];
                            direccion.Ciudad_id = (int)item[4];
                            lista.Add(direccion);
                        }
                    }
                }
            }
            return lista;
        }

        public async Task Eliminar(int ID)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("DeleteDireccion", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Direccion_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}

