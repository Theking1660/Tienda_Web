using System.Data.SqlClient;
using System.Data;
using Tienda_Api.App_Data;
using Tienda_Api.Models;
using System.Reflection.Metadata.Ecma335;

namespace Tienda_Api.Datos
{
    public class DMetodo_Pago
    {
        private string CN = Conexion.CN;

        public async Task<List<MMetodo_Pago>> Mostrar()
        {
            var lista = new List<MMetodo_Pago>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetMetodoPago", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MMetodo_Pago pago = new MMetodo_Pago();
                            pago.MetodoP_id = (int)item[0];
                            pago.Metodo = (string)item[1];
                            lista.Add(pago);
                        }
                    }
                }
            }
            return lista;
        }

        
    }
}
