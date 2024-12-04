using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default:Page
{
    public void BorrarPedido(Object sender, GridViewDeletedEventArgs e)
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
           e.ExceptionHandled = true;
       }

    }

    public void GenerarFilas(Object sender, GridViewRowEventArgs e)
    {
      
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView filaGrid = (DataRowView)e.Row.DataItem;
            DropDownList mpDDL = (DropDownList)e.Row.FindControl("modosDDL");
            string mp = filaGrid["medioAbono"].ToString();
            if (e.Row.RowIndex == miGridView.EditIndex)
            {
                mpDDL.SelectedIndex = Int32.Parse(mp);
            }
            else
                switch (mp)
                {
                    case "0": e.Row.Cells[4].Text = "Domiciliación Bancaria"; break;
                    case "1": e.Row.Cells[4].Text = "Tarjeta de Crédito"; break;
                    case "2": e.Row.Cells[4].Text = "Contra Reembolso"; break;
                }
        }
         
    }

    public void AntesDeActualizarPedido(Object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow filaGrid = miGridView.Rows[miGridView.EditIndex];

        TextBox entidad = (TextBox)filaGrid.FindControl("entidadTXB");
        e.NewValues["entidadAbono"] = entidad.Text;

        TextBox cuenta = (TextBox)filaGrid.FindControl("cuentaTXB");
        e.NewValues["cuentaAbono"] = cuenta.Text;

        DropDownList mpDDL = (DropDownList)filaGrid.FindControl("modosDDL");
        e.NewValues["medioAbono"] = mpDDL.SelectedValue;

        if (mpDDL.SelectedValue.ToString() == "0" | mpDDL.SelectedValue.ToString() == "1")
        { 
            if(entidad.Text=="" | cuenta.Text=="")
            {
                mensaje.Text="Para domiciliación y tarjetas, debe especificar una Entidad y número de Cuenta";
                e.Cancel = true;
                miGridView.EditIndex = -1;
            }
        }
        else
        {
            e.NewValues["entidadAbono"] = null;
            e.NewValues["cuentaAbono"] = null;
            mensaje.Text = "El contra reembolso no admite Entidad ni Cuenta.";
        }
    }

    public void DespuesDeActualizarPedido(Object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
                mensaje.Text = "Actualización completada.";
            else
                mensaje.Text = "No ha sido posible la actualización.";
        }
        else
        {
            mensaje.Text = "No ha sido posible la actualización.";
            e.ExceptionHandled = true;
        }
        
    }

  
    public void ClicEnComando(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "INSERTAR")
        {
            miGridView.ShowFooter = true;
            miGridView.EditIndex = -1;
            miGridView.PageIndex = miGridView.PageCount;
        }
        else
        {
            miGridView.ShowFooter = false;
        }
    }

    public void Insertando(object sender, EventArgs e)
    {

        susPedidos.Insert();

    }
  
    public void AntesDeInsertar(Object sender, SqlDataSourceCommandEventArgs e)
    {
        string a = ((DropDownList)miGridView.FooterRow.FindControl("insModosDDL")).SelectedValue.ToString();
        string b = ((TextBox)miGridView.FooterRow.FindControl("insEntidadTXB")).Text;
        string c = ((TextBox)miGridView.FooterRow.FindControl("insCuentaTXB")).Text;
        
        if (a=="0" | a=="1")
        {
            if (b=="" | c=="")
            {  
                mensaje.Text="Para domiciliación y tarjetas, debe especificar una Entidad y número de Cuenta";
                e.Cancel = true;
                miGridView.ShowFooter = false;
            }
        }

        if (a == "2")
        {
            b = null;
            c = null;
        }
                
        e.Command.Parameters["idCliente"].Value = Session["idCliente"].ToString();
        e.Command.Parameters["fechaPedido"].Value = DateTime.Now.ToString();
        e.Command.Parameters["medioAbono"].Value = a;
        e.Command.Parameters["entidadAbono"].Value = b;
        e.Command.Parameters["cuentaAbono"].Value = c;
        e.Command.Parameters["abonado"].Value = false;
    }

    public void DespuesDeInsertar(Object sender, SqlDataSourceStatusEventArgs e)
    {
        // faltaría realizar el control de errores de manera similar a la
        // realizada en el caso del borrado y de la actualización.
        miGridView.ShowFooter = false;
        miGridView.DataBind();
        miGridView.PageIndex = miGridView.PageCount;
        
    }

    public void PonerPrecio(object o, EventArgs e)
    {
        DetailsViewRow elArticulo = misDetalles.Rows[1];
        DropDownList eA = (DropDownList)elArticulo.Cells[1].FindControl("articulosDDL");
        
        DetailsViewRow elPrecio = misDetalles.Rows[2];
        TextBox eP = (TextBox)elPrecio.Cells[1].FindControl("insPvpTXB");
        if (eA.SelectedIndex != 0)
        {
            SqlConnection miCnx = new SqlConnection("Data Source=MICASA;Initial Catalog=Gestion;User ID=sa");
            SqlCommand miCmd = new SqlCommand("select precio from articulos where referencia=" + eA.SelectedValue.ToString(), miCnx);
            miCnx.Open();
            eP.Text = miCmd.ExecuteScalar().ToString();
            miCnx.Close();
        }
        else
        {
            eP.Text = null;
        }
    }

    public void AntesDeActualizarDetalle(object sender,DetailsViewUpdateEventArgs e)
    {
        // Primero deberíamos coprobar que no se ha dejado ningún dato en blanco
        // o es erróneo.
        DetailsViewRow elPrecio = misDetalles.Rows[2];
        TextBox eP = (TextBox)elPrecio.Cells[1].FindControl("edtPvpTXB");
        e.NewValues["pvp"] = eP.Text;
        
    }

    public void AntesDeInsertarDetalle(object sender,DetailsViewInsertEventArgs e)
    {
        // Primero comprobaríamos que todos los datos cargados son correctos.
                
        DetailsViewRow elArticulo = misDetalles.Rows[1];
        DropDownList eA = (DropDownList)elArticulo.Cells[1].FindControl("articulosDDL");
        
        DetailsViewRow elPrecio = misDetalles.Rows[2];
        TextBox eP = (TextBox)elPrecio.Cells[1].FindControl("insPvpTXB");

        e.Values["referencia"] = eA.SelectedValue.ToString();
        e.Values["pvp"]=eP.Text;
        e.Values["idPedido"] = Session["idPedido"];
    }

    public void PedidoSeleccionado(Object sender, EventArgs e)
    {
        Session["idPedido"]= miGridView.SelectedRow.Cells[2].Text;
    }

    public void DespuesDeInsertarDetalle(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.AffectedRows == 1)
                mensaje.Text = "Se ha añadido un nuevo detalle.";
            else
                mensaje.Text = "No ha sido posible la actualización.";
        }
        else
        {
            mensaje.Text = "Este artículo ya está solicitado en este mismo pedido.";
            e.ExceptionHandled = true;
        }
        misDetalles.DataBind();
        misDetalles.PageIndex = misDetalles.PageCount;
    }

}