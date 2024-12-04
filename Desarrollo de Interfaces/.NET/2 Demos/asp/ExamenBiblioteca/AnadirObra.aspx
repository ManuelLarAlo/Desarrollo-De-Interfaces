<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirObra.aspx.cs" Inherits="AnadirObra" %>

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
                    OBRAS</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AnadirObra.aspx">Añadir Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ListarObra.aspx">Listar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ModificarObra.aspx">Modificar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="BorrarObra.aspx">Borrar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="BorrarTodoObra.aspx">Borrar Todo</asp:HyperLink></td>
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
                    <asp:Label ID="Label1" runat="server" Text="Título:" Width="75px"></asp:Label>
                    <asp:TextBox ID="titulo" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label2" runat="server" Text="Autor: " Width="74px"></asp:Label>
                    <asp:TextBox ID="autor" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label3" runat="server" Text="Editorial: " Width="74px"></asp:Label>
                    <asp:TextBox ID="editorial" runat="server"></asp:TextBox><br />
                    <asp:Button ID="Enviar" runat="server" OnClick="Enviar_Click" Text="Añadir" Width="235px" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="titulo"
                        ErrorMessage="El campo Título no puede estar vacio"></asp:RequiredFieldValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="autor"
                        ErrorMessage="El campo Autor no puede estar vacio" Width="278px"></asp:RequiredFieldValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="editorial"
                        ErrorMessage="El campo Editorial no puede estar vacio"></asp:RequiredFieldValidator></td>
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
