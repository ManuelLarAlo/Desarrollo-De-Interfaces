using System;
using System.Data.SqlClient;

    class ado01
    {
        public static void Main()
        {
            string mensaje;
            try
            {
                SqlConnection miCnx = new SqlConnection();
                miCnx.ConnectionString = "Data Source=CASA;Initial Catalog=Gestion;User Id=sa;Password=;";
                miCnx.Open();
                if (miCnx.State.ToString() == "Open") Console.WriteLine("Conexión probada sastifactoriamente.");
                miCnx.Close();
                miCnx.Dispose();
            }
            catch (System.Data.SqlClient.SqlException error)
            {
                switch (error.Number)
                {
                    case 17: mensaje = "El servidor solicitado no existe o esta desconectado."; break;
                    case 4060: mensaje = "La base de datos solicitada no existe."; break;
                    case 18456: mensaje = "El nombre de usuario o la contraseña no son correctas."; break;
                    default: mensaje = error.Message; break;
                }
                Console.WriteLine(mensaje);
            }
        }
    }