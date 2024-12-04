using System;
using System.Web.UI; 
using System.Data.OleDb;

public partial class Default:Page
{
        static string cadenaConexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\asp\\asp09\\App_Data\\gestion.mdb";

         public void Registrar(object s, EventArgs e)
         {
             if (Existe(txtNif.Text))
             {
                 mensaje.Text = "Este Cliente ya está dado de alta en la base de datos.";
             }
             else
                 mensaje.Text=Insertar().ToString()+" fila(s) insertadas";
         }
    
         public bool Existe(string n)
         {
           bool ok = false;
           string sentencia = "select * from clientes where nif=@n";
           OleDbConnection miCnx = new OleDbConnection(cadenaConexion);
           OleDbCommand miCmd = new OleDbCommand(sentencia,miCnx);
           miCmd.Parameters.Add("@n", OleDbType.Char, 9).Value =n;
           miCnx.Open();
           OleDbDataReader miLector = miCmd.ExecuteReader();
           if (miLector.HasRows) ok = true;
           miCnx.Close();
           miCnx.Dispose();
           return ok;
         }
  
         public int Insertar()
         {
           // Para no alargarlo queda sin resolver el problema del decimal (descuento) y el código del cliente.
           OleDbConnection miCnx = new OleDbConnection(cadenaConexion);
           string sentencia = "Insert into Clientes values ('C000000150','" + txtApellido1.Text+ "','" + txtApellido2.Text + "','" + txtNombre.Text + "','" +ddlSexo.SelectedValue.ToString() + "',0,null,null,'" + txtCpostal.Text + "',null,'" +txtNif.Text + "','" +txtEmail.Text + "',0,"+Decimal.Parse(txtDesc.Text)+")";
           mensaje.Text = sentencia;
           OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
           miCnx.Open();
           int f=miCmd.ExecuteNonQuery();
           miCnx.Close();
           return f;
         }
}