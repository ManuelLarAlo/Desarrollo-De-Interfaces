<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirUsuario.aspx.cs" Inherits="AnadirUsuario" %>

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
                    USUARIOS</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AnadirUsuario.aspx">Añadir Usuario</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ListarUsuario.aspx">Listar Usuario</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ModificarUsuario.aspx">Modificar Usuario</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="BorrarUsuario.aspx">Borrar Usuario</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="BorrarTodoUsuario.aspx">Borrar Todo</asp:HyperLink></td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 525px">
                    <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
                    <asp:TextBox ID="nombre" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label2" runat="server" Text="DNI: " Width="54px"></asp:Label>
                    <asp:TextBox ID="dni" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nombre"
                        ErrorMessage="El campo Nombre no puede estar vacio"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dni"
                        ErrorMessage="El campo DNI no puede estar vacio" Width="241px"></asp:RequiredFieldValidator></td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 525px">
                    <asp:Button ID="enviar" runat="server" OnClick="enviar_Click" Text="Añadir" Width="215px" /></td>
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
