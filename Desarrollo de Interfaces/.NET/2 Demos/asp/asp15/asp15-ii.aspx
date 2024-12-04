<%@ Page Language="C#" CodeFile="~/asp15-ii.aspx.cs" Inherits="Default" %>
<html>
<head>

<script language="javascript">
   
    function ValidarCuenta(source,arguments)
    { 
      arguments.IsValid=false;
      for (i=0;i<document.forms[0].elements.length;i++) 
      {
         if(document.forms[0].elements[i].type == "select-one") 
         {
            if (document.forms[0].elements[i].value == "0" && /(\d{20})/.test(arguments.Value))
               arguments.IsValid=true;
 	        if (document.forms[0].elements[i].value == "1" && /(\d{14,20})/.test(arguments.Value))
 	           arguments.IsValid=true;
 	        if (document.forms[0].elements[i].value == "2")
 	           arguments.IsValid=true;
         } 
       }
    }
    
</script>
<title>Ejemplo(ASP15).-</title>
</head>
<body>
    <form id="form" runat="server">
        <asp:GridView ID="miGridView" runat="server" 
             AllowPaging="True"
             PageSize="3"
             AutoGenerateColumns="False"
             DataKeyNames="idPedido" 
             DataSourceID="susPedidos"
             AllowSorting="True" 
             EmptyDataText="SIN PEDIDOS"
             OnRowDeleted="ControlDelBorrado"
             OnRowDataBound="GenerarFilas" 
             OnRowUpdated="DespuesDeActualizar"
             OnRowUpdating="AntesDeActualizar">
            <Columns>
                <asp:CommandField 
                     ButtonType="Image"
                     ShowEditButton="True"
                     EditImageUrl="~/imagenes/editar.gif"
                     CancelImageUrl="~/imagenes/cancel.gif"
                     UpdateImageUrl="~/imagenes/ok.gif"   />
                <asp:TemplateField>
                      <ItemTemplate>
                           <asp:ImageButton ID="imbBorrar" runat="server" 
                                ImageUrl="~/imagenes/borrar.gif"
                                OnClientClick="return confirm('¿Realmente desea eliminar el pedido?');"
                                ToolTip="Eliminar"
                                CommandName="Delete" />
                      </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField
                     DataField="idPedido" 
                     HeaderText="# Pedido"
                     ReadOnly="True" />
                <asp:BoundField 
                     DataField="fechaPedido" 
                     HeaderText="Fecha"
                     SortExpression="fechaPedido"
                     ReadOnly="True" />
                <asp:TemplateField HeaderText="Modo Pago">
                     <ItemTemplate>
                        <%#Eval("medioAbono") %>
                     </ItemTemplate>
                     <EditItemTemplate>
                          <asp:DropDownList ID="ddlModos" runat="server">
                               <asp:ListItem Value="0">Domiciliación Bancaria</asp:ListItem>
                               <asp:ListItem Value="1">Tarjeta de Crédito</asp:ListItem>
                               <asp:ListItem Value="2">Contra Reembolso</asp:ListItem>
                          </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entidad">
                     <Itemtemplate>
                        <%#Eval("entidadAbono") %>
                     </Itemtemplate>
                     <EditItemTemplate>
                          <asp:TextBox id="txtEntidad" runat="server" 
                               MaxLength="45"
                               Text='<%#Eval("entidadAbono") %>' />
                       </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cuenta">
                     <Itemtemplate>
                        <%#Eval("cuentaAbono") %>
                     </Itemtemplate>
                     <EditItemTemplate>
                          <asp:TextBox id="txtCuenta" runat="server"
                               MaxLength="20"
                               Text='<%#Eval("cuentaAbono") %>' />
                          <br />
                          <asp:CustomValidator ID="valCuenta" runat="server"
                               ClientValidationFunction="ValidarCuenta"
                               ControlToValidate="txtCuenta" 
                               Display="Dynamic" 
                               ErrorMessage="El número de cuenta no tiene el formato adecuado" />
                       </EditItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField 
                     DataField="abonado" 
                     HeaderText="Abonado"
                     SortExpression="abonado" />
            </Columns>
        </asp:GridView>
         <asp:AccessDataSource ID="susPedidos" runat="server" DataFile="~/App_Data/gestion.mdb"
            DeleteCommand="DELETE FROM [Pedidos] WHERE [idPedido] = @idPedido" 
            SelectCommand="SELECT [idPedido], [fechaPedido], [medioAbono], [entidadAbono], [cuentaAbono], [abonado] FROM [Pedidos] WHERE ([idCliente] = @idCliente)"
            UpdateCommand="UPDATE [Pedidos] SET [medioAbono] = @medioAbono, [entidadAbono] = @entidadAbono, [cuentaAbono] = @cuentaAbono, [abonado] = @abonado WHERE [idPedido] = @idPedido">
            <DeleteParameters>
                <asp:Parameter Name="idPedido" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="medioAbono" Type="String" />
                <asp:Parameter Name="entidadAbono" Type="String" />
                <asp:Parameter Name="cuentaAbono" Type="String" />
                <asp:Parameter Name="abonado" Type="Boolean" />
                <asp:Parameter Name="idPedido" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="idCliente" QueryStringField="id" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:Label ID="mensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
