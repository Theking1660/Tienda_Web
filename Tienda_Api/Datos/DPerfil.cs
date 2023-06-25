using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DPerfil
    {
        private string CN = Conexion.CN;
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
