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
                mensaje.Text = "El pedido n�:" + e.Keys[0].ToString() + "  ha sido borrado.";
            else
                mensaje.Text = "No ha sido posible borrar el pedido. Int�ntelo m�s tarde.";
        }
        else
        {
            mensaje.Text = "�El pedido est� facturado?.";
           // Considera procesada la excepci�n y no se trata m�s (no sale el pantallazo amarillo).
            e.ExceptionHandled = true;
        }

    }
}