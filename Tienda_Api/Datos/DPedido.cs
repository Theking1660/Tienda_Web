using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Formatters;
using System.Data;
using System.Data.SqlClient;
using Tienda_Api.App_Data;
using Tienda_Api.Models;

namespace Tienda_Api.Datos
{
    public class DPedido
    {
        private string CN = Conexion.CN;

        public async Task<List<MPedido>> Mostrar()
        {
            var lista = new List<MPedido>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetPedido", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MPedido pedido = new MPedido();
                            pedido.Pedido_id = (int)item["Pedido_id"];
                            pedido.Cuenta_id = (int)item["Cuenta_id"];
                            pedido.Producto_id = (int)item["Producto_id"];
                            pedido.Metodo_id = (int)item["Metodo_id"];
                            pedido.Direccion_id = (int)item["Direccion_id"];
                            pedido.Pedido = (string)item["Pedido"];
                            pedido.Precio_total = (decimal)item["Precio_total"];
                            pedido.Precio_envio = (decimal)item["Precio_envio"];
                            pedido.ITBIS = (decimal)item["ITBIS"];
                            pedido.Descuento = (decimal)item["Descuento"];
                            pedido.Fpedido_realizado = (DateTime)item["Fpedido_realizado"];
                            pedido.FPEDIDO_enviado = (DateTime)item["FPEDIDO_envido"];
                            pedido.Reembolsado = (bool)item["Reembolsado"];
                            lista.Add(pedido);
                        }
                    }
                }
            }
            return lista;
        }
        public async Task Insertar(MPedido parameters)
        {
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("InsertPedido", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Cuenta_id", parameters.Cuenta_id);
                    cmd.Parameters.AddWithValue("@Producto_id", parameters.Producto_id);
                    cmd.Parameters.AddWithValue("@MetodoP_id", parameters.Metodo_id);
                    cmd.Parameters.AddWithValue("@Direccion_id", parameters.Direccion_id);
                    cmd.Parameters.AddWithValue("@Pedido", parameters.Pedido);
                    cmd.Parameters.AddWithValue("@Precio_total", parameters.Precio_total);
                    cmd.Parameters.AddWithValue("@Precio_envio", parameters.Precio_envio);
                    cmd.Parameters.AddWithValue("@ITBIS", parameters.ITBIS);
                    cmd.Parameters.AddWithValue("@Descuento", parameters.Descuento);
                    cmd.Parameters.AddWithValue("@Fpedido_realizado", parameters.Fpedido_realizado);
                    cmd.Parameters.AddWithValue("@FPEDIDO_enviado", parameters.FPEDIDO_enviado);
                    cmd.Parameters.AddWithValue("@Reembolsado", parameters.Reembolsado);
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<List<MPedido>> Mostrar_id(int ID)
        {
            var lista = new List<MPedido>();
            using (var sql = new SqlConnection(CN))
            {
                using (var cmd = new SqlCommand("GetPedido_id", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Pedido_id", ID);
                    await cmd.ExecuteNonQueryAsync();
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            MPedido pedido = new MPedido();
                            pedido.Pedido_id = (int)item["Pedido_id"];
                            pedido.Cuenta_id = (int)item["Cuenta_id"];
                            pedido.Producto_id = (int)item["Producto_id"];
                            pedido.Metodo_id = (int)item["Metodo_id"];
                            pedido.Direccion_id = (int)item["Direccion_id"];
                            pedido.Pedido = (string)item["Pedido"];
                            pedido.Precio_total = (decimal)item["Precio_total"];
                            pedido.Precio_envio = (decimal)item["Precio_envio"];
                            pedido.ITBIS = (decimal)item["ITBIS"];
                            pedido.Descuento = (decimal)item["Descuento"];
                            pedido.Fpedido_realizado = (DateTime)item["Fpedido_realizado"];
                            pedido.FPEDIDO_enviado = (DateTime)item["FPEDIDO_envido"];
                            pedido.Reembolsado = (bool)item["Reembolsado"];
                            lista.Add(pedido);
                        }
                    }
                }
            }
            return lista;
        }
    }
}
