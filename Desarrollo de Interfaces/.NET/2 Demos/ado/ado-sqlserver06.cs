// Llamada a un procedimiento almacenado (con parámetros) de Sql Server

using System;
using System.Data;
using System.Data.SqlClient;

class ado06
{
    public static void Main()
    {
        string conexion="Data Source=MICASA;Initial Catalog=Gestion;User Id=sa;Password=;";
        SqlConnection miCnx=new SqlConnection(conexion);
        SqlCommand miCmd=new SqlCommand("sp_Pedidos#",miCnx);
        miCmd.CommandType=CommandType.StoredProcedure;

        SqlParameter miParametro=miCmd.Parameters.Add("retorno",SqlDbType.Int);
        miParametro.Direction=ParameterDirection.ReturnValue;

        miParametro=miCmd.Parameters.Add("@identificador",SqlDbType.Char,10);
        miParametro.Value="C000000003";

        miParametro=miCmd.Parameters.Add("@abonados",SqlDbType.Bit);
        miParametro.Value=1;


        miParametro=miCmd.Parameters.Add("@cantidad",SqlDbType.Int);
        miParametro.Direction=ParameterDirection.Output;


        miCnx.Open();

        miCmd.ExecuteNonQuery();

        Console.WriteLine (miCmd.Parameters["retorno"].Value);
        Console.WriteLine (miCmd.Parameters["@cantidad"].Value);
        miCnx.Close();

    }
}
