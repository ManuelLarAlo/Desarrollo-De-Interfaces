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

public partial class AnadirPrestamo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void enviar_Click(object sender, EventArgs e)
    {
        Session["usuario"] = DropDownList1.SelectedValue;
        Session["libro"] = DropDownList2.SelectedValue;
        Session["prestamo"] = prestamo.Text;
        Response.Redirect("AnadirPrestamo2.aspx");

    }
}
