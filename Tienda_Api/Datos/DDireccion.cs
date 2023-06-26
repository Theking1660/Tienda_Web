namespace Tienda_Api.Datos;
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;

public class DDireccion
{
    private string CN = Conexion.CN;

    public async Task<List<MDireccion>> Mostrar()
    {
        var lista = new List<MDireccion>();
        using (var sql = new SqlConnection(CN))
        {
            using(var cmd = new SqlCommand("GetDireccion", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                using(var item = await  cmd.ExecuteReaderAsync())
                {
                    while(await item.ReadAsync())
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
}

