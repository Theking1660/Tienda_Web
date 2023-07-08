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

    public async Task Insertar(MComentario parameters)
    {
        using (var sql = new SqlConnection(CN))
        {
            using (var cmd = new SqlCommand("InsertComentario", sql))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Producto_id", parameters.Producto_id);
                cmd.Parameters.AddWithValue("@Perfil_id", parameters.Perfil_id);
                cmd.Parameters.AddWithValue("@Estrella", parameters.Estrella);
                cmd.Parameters.AddWithValue("@Comentario", parameters.Comentario);
                await sql.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
            }
        }
    }

    public async Task<List<MComentario>> Mostrar_id(int ID)
    {
        var lista = new List<MComentario>();
        using( var sql = new SqlConnection(CN))
        {
            using(var cmd= new SqlCommand("GetComentario_id", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Comentario_id", ID);
                await cmd.ExecuteNonQueryAsync();
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
            return lista;
        }
    }

    public async Task Eliminar(int ID)
    {
        using(var sql = new SqlConnection(CN))
        {
            using(var cmd=new SqlCommand("DeleteComentario", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Comentario_id", ID);
                await cmd.ExecuteNonQueryAsync();
            }
        }
    }
}

