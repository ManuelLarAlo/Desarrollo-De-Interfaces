<%@ Page Language="C#" CodeFile="asp04.aspx.cs" Inherits="Default" Debug="true"%>
<%@ Assembly Name="consultas" %>
<html>
<head>
    <title>Ejemplo(ASP04).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Nif:&nbsp;&nbsp;
        <asp:TextBox ID="nif" runat="server" AutoPostBack="True"></asp:TextBox>
        <br />
        <asp:Label ID="mensaje" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="Panel" runat="server" Height="50px" Visible="False" Width="125px">
            Pedidos:<asp:DropDownList ID="losPedidos"  runat="server">
        </asp:DropDownList></asp:Panel>
    </div>
    </form>
</body>
</html>