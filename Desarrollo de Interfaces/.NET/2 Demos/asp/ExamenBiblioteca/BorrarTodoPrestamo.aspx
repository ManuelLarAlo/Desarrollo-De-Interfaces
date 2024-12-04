<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BorrarTodoPrestamo.aspx.cs" Inherits="BorrarTodoPrestamo" %>

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
                    PRESTAMOS</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AnadirPrestamo.aspx">Añadir Prestamo</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Devolucion.aspx">Devolucion</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ListarPrestamo.aspx">Listar Prestamos</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="BorrarPrestamo.aspx">Borrar Prestamo</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="BorrarTodoPrestamo.aspx">Borrar Todo</asp:HyperLink></td>
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
                <td style="width: 525px">
                    &nbsp;<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/biblioteca.mdb"
                        DeleteCommand="DELETE FROM prestamos"></asp:AccessDataSource>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
