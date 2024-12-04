using System;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if(Nif.Okey(nif.Text))
            {
               mensaje.Text = "";
               losPedidos.DataSource = consultas.pedidosCliente(nif.Text);
               losPedidos.DataTextField = "pedido";
               losPedidos.DataBind();
               Panel.Visible = true;
            }
            else
            {
                mensaje.Text="El nif es incorrecto";
                nif.Text = "";
                Panel.Visible = false;

            }
        }
    }
}
