using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DCuenta
    {
        private string CN = Conexion.CN;
        public async Task<List<MCuenta>> Mostrar()
        {
            var lista = new List<MCuenta>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetCuenta", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MCuenta cuenta = new MCuenta();
                            cuenta.Cuenta_id = (int)item[0];
                            cuenta.Perfil_id = (int)item[1];
                            cuenta.MetodoP_id = (int)item[2];
                            cuenta.Direccion_id = (int)item[3];
                            cuenta.Cuenta = (char)item[4];
                            cuenta.Fecha_creacion = (DateTime)item[5];
                            cuenta.Fecha_actualizacion = (DateTime)item[6];
                            lista.Add(cuenta);
                        }
                    }
                }
            }
            return lista;
        }
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
