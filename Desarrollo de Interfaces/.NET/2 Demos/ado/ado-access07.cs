using System;
using System.Data;
using System.Data.OleDb;

class ado07
{
         public static void Main()
         {
             string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
             OleDbConnection miCnx = new OleDbConnection(conexion);
             OleDbCommand miCmd=new OleDbCommand("select * from clientes where localidad='Linares'", miCnx);
     
             OleDbDataAdapter miAdaptador = new OleDbDataAdapter();
             miAdaptador.SelectCommand=miCmd;

	     /* No es necesario abrir y cerrar la conexión explícitamente fill, lo hace: abre, carga y cierra.
		Si la habrimos nosotros despues de ejecutar el método fill permanecería abierta. */
    
             DataSet miDSet = new DataSet();
             miAdaptador.Fill(miDSet,"ClientesLinares");
    
            foreach (DataRow miFila in miDSet.Tables["ClientesLinares"].Rows)
            {
                  Console.WriteLine(miFila["apellido1"].ToString()+ " " +miFila["apellido2"].ToString()+","+miFila["nombre"].ToString());
            }
         }
}	 



