using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DTipo_Perfil
    {
        private string CN = Conexion.CN;
        public async Task<List<MTipo_Perfil>> Mostrar()
        {
            var lista = new List<MTipo_Perfil>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetTipo_perfil", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MTipo_Perfil mTipo = new MTipo_Perfil();
                            mTipo.Tipo_perfil_id = (int)item[0];
                            mTipo.Tipo_perfil = (string)item[1];
                            lista.Add(mTipo);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
