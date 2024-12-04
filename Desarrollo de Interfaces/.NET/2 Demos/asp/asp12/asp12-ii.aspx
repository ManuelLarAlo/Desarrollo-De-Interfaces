<%@ Page Language="C#"%>
<html>
<head>
 <title>Ejemplo(ASP12).-</title>
</head>
<body>
    <form id="form" runat="server">
        <asp:GridView ID="miGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="idPedido"
            DataSourceID="susPedidos" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="idPedido" HeaderText="#Pedido" ReadOnly="True" SortExpression="idPedido" />
                <asp:BoundField DataField="fechaPedido" HeaderText="Fecha" SortExpression="fechaPedido" />
                <asp:BoundField DataField="medioAbono" HeaderText="Forma de Pago" SortExpression="medioAbono" />
                <asp:BoundField DataField="cuentaAbono" HeaderText="Cuenta Abono" SortExpression="cuentaAbono" />
                <asp:CheckBoxField DataField="abonado" HeaderText="Abonado" SortExpression="abonado" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="susPedidos" runat="server" DataFile="~/App_Data/gestion.mdb"
            SelectCommand="SELECT [idPedido], [fechaPedido], [medioAbono], [entidadAbono], [abonado], [cuentaAbono] FROM [Pedidos] WHERE ([idCliente] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="idCliente" QueryStringField="id" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
 
    </form>
</body>
</html>
