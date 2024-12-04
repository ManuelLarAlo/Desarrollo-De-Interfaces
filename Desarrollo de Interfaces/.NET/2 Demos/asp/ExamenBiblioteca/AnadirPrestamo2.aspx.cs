using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AnadirPrestamo2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*string conexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\\Documents and Settings\\Administrador\\Mis documentos\\Visual Studio 2005\\WebSites\\ExamenBiblioteca\\App_Data\\biblioteca.mdb";

        string sentencia = "select * from prestamos where Id_Usuario =" + Session["usuario"] + " AND Id_Libro =" + Session["libro"] + " AND Fecha_Prestamo ='" + Session["prestamo"].ToString() + "';";
        OleDbConnection miCnx = new OleDbConnection(conexion);
        OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
        OleDbDataReader miLector;
        miCnx.Open();
        miLector = miCmd.ExecuteReader();
        if (!miLector.HasRows)
        {*/
            AccessDataSource1.Insert();
        /*}
        //while (miLector.Read())
        //{ Console.WriteLine(miLector.GetString(1) + "-->" + miLector.GetDecimal(2)); }

        miLector.Close();
        miCnx.Close();
        */

        Response.Redirect("AnadirPrestamo.aspx");


    }
}
