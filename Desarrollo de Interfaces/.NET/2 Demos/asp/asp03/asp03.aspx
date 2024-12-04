<%@ Page Language="C#" CodeFile="asp03.aspx.cs" Inherits="Default" %>
<html>
<head>
    <title>Ejemplo(ASP03).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="miPanel" runat="server" Height="50px" Width="225px">
        <asp:Label ID="Label1" runat="server" Text="D.N.I:"></asp:Label>
        <asp:TextBox ID="dni" runat="server" Columns="8" MaxLength="8"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Letra:"></asp:Label>
        <asp:TextBox ID="letra" runat="server" Columns="1" MaxLength="1"></asp:TextBox><br />
        <asp:Button ID="miBoton" runat="server" Text="Verificar" />
   </asp:Panel><br />
   <asp:Label ID="mensaje" runat="server" Text=""></asp:Label></form>
</body>
</html>
