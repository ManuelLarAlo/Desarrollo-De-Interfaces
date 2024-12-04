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

public partial class AnadirObra : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Enviar_Click(object sender, EventArgs e)
    {
        Session["Titulo"] = titulo.Text;
        Session["Autor"] = autor.Text;
        Session["Editorial"] = editorial.Text;
        Response.Redirect("AnadirObra2.aspx");

    }
}
