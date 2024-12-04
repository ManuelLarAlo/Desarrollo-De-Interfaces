<%@ Page Language="C#" CodeFile="~/asp16-ii.aspx.cs" Inherits="Default" Debug="true" %>
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
<title>Ejemplo(ASP16).-</title>
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
             OnRowUpdating="AntesDeActualizar"
             OnRowCommand="ClicEnCommand"
             ShowFooter="false" >
            <Columns>
                <asp:CommandField 
                     ButtonType="Image"
                     ShowEditButton="True"
                     EditImageUrl="~/imagenes/editar.gif"
                     CancelImageUrl="~/imagenes/cancel.gif"
                     UpdateImageUrl="~/imagenes/ok.gif" />
                <asp:TemplateField>
                      <ItemTemplate>
                           <asp:ImageButton ID="imbBorrar" runat="server" 
                                ImageUrl="~/imagenes/borrar.gif"
                                OnClientClick="return confirm('¿Realmente desea eliminar el pedido?');"
                                ToolTip="Eliminar"
                                CommandName="Delete" />
                      </ItemTemplate>
                      <HeaderTemplate>
                           <asp:ImageButton ID="imbInsertar" runat="server" 
                                ImageUrl="~/imagenes/nuevo.gif"
                                ToolTip="Nuevo pedido"
                                CommandName="cmdInsertar" />
                      </HeaderTemplate>
                      <FooterTemplate>
                           <asp:ImageButton ID="imbOkInsertar" runat="server" 
                                ImageUrl="~/imagenes/ok.gif"
                                ToolTip="Confirmar"
                                CommandName="Insert"
                                onclick="Insertando"
                                 />
                           <asp:ImageButton ID="imbCancelarInsertar" runat="server" 
                                ImageUrl="~/imagenes/cancel.gif"
                                ToolTip="Cancelar"
                                CommandName="Cancel"
                                 />
                      </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField
                     DataField="idPedido" 
                     HeaderText="#Pedido"
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
                          <asp:DropDownList ID="dllModos" runat="server">
                               <asp:ListItem Value="0">Domiciliación Bancaria</asp:ListItem>
                               <asp:ListItem Value="1">Tarjeta de Crédito</asp:ListItem>
                               <asp:ListItem Value="2">Contra Reembolso</asp:ListItem>
                          </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                          <asp:DropDownList ID="dllModosIns" runat="server">
                               <asp:ListItem Value="0">Domiciliación Bancaria</asp:ListItem>
                               <asp:ListItem Value="1">Tarjeta de Crédito</asp:ListItem>
                               <asp:ListItem Value="2">Contra Reembolso</asp:ListItem>
                          </asp:DropDownList>
                    </FooterTemplate>
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
                       <FooterTemplate>
                       <asp:TextBox id="txtEntidadIns" runat="server" 
                               MaxLength="45" />
                       </FooterTemplate>
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
                      <FooterTemplate>
                       <asp:TextBox id="txtCuentaIns" runat="server"
                               MaxLength="20" />
                       <br />
                       <asp:CustomValidator ID="valCuenta2" runat="server"
                               ClientValidationFunction="ValidarCuenta"
                               ControlToValidate="txtCuentaIns" 
                               Display="Dynamic" 
                               ErrorMessage="El número de cuenta no tiene el formato adecuado" />
                      </FooterTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField 
                     DataField="abonado" 
                     HeaderText="Abonado"
                     SortExpression="abonado" />
            </Columns>
        </asp:GridView>
                 
        
        <asp:Label ID="mensaje" runat="server"></asp:Label>
        <asp:AccessDataSource ID="susPedidos" runat="server" DataFile="~/App_Data/gestion.mdb"
            DeleteCommand="DELETE FROM [Pedidos] WHERE [idPedido] = ?" 
            InsertCommand="INSERT INTO Pedidos (idCliente,fechaPedido,medioAbono,entidadAbono,cuentaAbono,abonado) VALUES (?,?,?,?,?,?)"
            SelectCommand="SELECT * FROM [Pedidos] WHERE ([idCliente] = ?)" 
            UpdateCommand="UPDATE [Pedidos] SET [medioAbono] = ?, [entidadAbono] = ?, [cuentaAbono] = ?, [abonado] = ? WHERE [idPedido] = ?"
            OnInserting="AntesDeInsertar"
            OnInserted ="DespuesDeInsertar">
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
                <asp:SessionParameter Name="idCliente" SessionField="idCliente" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="idCliente" Type="String" />
                <asp:Parameter Name="fechaPedido" Type="DateTime" />
                <asp:Parameter Name="medioAbono" Type="String" />
                <asp:Parameter Name="entidadAbono" Type="String" />
                <asp:Parameter Name="cuentaAbono" Type="String" />
                <asp:Parameter Name="abonado" Type="Boolean" />
            </InsertParameters>
        </asp:AccessDataSource>


    </form>
</body>
</html>
