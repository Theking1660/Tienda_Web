﻿using Microsoft.AspNetCore.Razor.TagHelpers;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DProducto
    {
        private string CN = Conexion.CN;

        public async Task<List<MProducto>> Mostrar()
        {
            var lista = new List<MProducto>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetProducto", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MProducto producto = new MProducto();
                            producto.Producto = (string)item["Producto"];
                            producto.Precio = (decimal)item["Precio"];
                            producto.Descuento = (decimal)item["Descuento"];
                            producto.Cantidad = (int)item["Cantidad"];
                            lista.Add(producto);
                        }
                    }
                }
            }
            return lista;
        }
        public async Task Insertar(MProducto parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertProducto", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Categoria_id", parameters.Categoria_id);
                    cmd.Parameters.AddWithValue("@Producto", parameters.Producto);
                    cmd.Parameters.AddWithValue("@Precio", parameters.Precio);
                    cmd.Parameters.AddWithValue("@Descuento", parameters.Descuento);
                    cmd.Parameters.AddWithValue("@Cantidad", parameters.Cantidad);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task<List<MProducto>> Mostrar_id(int ID)
        {
            var lista = new List<MProducto>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetProducto_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Producto_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MProducto producto = new MProducto();
                            producto.Producto = (string)item["Producto"];
                            producto.Precio = (decimal)item["Precio"];
                            producto.Descuento = (decimal)item["Descuento"];
                            producto.Cantidad = (int)item["Cantidad"];
                            lista.Add(producto);
                        }
                    }
                }
            }
            return lista;
        }

        public async Task Eliminar(int ID)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("DeleteProducto", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Producto_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<List<MProducto>> Producto_Categoria(int ID,bool Tipo){
            string Prod_Cate="";
            if (Tipo == false)
                Prod_Cate = "select * from Tienda.Producto where Categoria_id =" + ID;
            else
                Prod_Cate = "select P.* from Tienda.Producto as P inner join Tienda.Subcategoria  as S on p.Categoria_id = s.Categoria_id where s.Subcategoria_id =" + ID;
            var lista = new List<MProducto>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand(Prod_Cate, sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.Text;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MProducto producto = new MProducto();
                            producto.Producto = (string)item["Producto"];
                            producto.Precio = (decimal)item["Precio"];
                            producto.Descuento = (decimal)item["Descuento"];
                            producto.Cantidad = (int)item["Cantidad"];
                            lista.Add(producto);
                        }
                    }
                }
            }
            return lista;
        }

    }
}
