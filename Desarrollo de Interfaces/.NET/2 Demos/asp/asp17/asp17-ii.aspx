<%@ Page Language="C#" %>


<html >
<head runat="server">
    <title>Ejemplo(ASP17).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idPedido"
            DataSourceID="susPedidos" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idPedido" HeaderText="idPedido" InsertVisible="False"
                    ReadOnly="True" SortExpression="idPedido" />
                <asp:BoundField DataField="fechaPedido" HeaderText="fechaPedido" SortExpression="fechaPedido" />
                <asp:BoundField DataField="medioAbono" HeaderText="medioAbono" SortExpression="medioAbono" />
                <asp:BoundField DataField="entidadAbono" HeaderText="entidadAbono" SortExpression="entidadAbono" />
                <asp:BoundField DataField="cuentaAbono" HeaderText="cuentaAbono" SortExpression="cuentaAbono" />
                <asp:CheckBoxField DataField="abonado" HeaderText="abonado" SortExpression="abonado" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="susPedidos" runat="server" DataFile="~/App_Data/gestion.mdb"
            SelectCommand="SELECT [idPedido], [fechaPedido], [medioAbono], [entidadAbono], [cuentaAbono], [abonado] FROM [Pedidos] WHERE ([idCliente] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="idCliente" SessionField="idCliente" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="losDetalles"
            Height="50px" Width="125px" AllowPaging="True">
            <Fields>
                <asp:BoundField DataField="idPedido" HeaderText="idPedido" SortExpression="idPedido" />
                <asp:BoundField DataField="referencia" HeaderText="referencia" SortExpression="referencia" />
                <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                <asp:BoundField DataField="pvp" HeaderText="pvp" SortExpression="pvp" />
                <asp:BoundField DataField="parcial" HeaderText="parcial" ReadOnly="True" SortExpression="parcial" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="losDetalles" runat="server" DataFile="~/App_Data/gestion.mdb"
            SelectCommand="SELECT [idPedido], [Detalles].[referencia], [cantidad], [pvp],[cantidad]*[pvp] as parcial,[descripcion] FROM [Detalles] INNER JOIN [Articulos] ON [Detalles].[referencia]=[Articulos].[referencia] WHERE [idPedido] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
