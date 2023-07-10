using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;

namespace Tienda_Api.Datos {
    public class DImagenes_P
    {
        private string CN = Conexion.CN;

        
        public async Task Insertar(MImagenes_P parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertImagenes_P", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Producto_id", parameters.Producto_id);
                    cmd.Parameters.AddWithValue("@Imagen", parameters.Imagen);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
