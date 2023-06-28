namespace Tienda_Api.Datos;
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;
using System.Text.RegularExpressions;

public class DComentario
{
    private string CN = Conexion.CN;

    public async Task<List<MComentario>> Mostrar()
    {
        var lista = new List<MComentario>();
        using (var sql = new SqlConnection(CN))
        {
            using (var cmd = new SqlCommand("GetComentario", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                using (var item = await cmd.ExecuteReaderAsync())
                {
                    while (await item.ReadAsync())
                    {
                        MComentario comentario = new MComentario();
                        comentario.Comentario_id = (int)item[0];
                        comentario.Producto_id = (int)item[1];
                        comentario.Perfil_id = (int)item[2];
                        comentario.Estrella = (Int16)item[3];
                        comentario.Comentario = (string)item[4];
                        lista.Add(comentario);
                    }
                }
            }
        }
        return lista;
    }
}

