<%@ Page Language="C#"  CodeFile="~/asp10.aspx.cs" Inherits="Default" Debug="true"%>

<script language="javascript">

function ValidarEmail(source,arguments)
{
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(arguments.Value))
	   arguments.IsValid=true;
    else
	   arguments.IsValid=false;
}

</script>

<html>
<head runat="server">
    <title>Ejemplo(ASP10).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3" style="height: 21px">
                    <strong><span style="font-size: 11pt; text-decoration: underline">ALTA DE UN CLIENTE<br />
                    </span></strong><strong><span style="text-decoration: underline"></span></strong>
                </td>
                <td colspan="1" style="height: 21px">
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
                <td style="width: 412px">
                    <asp:RequiredFieldValidator ID="reqlNif" runat="server" ControlToValidate="txtNif"
                        ErrorMessage="Debe introducir un valor para el NIF." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regNif" runat="server" ControlToValidate="txtNif"
                        Display="None" ErrorMessage="El NIF no tiene el formato adecuado." ValidationExpression="\d{8}([a-z]|[A-Z])"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="okNif" runat="server" ControlToValidate="txtNif" Display="None"
                        ErrorMessage="El valor introducido no corresponde a un NIF correcto." OnServerValidate="ValidarNif"></asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Primer apellido</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtApellido1" runat="server" MaxLength="25" Width="300px"></asp:TextBox></td>
                <td style="width: 412px">
                    <asp:RequiredFieldValidator ID="reqApellido1" runat="server" ErrorMessage="El primer apellido es obligatorio." ControlToValidate="txtApellido1" Display="None"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Segundo Apellido</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtApellido2" runat="server" MaxLength="25" Width="300px"></asp:TextBox></td>
                <td style="width: 412px">
                    <asp:RequiredFieldValidator ID="reqApellido2" runat="server" ErrorMessage="El segundo apellido es obligatorio." ControlToValidate="txtApellido2" Display="None"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial; height: 26px;">
                    <span style="font-size: 10pt">
                    Nombre</span></td>
                <td style="width: 6px; height: 26px;">
                    :</td>
                <td style="width: 412px; height: 26px;">
                    <asp:TextBox ID="txtNombre" runat="server" MaxLength="20" Width="250px"></asp:TextBox></td>
                <td style="width: 412px; height: 26px;">
                    <asp:RequiredFieldValidator ID="reqNombre" runat="server" ErrorMessage="El nombre es obligatorio." ControlToValidate="txtNombre" Display="None"></asp:RequiredFieldValidator></td>
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
                <td style="width: 412px">
                </td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    C. Postal</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtCpostal" runat="server" MaxLength="5" Width="50px"></asp:TextBox></td>
                <td style="width: 412px">
                    <asp:RequiredFieldValidator ID="reqCpostal" runat="server" ErrorMessage="Le falta por introducir el código postal." ControlToValidate="txtCpostal" Display="None"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regCpostal" runat="server" ControlToValidate="txtCpostal"
                        Display="None" ErrorMessage="El código postal debe contener 5 dígitos." ValidationExpression="\d{5}"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Email</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="80" Width="400px"></asp:TextBox></td>
                <td style="width: 412px">
                    <asp:CustomValidator ID="okEmail" runat="server" ClientValidationFunction="ValidarEmail"
                        ControlToValidate="txtEmail" Display="None" ErrorMessage="El email introducido no corresponde a una dirección de correo válida."></asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 120px; font-size: 11pt; color: black; font-family: Arial;">
                    <span style="font-size: 10pt">
                    Descuento</span></td>
                <td style="width: 6px">
                    :</td>
                <td style="width: 412px">
                    <asp:TextBox ID="txtDescuento" runat="server" Width="50px"></asp:TextBox></td>
                <td style="width: 412px">
                    <asp:RequiredFieldValidator ID="reqDescuento" runat="server" ErrorMessage="Introduzca un descuento de cliente." ControlToValidate="txtDescuento" Display="None" ></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="chkDescuento" runat="server" ErrorMessage="El descuento debe estar entre 0 y 25." ControlToValidate="txtDescuento" Display="None" MaximumValue="25" MinimumValue="0" Type="Double"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="font-size: 11pt; width: 120px; color: black; font-family: Arial">
                </td>
                <td style="width: 6px">
                </td>
                <td style="width: 412px; text-align: right">
                    <asp:Button ID="btRegistro" runat="server" OnClick="Registrar" Text="Registrar" /></td>
                <td style="width: 412px; text-align: right">
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="resumenErrores" runat="server" HeaderText="Compruebe y solucione los siguientes errores:"
            ShowMessageBox="True" ShowSummary="False" />
        <br />
    
    </div>
        <asp:Label ID="mensaje" runat="server"></asp:Label>
    </form>
</body>
</html>
