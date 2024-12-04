<%@ Page Language="C#"  %>

<html>
<head runat="server">
    <title>Ejemplo(ASP11).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<br />
        <table>
            <tr>
                <td style="width: 3px">
                    &nbsp;Proveedores</td>
                <td style="width: 3px">
                    :</td>
                <td style="width: 143px">
                    <asp:DropDownList ID="ddlProveedores" runat="server" AutoPostBack="True" Width="250px" DataSourceID="losProveedores" DataTextField="nombre" DataValueField="idProveedor">
        </asp:DropDownList><asp:AccessDataSource ID="losProveedores" runat="server" DataFile="~/App_Data/gestion.mdb"
                        SelectCommand="SELECT [idProveedor], [nombre] FROM [Proveedores] ORDER BY [nombre]"> 
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 3px">
                    Artículos</td>
                <td style="width: 3px">
                    :</td>
                <td style="width: 143px">
                    <asp:ListBox ID="lbArticulos" runat="server" Width="250px" DataSourceID="susArticulos" DataTextField="descripcion" DataValueField="descripcion"></asp:ListBox><asp:AccessDataSource ID="susArticulos" runat="server" DataFile="~/App_Data/gestion.mdb"
                        SelectCommand="SELECT [descripcion] FROM [Articulos] WHERE ([idProveedor] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlProveedores" Name="idProveedor" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 3px">
                </td>
                <td style="width: 3px">
                </td>
                <td style="width: 143px">
                    </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
