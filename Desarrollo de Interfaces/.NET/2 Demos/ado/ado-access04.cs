using System;
using System.Data.OleDb;

class ado04
{
	public static void Main()
	{
	  string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
          string sentencia="select count(*) from articulos";
          OleDbConnection miCnx = new OleDbConnection(conexion);
          OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
	  miCnx.Open();
	  Int32 cantidad = (Int32)miCmd.ExecuteScalar();        
          Console.WriteLine("Número de artículos:"+cantidad.ToString());
          miCnx.Close();
        }
}

