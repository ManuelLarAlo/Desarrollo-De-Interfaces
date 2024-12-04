using System;
using System.Data.OleDb;

class ado03
{
	public static void Main()
	{
	  string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
	  string sentencia="select * from articulos";
	  OleDbConnection miCnx=new OleDbConnection(conexion);
	  OleDbCommand miCmd=new OleDbCommand(sentencia,miCnx);
	  OleDbDataReader miLector;
	  miCnx.Open();
	  miLector=miCmd.ExecuteReader();
	  while (miLector.Read())
	        {Console.WriteLine(miLector.GetString(1)+"-->"+miLector.GetDecimal(2));}
	  miLector.Close();
	  miCnx.Close();
	}
}
