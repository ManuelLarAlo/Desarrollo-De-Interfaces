using System;
using System.Data;
using System.Data.OleDb;

class ado08
{

	public static void Main()
        {
          string conexion="Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\ado\\gestion.mdb";
          OleDbConnection miCnx = new OleDbConnection(conexion);
          OleDbDataAdapter miAdt=new OleDbDataAdapter("select * from clientes Where idCliente='0'",miCnx);

          OleDbCommandBuilder miCommandBuilder = new OleDbCommandBuilder(miAdt);
          try
          {
             DataSet miDSet=new DataSet();
   
             /* Agregamos las restricciones de clave primaria de la tabla al DataSet,
                esto evita las claves primarias duplicadas dentro de DataSet. */
             miAdt.FillSchema(miDSet, SchemaType.Source);
             miAdt.Fill(miDSet);

             /* Creamos una nueva fila con el mismo esquema de una determinada tabla. en nuestro
                caso la de los clientes. */
             DataRow miFila=miDSet.Tables[0].NewRow();
  
            // Cargamos la fila con los datos correspondientes.
	    miFila["idCliente"]="C000000012";
            miFila["apellido1"]="Gutiérrez";
            miFila["apellido2"]="Martínez";
            miFila["nombre"]="josé";
            miFila["sexo"]="V";
            miFila["calle"]="Plaza de Colón 17";
	    miFila["localidad"]="Linares";
            miFila["provincia"]="Jaén";
	    miFila["cPostal"]="23700";
            miFila["nif"]="12345678L";
            miFila["saldo"]=0;
            miFila["descuento"]=0;

            // Añadimos la fila con datos, a la colección de filas de la tabla del DataSet.
            miDSet.Tables[0].Rows.Add(miFila);
            // Actualizamos la base de datos con los cambios reflejados en el DataSet.
            miAdt.Update(miDSet);
      }

      catch (System.Exception e)
      {
        Console.WriteLine(e.Message);
      }
   }
   
}	 



