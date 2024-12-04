// Ejecución de consultas que incluyen parámetros.
// Una sencilla solución al problema de la Sql Injection.

using System;
using System.Data;
using System.Data.OleDb;

class ado05
{
	public static void Main()
	{
	  Console.Write("Codigo Proveedor :");string proveedor=Console.ReadLine();
	  Console.Write("Cantidad         :");string cantidad=Console.ReadLine();

	  string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
          string sentencia="select descripcion from articulos where idProveedor=@p and stock>=@s";
          OleDbConnection miCnx = new OleDbConnection(conexion);
          OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
          miCmd.Parameters.Add("@p", OleDbType.Char,10).Value = proveedor;
          miCmd.Parameters.Add("@s",OleDbType.Decimal);
 	  miCmd.Parameters["@s"].Value=Int16.Parse(cantidad);

          miCnx.Open();
          OleDbDataReader datos;
          datos = miCmd.ExecuteReader();
	  while (datos.Read())
              Console.WriteLine(datos.GetString(0));
	  datos.Close();
          miCnx.Close();
        }
}

