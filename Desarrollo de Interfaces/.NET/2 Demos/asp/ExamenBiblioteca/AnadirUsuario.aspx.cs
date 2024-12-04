using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AnadirUsuario : System.Web.UI.Page
{
    
    protected void enviar_Click(object sender, EventArgs e)
    {
        Session["Nombre"] = nombre.Text;
        Session["Dni"] = dni.Text;
        Response.Redirect("AnadirUsuario2.aspx");

    }
}
