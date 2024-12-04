using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!CheckBox1.Checked)
        {
            Session["alumno"] = ListBox1.SelectedValue;
        }
        else
        {
            Session["alumno"] = "%";
        }
        Session["periodo"] = DropDownList1.SelectedValue;
        Response.Redirect("Default2.aspx");
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true) ListBox1.Enabled = false;
        else ListBox1.Enabled = true;
    }
}
