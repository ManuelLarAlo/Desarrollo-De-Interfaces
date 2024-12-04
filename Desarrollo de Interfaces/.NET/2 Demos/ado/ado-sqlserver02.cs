// ¡Ojo! con la Sql Injection.

using System;
using System.Data.SqlClient;

class ado02
{
    public static int BorrarArticulos(string p)
    {
      int filas;
      try
       {
         string conexion="Data Source=MICASA;Initial Catalog=Gestion;User Id=sa;Password=;";
         string sentencia="delete Articulos where idProveedor='"+p+"'";
         SqlConnection miCnx=new SqlConnection(conexion);
         SqlCommand miCmd=new SqlCommand(sentencia,miCnx);
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
