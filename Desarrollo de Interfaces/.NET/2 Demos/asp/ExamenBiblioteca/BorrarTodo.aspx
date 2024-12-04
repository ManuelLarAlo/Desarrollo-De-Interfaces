<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BorrarTodo.aspx.cs" Inherits="BorrarTodo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 584px">
            <tr>
                <td style="width: 94px">
                    BIBLIOTECA</td>
                <td style="width: 27px; text-align: center">
                    -</td>
                <td>
                    INICIO</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Obra.aspx">Obras</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Usuario.aspx">Usuarios</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Prestamo.aspx">Prestamos</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="BorrarTodo.aspx">Borrar Todo</asp:HyperLink>&nbsp;
                </td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 525px">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 525px; height: 164px;">
                    &nbsp;<br />
                    <br />
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/biblioteca.mdb"
                        DeleteCommand="DELETE FROM prestamos"></asp:AccessDataSource>
                    <br />
                    &nbsp;<br />
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/biblioteca.mdb"
                        DeleteCommand="DELETE FROM libros"></asp:AccessDataSource>
                    <br />
                    &nbsp;<asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/biblioteca.mdb"
                        DeleteCommand="DELETE FROM usuarios"></asp:AccessDataSource>
                </td>
                <td style="height: 164px">
                </td>
                <td style="height: 164px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
