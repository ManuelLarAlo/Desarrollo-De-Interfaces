<%@ Page Language="C#" CodeFile="~/asp18-ii.aspx.cs" Inherits="Default" Debug="true" %>
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
<title>Ejemplo(ASP18).-</title>
</head>
<body>
    <form id="form" runat="server">
        <asp:GridView ID="miGridView" runat="server" 
             AllowPaging="True"
             PageSize="2"
             AutoGenerateColumns="False"
             DataKeyNames="idPedido" 
             DataSourceID="susPedidos"
             AllowSorting="True" 
             EmptyDataText="SIN PEDIDOS"
             OnRowDeleted="BorrarPedido"
             OnRowDataBound="GenerarFilas"
             OnRowUpdated="DespuesDeActualizarPedido"
             OnRowUpdating="AntesDeActualizarPedido"
             OnRowCommand="ClicEnComando"
             OnSelectedIndexChanged="PedidoSeleccionado" >
            <Columns>
                <asp:CommandField 
                     ButtonType="Image"
                     ShowEditButton="True"
                     EditImageUrl="~/imagenes/editar.gif"
                     CancelImageUrl="~/imagenes/cancel.gif"
                     UpdateImageUrl="~/imagenes/ok.gif" />
                <asp:TemplateField>
                      <ItemTemplate>
                           <asp:ImageButton ID="borrarIBT" runat="server" 
                                ImageUrl="~/imagenes/borrar.gif"
                                OnClientClick="return confirm('¿Realmente desea eliminar el pedido?');"
                                ToolTip="Eliminar"
                                CommandName="Delete" />
                      </ItemTemplate>
                      <HeaderTemplate>
                           <asp:ImageButton ID="INSERTAR" runat="server" 
                                ImageUrl="~/imagenes/nuevo.gif"
                                ToolTip="Nuevo pedido"
                                CommandName="INSERTAR" />
                      </HeaderTemplate>
                      <FooterTemplate>
                           <asp:ImageButton ID="insertarIBT" runat="server" 
                                ImageUrl="~/imagenes/ok.gif"
                                ToolTip="Confirmar"
                                CommandName="Insert"
                                onclick="Insertando"
                                 />
                           <asp:ImageButton ID="cancelarIBT" runat="server" 
                                ImageUrl="~/imagenes/cancel.gif"
                                ToolTip="Cancelar"
                                CommandName="Cancel"
                                 />
                      </FooterTemplate>
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
                          <asp:DropDownList ID="modosDDL" runat="server">
                               <asp:ListItem Value="0">Domiciliación Bancaria</asp:ListItem>
                               <asp:ListItem Value="1">Tarjeta de Crédito</asp:ListItem>
                               <asp:ListItem Value="2">Contra Reembolso</asp:ListItem>
                          </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                          <asp:DropDownList ID="insModosDDL" runat="server">
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
                          <asp:TextBox id="entidadTXB" runat="server" 
                               MaxLength="45"
                               Text='<%#Eval("entidadAbono") %>' />
                       </EditItemTemplate>
                       <FooterTemplate>
                       <asp:TextBox id="insEntidadTXB" runat="server" 
                               MaxLength="45" />
                       </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cuenta">
                     <Itemtemplate>
                        <%#Eval("cuentaAbono") %>
                     </Itemtemplate>
                     <EditItemTemplate>
                          <asp:TextBox id="cuentaTXB" runat="server"
                               MaxLength="20"
                               Text='<%#Eval("cuentaAbono") %>' />
                          <br />
                          <asp:CustomValidator ID="formatoCuenta" runat="server"
                               ClientValidationFunction="ValidarCuenta"
                               ControlToValidate="cuentaTXB" 
                               Display="Dynamic" 
                               ErrorMessage="El número de cuenta no tiene el formato adecuado" />
                      </EditItemTemplate>
                      <FooterTemplate>
                       <asp:TextBox id="insCuentaTXB" runat="server"
                               MaxLength="20" />
                       <br />
                       <asp:CustomValidator ID="formatoCuenta2" runat="server"
                               ClientValidationFunction="ValidarCuenta"
                               ControlToValidate="insCuentaTXB" 
                               Display="Dynamic" 
                               ErrorMessage="El número de cuenta no tiene el formato adecuado" />
                      </FooterTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField 
                     DataField="abonado" 
                     HeaderText="Abonado"
                     SortExpression="abonado" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
       
        <asp:DetailsView ID="misDetalles" runat="server" 
             AllowPaging="True" 
             AutoGenerateRows="False"
             DataKeyNames="idPedido,referencia" 
             DataSourceID="losDetalles"
             AutoGenerateDeleteButton="True"
             AutoGenerateEditButton="True"
             AutoGenerateInsertButton="True"
             OnItemUpdating="AntesDeActualizarDetalle"
             OnItemInserting="AntesDeInsertarDetalle" 
             OnItemInserted="DespuesDeInsertarDetalle" 
             EmptyDataText="SIN DETALLES">
            <Fields>
                <asp:BoundField DataField="idPedido" HeaderText="Detalles del pedido:" ReadOnly="True"  InsertVisible="False" />
                <asp:TemplateField HeaderText="Art&#237;culo">
                     <ItemTemplate>
                           <%# Eval("descripcion") %> 
                     </ItemTemplate>
                     <InsertItemTemplate>
                           <asp:DropDownList ID="articulosDDL" runat="server" 
                                DataSourceID="losArticulos" 
                                DataTextField="descripcion" 
                                DataValueField="referencia"  
                                OnSelectedIndexChanged="PonerPrecio"
                                AutoPostBack="true"
                                AppendDataBoundItems="true">
                              <asp:ListItem Text="[Seleccione un Artículo]" Value="0" />
                           </asp:DropDownList>
                     </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="cantidad" HeaderText="Cantidad:"  />
                <asp:TemplateField HeaderText="Precio:">
                     <ItemTemplate>
                           <%# Eval("pvp") %> 
                     </ItemTemplate>
                     <EditItemTemplate>
                           <asp:TextBox ID="edtPvpTXB" runat="server"
                                Text='<%# Eval("pvp") %>'>
                           </asp:TextBox>
                     </EditItemTemplate>
                     <InsertItemTemplate>
                           <asp:TextBox ID="insPvpTXB" runat="server">
                           </asp:TextBox>
                     </InsertItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="parcial" HeaderText="Importe:" ReadOnly="True" InsertVisible="False"/>
            </Fields>
        </asp:DetailsView>
        
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
        
        <asp:AccessDataSource ID="losDetalles" runat="server" DataFile="~/App_Data/gestion.mdb"
            DeleteCommand="DELETE FROM [Detalles] WHERE [idPedido] = ? AND [referencia] = ?"
            InsertCommand="INSERT INTO [Detalles] ([idPedido], [referencia], [cantidad], [pvp]) VALUES (?,?,?,?)"
            SelectCommand="SELECT [idPedido], [Detalles].[referencia], [cantidad], [pvp],[cantidad]*[pvp] as parcial,[descripcion] FROM [Detalles] INNER JOIN [Articulos] ON [Detalles].[referencia]=[Articulos].[referencia] WHERE ([idPedido] = ?)"
            UpdateCommand="UPDATE [Detalles] SET [cantidad] = ?, [pvp] = ? WHERE [idPedido] = ? AND [referencia] = ?">
            <DeleteParameters>
                <asp:Parameter Name="idPedido" Type="Int32" />
                <asp:Parameter Name="referencia" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="cantidad" Type="Int16" />
                <asp:Parameter Name="pvp" Type="Decimal" />
                <asp:Parameter Name="idPedido" Type="Int32" />
                <asp:Parameter Name="referencia" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="miGridView" Name="idPedido" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="idPedido" Type="Int32" />
                <asp:Parameter Name="referencia" Type="String" />
                <asp:Parameter Name="cantidad" Type="Int16" />
                <asp:Parameter Name="pvp" Type="Decimal" />
            </InsertParameters>
         </asp:AccessDataSource>
        
        <asp:AccessDataSource ID="losArticulos" runat="server" DataFile="~/App_Data/gestion.mdb"
               SelectCommand="SELECT [descripcion], [referencia] FROM [Articulos] ORDER BY [descripcion]">
        </asp:AccessDataSource>
        
        <asp:Label ID="mensaje" runat="server"></asp:Label>
        
    </form>
</body>
</html>
