<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 74px; height: 65px">
                    <asp:Label ID="Label1" runat="server" Text="Proveedor"></asp:Label></td>
                <td style="width: 2px; height: 65px">
                    :</td>
                <td style="width: 246px; height: 65px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="Proveedores"
                        DataTextField="nombre" DataValueField="idProveedor">
                    </asp:DropDownList><asp:AccessDataSource ID="Proveedores" runat="server" DataFile="~/App_Data/gestion.mdb"
                        SelectCommand="SELECT [idProveedor], [nombre] FROM [Proveedores] ORDER BY [nombre]">
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 74px; height: 81px">
                    <asp:Label ID="Label2" runat="server" Text="Articulos"></asp:Label></td>
                <td style="width: 2px; height: 81px">
                    :</td>
                <td style="width: 246px; height: 81px">
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="Articulos" DataTextField="descripcion"
                        DataValueField="descripcion" Width="234px"></asp:ListBox><asp:AccessDataSource ID="Articulos"
                            runat="server" DataFile="~/App_Data/gestion.mdb" SelectCommand="SELECT [descripcion] FROM [Articulos] WHERE ([idProveedor] = ?) ORDER BY [descripcion]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="idProveedor" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 74px">
                </td>
                <td style="width: 2px">
                </td>
                <td style="width: 246px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
