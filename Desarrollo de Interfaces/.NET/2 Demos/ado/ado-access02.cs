// ¡Ojo! con la Sql Injection.

using System;
using System.Data.OleDb;

class ado02
{
    public static int BorrarArticulos(string p)
    {
      int filas;
      try
       {
         string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
         string sentencia="delete from Articulos where idProveedor='"+p+"'";
         OleDbConnection miCnx=new OleDbConnection(conexion);
         OleDbCommand miCmd=new OleDbCommand(sentencia,miCnx);
         miCnx.Open();
         filas=miCmd.ExecuteNonQuery();
         miCnx.Close();
         miCnx.Dispose();
       }
       catch
       {
         filas=-1;
       }
        return filas;
    }

    
    public static void Main()
    {
      Console.Write("Código del Proveedor:");string proveedor=Console.ReadLine();
      if (ado02.BorrarArticulos(proveedor)==-1)
         Console.WriteLine("Los artículos de este proveedor no han podido ser borrados.");
      else
         Console.WriteLine("Artículos eliminados.");

    }
}
