using System;
using System.Data;
using System.Data.SqlClient;

class ado09
{
          
          public static void Main()
          {
	       string conexion="Data Source=MICASA;Initial Catalog=Gestion;User Id=sa;Password=;";               
               SqlConnection miCnx = new SqlConnection(conexion);
	       SqlCommand miCmd=new SqlCommand("select * from detalles where idPedido=@idPedido",miCnx);
               SqlDataAdapter miAdt=new SqlDataAdapter(miCmd);
               SqlCommandBuilder miSqlCommandBuilder = new SqlCommandBuilder(miAdt); 

               try
               {	
                   Console.Write("Número de pedido:");int idPedido=Int32.Parse(Console.ReadLine());
                   miCmd.Parameters.Add("@idPedido",SqlDbType.Int).Value=idPedido;

		   int i,j;	     
                   DataSet miDSet=new DataSet();

                   miAdt.Fill(miDSet,"misDetalles");

		   if (miDSet.Tables["misDetalles"].Rows.Count!=0)
                   {
		      while (true) 
		      {
		        i=1;
		        foreach (DataRow miFila in miDSet.Tables["misDetalles"].Rows)
                        {
		  	   if (miFila.RowState.ToString()!="Deleted")
                               Console.WriteLine(i.ToString()+".-"+miFila[0].ToString()+ "....." +miFila[1].ToString()+"....."+miFila[2].ToString()+"......."+miFila[3].ToString());
                           i++;
                        }
	
		        Console.WriteLine("Que línea desea suprimir:");j=Int16.Parse(Console.ReadLine());
		   
		        if (j==-1) break;

  		        // Podemos modificar la propiedad RoWState y marcar la fila como borrada con el método Delete,
		        // o eliminarla de la colección con Remove. Optamos por la primera opcion
		        miDSet.Tables[0].Rows[--j].Delete();
			
		      } 
		      Console.WriteLine("Se han eliminado "+miAdt.Update(miDSet,"misDetalles").ToString()+" fila(s).");
                   }
		   else
		      Console.WriteLine("->Pedido sin detalles<-");

               }

               catch (System.Exception e)
               {
                    Console.WriteLine(e.Message);
               }
        }
}	 

