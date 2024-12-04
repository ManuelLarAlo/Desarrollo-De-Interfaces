<%@ Page Language="C#" CodeFile="asp05.aspx.cs" Inherits="Default" %>
<html>
<head runat="server">
    <title>Ejemplo(ASP05).-</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Fecha de conexión:<asp:Label ID="fecha" runat="server" ></asp:Label><br />
        Hora de conexión:
        <asp:Label ID="hora" runat="server" ></asp:Label><br />
        Usuarios activos:
        <asp:Label ID="usuariosOnline" runat="server"></asp:Label>
        <br />
        Usuario nº:<asp:Label ID="usuario" runat="server"></asp:Label></div>
    </form>
</body>
</html>
