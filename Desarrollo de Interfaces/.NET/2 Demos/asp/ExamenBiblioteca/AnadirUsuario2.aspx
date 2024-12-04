<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirUsuario2.aspx.cs" Inherits="AnadirUsuario2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
            DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [usuarios] WHERE [Id_Usuario] = ? AND [Nombre] = ? AND [DNI] = ?"
            InsertCommand="INSERT INTO [usuarios] ([Nombre], [DNI]) VALUES (?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [usuarios]"
            UpdateCommand="UPDATE [usuarios] SET [Nombre] = ?, [DNI] = ? WHERE [Id_Usuario] = ? AND [Nombre] = ? AND [DNI] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                <asp:Parameter Name="original_Nombre" Type="String" />
                <asp:Parameter Name="original_DNI" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="DNI" Type="String" />
                <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                <asp:Parameter Name="original_Nombre" Type="String" />
                <asp:Parameter Name="original_DNI" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Nombre" SessionField="Nombre" Type="String" />
                <asp:SessionParameter Name="DNI" SessionField="Dni" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
