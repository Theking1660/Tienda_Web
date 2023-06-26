using Microsoft.AspNetCore.Mvc.Filters;
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
    }
}
