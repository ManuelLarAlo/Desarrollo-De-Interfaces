using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

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
           e.ExceptionHandled = true;
       }

    }

    public void GenerarFilas(Object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView filaGrid = (DataRowView)e.Row.DataItem;
            DropDownList mpDDL = (DropDownList)e.Row.FindControl("dllModos");
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

    public void AntesDeActualizar(Object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow filaGrid = miGridView.Rows[miGridView.EditIndex];

        TextBox entidad = (TextBox)filaGrid.FindControl("txtEntidad");
        e.NewValues["entidadAbono"] = entidad.Text;

        TextBox cuenta = (TextBox)filaGrid.FindControl("txtCuenta");
        e.NewValues["cuentaAbono"] = cuenta.Text;

        DropDownList mpDDL = (DropDownList)filaGrid.FindControl("dllModos");
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

    public void DespuesDeActualizar(Object sender, GridViewUpdatedEventArgs e)
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

  
    public void ClicEnCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmdInsertar")
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
        string a = ((DropDownList)miGridView.FooterRow.FindControl("dllModosIns")).SelectedValue.ToString();
        string b = ((TextBox)miGridView.FooterRow.FindControl("txtEntidadIns")).Text;
        string c = ((TextBox)miGridView.FooterRow.FindControl("txtCuentaIns")).Text;
        
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



}