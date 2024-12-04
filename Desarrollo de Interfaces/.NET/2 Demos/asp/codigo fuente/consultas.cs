
using System;
using System.Data;
using System.Data.OleDb;

public class consultas
{
	public static OleDbDataReader pedidosCliente(string n)
	{
	  string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\asp\\asp04\\App_Data\\gestion.mdb";
          string sentencia="select cstr(idpedido)+'<----'+cstr(fechapedido) as pedido from pedidos where idcliente=(select idcliente from clientes where nif=@nif)";
          OleDbConnection miCnx = new OleDbConnection(conexion);
          OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
          miCmd.Parameters.Add("@nif", OleDbType.Char,9).Value =n;
          miCnx.Open();
          OleDbDataReader datos=miCmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
	  return datos;
        }
}

