<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirPrestamo2.aspx.cs" Inherits="AnadirPrestamo2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
            DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [prestamos] WHERE [Id_Prestamo] = ? AND [Id_Usuario] = ? AND [Id_Libro] = ? AND [Fecha_Prestamo] = ? AND [Fecha_Devolucion] = ?"
            InsertCommand="INSERT INTO [prestamos] ([Id_Usuario], [Id_Libro], [Fecha_Prestamo]) VALUES (?, ?, ?)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [prestamos]"
            UpdateCommand="UPDATE [prestamos] SET [Id_Usuario] = ?, [Id_Libro] = ?, [Fecha_Prestamo] = ?, [Fecha_Devolucion] = ? WHERE [Id_Prestamo] = ? AND [Id_Usuario] = ? AND [Id_Libro] = ? AND [Fecha_Prestamo] = ? AND [Fecha_Devolucion] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_Id_Prestamo" Type="Int32" />
                <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                <asp:Parameter Name="original_Id_Libro" Type="Int32" />
                <asp:Parameter Name="original_Fecha_Prestamo" Type="String" />
                <asp:Parameter Name="original_Fecha_Devolucion" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                <asp:Parameter Name="Id_Libro" Type="Int32" />
                <asp:Parameter Name="Fecha_Prestamo" Type="String" />
                <asp:Parameter Name="Fecha_Devolucion" Type="String" />
                <asp:Parameter Name="original_Id_Prestamo" Type="Int32" />
                <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                <asp:Parameter Name="original_Id_Libro" Type="Int32" />
                <asp:Parameter Name="original_Fecha_Prestamo" Type="String" />
                <asp:Parameter Name="original_Fecha_Devolucion" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="Id_Usuario" SessionField="usuario" Type="Int32" />
                <asp:SessionParameter Name="Id_Libro" SessionField="libro" Type="Int32" />
                <asp:SessionParameter Name="Fecha_Prestamo" SessionField="prestamo" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
