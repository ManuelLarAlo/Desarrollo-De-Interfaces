<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="mensaje" runat="server"></asp:Label><br />
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
            <asp:Label ID="Label3" runat="server" Text="Pedidos"></asp:Label><br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">Pedido1</asp:ListItem>
                <asp:ListItem Value="2">Pedido2</asp:ListItem>
            </asp:DropDownList></asp:Panel>
    
    </div>
    </form>
</body>
</html>
