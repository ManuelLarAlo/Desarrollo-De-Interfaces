<%@ Page Language="C#"  CodeFile="~/asp09.aspx.cs" Inherits="Default" Debug="true"%>


<html>
<head runat="server">
    <title>Ejemplo(ASP09).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3">
                    <strong><span style="font-size: 11pt; text-decoration: underline">ALTA DE UN CLIENTE<br />
                    </span></strong><strong><span style="text-decoration: underline"></span></strong>
                </td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Nif</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtNif" runat="server" MaxLength="9" Font-Size="Small" Width="100px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Primer apellido</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtApellido1" runat="server" MaxLength="25" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Segundo Apellido</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtApellido2" runat="server" MaxLength="25" Width="300px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Nombre</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="20" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Sexo</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:DropDownList ID="ddlSexo" runat="server">
                        <asp:ListItem Selected="True">V</asp:ListItem>
                        <asp:ListItem>H</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    C. Postal</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtCpostal" runat="server" MaxLength="5" Width="50px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Email</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="80" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Descuento</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtDesc" runat="server" MaxLength="5" Width="50px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="font-size: 11pt; width: 120px; color: black; font-family: Arial">
                </td>
                <td style="width: 6px">
                </td>
                <td style="width: 412px; text-align: right">
                    <asp:Button ID="btRegistro" runat="server" OnClick="Registrar" Text="Registrar" /></td>
            </tr>
        </table>
    
    </div>
        <asp:Label ID="mensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
