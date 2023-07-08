using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DPerfil
    {
        private string CN = Conexion.CN;

        public async Task<List<MPerfil>> Mostrar()
        {
            var lista = new List<MPerfil>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetPerfil", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MPerfil perfil = new MPerfil();
                            perfil.Perfil_id = (int)item[0];
                            perfil.Tipo_perfil_id = (int)item[1];
                            perfil.Nombre = (string)item[2];
                            perfil.Apellidos = (string)item[3];
                            perfil.Numero = (int)item[4];
                            perfil.Correo = (string)item[5];
                            perfil.Contraseña = (string)item[6];
                            perfil.Fecha_Nacimiento = (DateTime)item[7];
                            perfil.ActivacionDP = (bool)item[8];
                            perfil.Membresia = (bool)item[9];
                            perfil.Fecha_creacion = (DateTime)item[10];
                            lista.Add(perfil);
                        }
                    }
                }
            }
            return lista;
        }
        public async Task Insertar(MPerfil parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertPerfil", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Tipo_perfil_id", parameters.Tipo_perfil_id);
                    cmd.Parameters.AddWithValue("@Nombre", parameters.Nombre);
                    cmd.Parameters.AddWithValue("@Apellidos", parameters.Apellidos);
                    cmd.Parameters.AddWithValue("@Numero", parameters.Numero);
                    cmd.Parameters.AddWithValue("@Correo", parameters.Correo);
                    cmd.Parameters.AddWithValue("@Contraseña", parameters.Contraseña);
                    cmd.Parameters.AddWithValue("@Fecha_Nacimiento", parameters.Fecha_Nacimiento);
                    cmd.Parameters.AddWithValue("@ActivacionDP", parameters.ActivacionDP);
                    cmd.Parameters.AddWithValue("@Membresia", parameters.Membresia);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
