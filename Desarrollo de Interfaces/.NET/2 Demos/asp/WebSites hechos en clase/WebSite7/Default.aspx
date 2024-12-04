<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp;
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="nombre,apellidos"
            DataSourceID="AccessDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" ReadOnly="True" SortExpression="apellidos" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/usuarios.mdb"
            DeleteCommand="DELETE FROM [Tabla1] WHERE [nombre] = ? AND [apellidos] = ?" InsertCommand="INSERT INTO [Tabla1] ([nombre], [apellidos], [telefono], [correo]) VALUES (?, ?, ?, ?)"
            SelectCommand="SELECT [nombre], [apellidos], [telefono], [correo] FROM [Tabla1]"
            UpdateCommand="UPDATE [Tabla1] SET [telefono] = ?, [correo] = ? WHERE [nombre] = ? AND [apellidos] = ?">
            <DeleteParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
