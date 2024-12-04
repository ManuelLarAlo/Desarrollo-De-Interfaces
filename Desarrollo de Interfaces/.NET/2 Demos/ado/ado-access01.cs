using System;
using System.Data.OleDb;

class ado01
{
	public static void Main()
	{
	  try
          {	
	   OleDbConnection miCnx=new OleDbConnection();
	   miCnx.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
	   miCnx.Open();
	   if (miCnx.State.ToString()=="Open") Console.WriteLine("Conexión probada sastifactoriamente.");
           miCnx.Close();
           miCnx.Dispose();
         }
	 catch (System.Data.OleDb.OleDbException error)
         {
  	   Console.WriteLine("¡Error!:{0}",error.Message);	            
 	 } 
       }
}


