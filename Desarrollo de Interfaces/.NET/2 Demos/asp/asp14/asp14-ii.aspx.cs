using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default:Page
{
      public void ControlDelBorrado(Object sender, GridViewDeletedEventArgs e)
      {
       if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
                mensaje.Text = "El pedido nº:" + e.Keys[0].ToString() + "  ha sido borrado.";
            else
                mensaje.Text = "No ha sido posible borrar el pedido. Inténtelo más tarde.";
        }
        else
        {
            mensaje.Text = "¿El pedido está facturado?.";
           // Considera procesada la excepción y no se trata más (no sale el pantallazo amarillo).
            e.ExceptionHandled = true;
        }

    }
}