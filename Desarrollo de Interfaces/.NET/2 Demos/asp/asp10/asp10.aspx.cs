using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class Default:Page
{
    
    static string cadenaConexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=c:\\asp\\asp10\\App_Data\\gestion.mdb";

    public void Registrar(object s, EventArgs e)
    {
        if (!Page.IsValid)
            Response.Write("<scr" + "ipt> alert('El valor introducido del NIF no es correcto.') </scr" + "ipt>");
        else
           if (Existe(txtNif.Text))
                mensaje.Text = "El cliente ya está dado de alta en la Base de Datos.";
            else
                if (Insertar() == 1)
                      mensaje.Text = "El cliente ha sido dado de alta.";
                else
                      mensaje.Text = "No ha sido posible realizar la operación.";
    }


    public void ValidarNif(object source, ServerValidateEventArgs arguments)
    {
        arguments.IsValid = Nif.Okey(arguments.Value);
    }

    public bool Existe(string n)
    {
        bool ok = false;
        string sentencia = "select * from clientes where nif=@n";
        OleDbConnection miCnx = new OleDbConnection(cadenaConexion);
        OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
        miCmd.Parameters.Add("@n", OleDbType.Char, 9).Value = n;
        miCnx.Open();
        OleDbDataReader miLector = miCmd.ExecuteReader();
        if (miLector.HasRows) ok = true;
        miCnx.Close();
        miCnx.Dispose();
        return ok;
    }

    public int Insertar()
    {
        OleDbConnection miCnx = new OleDbConnection(cadenaConexion);
        string sentencia = "Insert into Clientes values ('C00000150','" + txtApellido1.Text + "','" + txtApellido2.Text + "','" + txtNombre.Text + "','" + ddlSexo.SelectedValue.ToString() + "',0,null,null,'" + txtCpostal.Text + "',null,'" + txtNif.Text + "','" + txtEmail.Text + "',0," + Decimal.Parse(txtDescuento.Text) + ")";
        mensaje.Text = sentencia;
        OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
        miCnx.Open();
        int f = miCmd.ExecuteNonQuery();
        miCnx.Close();
        return f;
    }
}