namespace Tienda_Api.Datos;
using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;

public class DComentario_Producto
{
    private string CN = Conexion.CN;

    public async Task<List<MComentario_Producto>> Mostrar()
    {
        var lista = new List<MComentario_Producto>();
        using (var sql = new SqlConnection(CN))
        {
            using (var cmd = new SqlCommand("GetComentarioProducto", sql))
            {
                await sql.OpenAsync();
                cmd.CommandType = CommandType.StoredProcedure;
                using (var item = await cmd.ExecuteReaderAsync())
                {
                    while (await item.ReadAsync())
                    {
                        MComentario_Producto comentario_Producto = new MComentario_Producto();
                        comentario_Producto.ComentarioProducto_id = (int)item[0];
                        comentario_Producto.Producto_id = (int)item[1];
                        comentario_Producto.Comentario_id = (int)item[2];
                        lista.Add(comentario_Producto);
                    }
                }
            }
            return lista;
        }
    }
}

