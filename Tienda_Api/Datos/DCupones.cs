using Tienda_Api.Models;
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;

namespace Tienda_Api.Datos
{
    public class DCupones
    {
        private string CN = Conexion.CN;

        public async Task<List<MCupones>> Mostrar()
        {
            var lista = new List<MCupones>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetCupones", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCupones cupones = new MCupones();
                            cupones.Cupones_id = (int)item[0];
                            cupones.Producto_id = (int)item[1];
                            cupones.Codigo = (string)item[2];
                            cupones.Descuento = (decimal)item[3];
                            cupones.Activado = (bool)item[4];
                            cupones.Fecha_inicio = (DateTime)item[5];
                            cupones.Fecha_fin = (DateTime)item[6];
                            cupones.Fecha_creacion = (DateTime)item[7];
                            lista.Add(cupones);
                        }
                    }
                }
            }
            return lista;
        }

        public async Task Insertar(MCupones parameters)
        {
            using(var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertCupones", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Producto", parameters.Producto_id);
                    cmd.Parameters.AddWithValue("@Codigo", parameters.Codigo);
                    cmd.Parameters.AddWithValue("@Descuento", parameters.Descuento);
                    cmd.Parameters.AddWithValue("@Activado", parameters.Activado);
                    cmd.Parameters.AddWithValue("@Fecha_inicio", parameters.Fecha_inicio);
                    cmd.Parameters.AddWithValue("@Fecha_fin", parameters.Fecha_fin);
                    cmd.Parameters.AddWithValue("@Fecha_creacion ", parameters.Fecha_creacion);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
