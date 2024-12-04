<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/usuarios.mdb"
            DeleteCommand="DELETE FROM [Tabla1]" InsertCommand="INSERT INTO [Tabla1] ([nombre], [apellidos], [telefono], [correo]) VALUES (?, ?, ?, ?)"
            SelectCommand="SELECT [id_user], [nombre], [apellidos], [telefono], [correo] FROM [Tabla1]"
            UpdateCommand="UPDATE [Tabla1] SET [nombre] = ?, [apellidos] = ?, [telefono] = ?, [correo] = ? WHERE [id_user] = ?">
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellidos" Type="String" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="id_user" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="nombre" SessionField="nombre" Type="String" />
                <asp:SessionParameter Name="apellidos" SessionField="apellidos" Type="String" />
                <asp:SessionParameter Name="telefono" SessionField="telefono" Type="String" />
                <asp:SessionParameter Name="correo" SessionField="correo" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
