using Tienda_Api.Models;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
namespace Tienda_Api.Datos
{
    public class DPais
    {
        private string CN = Conexion.CN;

        public async Task<List<MPais>> Mostrar()
        {
            var lista = new List<MPais>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetPais", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MPais pais = new MPais();
                            pais.Pais_id = (string)item[0];
                            pais.Pais = (string)item[1];
                            lista.Add(pais);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
