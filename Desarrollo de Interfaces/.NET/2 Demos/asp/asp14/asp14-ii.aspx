<%@ Page Language="C#" CodeFile="~/asp14-ii.aspx.cs" Inherits="Default"%>
<html>
<!-- Notas
     Sobre el ejercicio anterior (asp13)
     
     
     · Manejo la excepción que se produce al intentar borrar un pedido
       que está facturado (evento OnRowDeleted).
     · Solicito al cliente la confirmación antes del borrado (TemplateField). Quitando el botón de borrar
       del CommandField y añadiendolo como un control asp en el ItemTemplate del TemplateField y
       deshabilitando la eliminación en el control.
     
-->
<head>
  <title>Ejemplo(ASP14).-</title>
</head>
<body>
    <form id="miForm" runat="server">
        <asp:GridView ID="miGridView" runat="server" 
                      AllowPaging="True" 
                      AllowSorting="True"
                      AutoGenerateColumns="False" 
                      DataKeyNames="idPedido" 
                      DataSourceID="susPedidos" 
                      EmptyDataText="SIN PEDIDOS"
                      OnRowDeleted="ControlDelBorrado">
            <Columns>
                <asp:CommandField ButtonType="Image" 
                     CancelImageUrl="~/imagenes/cancel.gif" 
                     EditImageUrl="~/imagenes/editar.gif" ShowEditButton="True"
                     UpdateImageUrl="~/imagenes/ok.gif" />
                <asp:TemplateField>
                   <ItemTemplate>
                                <asp:ImageButton ID="imbBorrar" runat="server" 
                                ImageUrl="~/imagenes/borrar.gif"
                                OnClientClick="return confirm('¿Realmente desea eliminar el pedido?');"
                                ToolTip="Eliminar"
                                CommandName="Delete" />         
                   </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="idPedido" HeaderText="#Pedido" ReadOnly="True" />
                <asp:BoundField DataField="fechaPedido" HeaderText="Fecha" ReadOnly="True" SortExpression="fechaPedido" />
                <asp:BoundField DataField="medioAbono" HeaderText="Forma de Pago" />
                <asp:BoundField DataField="entidadAbono" HeaderText="Entidad" />
                <asp:BoundField DataField="cuentaAbono" HeaderText="Cuenta" />
                <asp:CheckBoxField DataField="abonado" HeaderText="Abonado" SortExpression="abonado" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="susPedidos" runat="server" DataFile="~/App_Data/gestion.mdb"
            DeleteCommand="DELETE FROM [Pedidos] WHERE [idPedido] = ?" 
            SelectCommand="SELECT [idPedido], [fechaPedido], [medioAbono], [entidadAbono], [cuentaAbono], [abonado] FROM [Pedidos] WHERE ([idCliente] = ?)"
            UpdateCommand="UPDATE [Pedidos] SET [medioAbono] = ?, [entidadAbono] = ?, [cuentaAbono] = ?, [abonado] = ? WHERE [idPedido] = ?">
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
        <br />
        <asp:Label ID="mensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
