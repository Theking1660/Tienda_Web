using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DCuenta
    {
        private string CN = Conexion.CN;
        public async Task Insertar(MCuenta parametrs)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertCuenta", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Perfil_id", parametrs.Perfil_id);
                    cmd.Parameters.AddWithValue("@MetodoP_id", parametrs.MetodoP_id);
                    cmd.Parameters.AddWithValue("@Direccion_id", parametrs.Direccion_id);
                    cmd.Parameters.AddWithValue("@Cuenta", parametrs.Cuenta);
                    cmd.Parameters.AddWithValue("@Fecha_actualizacion", parametrs.Fecha_actualizacion);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
