<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirObra2.aspx.cs" Inherits="AnadirObra2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
            DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [libros] WHERE [Id_Libro] = ? AND [Autor] = ? AND [Editorial] = ? AND [Nombre] = ?"
            InsertCommand="INSERT INTO [libros] ([Autor], [Editorial], [Nombre]) VALUES (?, ?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [libros]"
            UpdateCommand="UPDATE [libros] SET [Autor] = ?, [Editorial] = ?, [Nombre] = ? WHERE [Id_Libro] = ? AND [Autor] = ? AND [Editorial] = ? AND [Nombre] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_Id_Libro" Type="Int32" />
                <asp:Parameter Name="original_Autor" Type="String" />
                <asp:Parameter Name="original_Editorial" Type="String" />
                <asp:Parameter Name="original_Nombre" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Autor" Type="String" />
                <asp:Parameter Name="Editorial" Type="String" />
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="original_Id_Libro" Type="Int32" />
                <asp:Parameter Name="original_Autor" Type="String" />
                <asp:Parameter Name="original_Editorial" Type="String" />
                <asp:Parameter Name="original_Nombre" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Autor" SessionField="Autor" Type="String" />
                <asp:SessionParameter Name="Editorial" SessionField="Editorial" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="Nombre" SessionField="Titulo" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
