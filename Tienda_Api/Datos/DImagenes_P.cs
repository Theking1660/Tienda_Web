using Tienda_Api.App_Data;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.Models;
using static System.Net.Mime.MediaTypeNames;

namespace Tienda_Api.Datos
{
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

        public async Task<List<MImagenes_P>> Mostrar(int ID)
        {
            var lista = new List<MImagenes_P>(); // Cambio 1: Crear una lista de MImagenes_P
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetImagenes_P", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Producto_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MImagenes_P imagenes_P = new MImagenes_P();
                            imagenes_P.Imagen_id = (int)item[0];
                            imagenes_P.Producto_id = (int)item[1];
                            string imagePath = (string)item[2];
                            byte[] imageBytes = File.ReadAllBytes(imagePath);
                            imagenes_P.ImagenBytes = imageBytes;
                            lista.Add(imagenes_P); // Cambio 2: Agregar imagenes_P a la lista
                        }
                    }

                }
            }
            return lista;
        }




    }
}

