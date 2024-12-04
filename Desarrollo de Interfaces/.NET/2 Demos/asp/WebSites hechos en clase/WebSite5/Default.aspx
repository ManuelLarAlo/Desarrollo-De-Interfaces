<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="AccessDataSource1" DataTextField="nombre"
            DataValueField="nif"></asp:ListBox><asp:AccessDataSource ID="AccessDataSource1" runat="server"
                DataFile="~/App_Data/evalua.mdb" SelectCommand="SELECT [nif], [nombre] FROM [Alumnos] WHERE ([baja] = ?)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="false" Name="baja2" Type="Boolean" />
                </SelectParameters>
            </asp:AccessDataSource>
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" /><br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1">Evaluaci&#243;n 1</asp:ListItem>
            <asp:ListItem Value="2">Evaluaci&#243;n 2</asp:ListItem>
            <asp:ListItem Value="3">Tercera Evaluaci&#243;n</asp:ListItem>
            <asp:ListItem Value="J">Ordinaria</asp:ListItem>
            <asp:ListItem Value="S">Extraordinaria</asp:ListItem>
        </asp:DropDownList><br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enviar" /></div>
    </form>
</body>
</html>
