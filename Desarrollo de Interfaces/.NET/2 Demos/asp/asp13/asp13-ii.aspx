<%@ Page Language="C#"%>
<html>
<!-- Notas
     · Como la fecha del pedido no la dejo cambiar (ReadOnly=true) , elimino esta columna
       dela instrucción update y su parámetro correspondiente.
     · El GridView de forma nativa no soporta la inserción.
     · La sentencia Insert que me genera, por el momento no me vale para
       nada, la suprimo y sus parámetros asociados.
     · Establezco la posibilidad de ordenación (SortExpression) solo por la fecha y por el abonado.
     · Por el momento no controlamos el borrado que infringa la FK (Pedidos facturados).
-->
<head>
  <title>Ejemplo(ASP13).-</title>
</head>
<body>
    <form id="miForm" runat="server">
        <asp:GridView ID="miGridView" runat="server" 
                      AllowPaging="True" 
                      AllowSorting="True"
                      AutoGenerateColumns="False" 
                      DataKeyNames="idPedido" 
                      DataSourceID="susPedidos" 
                      EmptyDataText="SIN PEDIDOS">
            <Columns>
                <asp:CommandField ButtonType="Image" 
                     CancelImageUrl="~/imagenes/cancel.gif" 
                     DeleteImageUrl="~/imagenes/borrar.gif"
                     EditImageUrl="~/imagenes/editar.gif" 
                     ShowDeleteButton="True" ShowEditButton="True"
                     UpdateImageUrl="~/imagenes/ok.gif" />
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
    </form>
</body>
</html>
