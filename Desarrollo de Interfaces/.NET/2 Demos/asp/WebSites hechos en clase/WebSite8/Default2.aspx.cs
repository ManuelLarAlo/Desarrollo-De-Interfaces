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

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string conexion = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\\Documents and Settings\\RAFA\\Mis documentos\\Visual Studio 2005\\WebSites\\WebSite8\\App_Data\\usuarios.mdb";
        string sentencia = "select * from Tabla1 where nombre ='"+Session["nombre"].ToString()+"';";
        OleDbConnection miCnx = new OleDbConnection(conexion);
        OleDbCommand miCmd = new OleDbCommand(sentencia, miCnx);
        OleDbDataReader miLector;
        miCnx.Open();
        miLector = miCmd.ExecuteReader();
        if (!miLector.HasRows)
        {
            AccessDataSource1.Insert();
        }
        //while (miLector.Read())
        //{ Console.WriteLine(miLector.GetString(1) + "-->" + miLector.GetDecimal(2)); }
        
        miLector.Close();
        miCnx.Close();
        
        Response.Redirect("Default.aspx");
    }
}
