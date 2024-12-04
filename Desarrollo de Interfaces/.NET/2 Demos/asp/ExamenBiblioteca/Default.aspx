<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" DataKeyNames="Id_Prestamo">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Id_Prestamo" HeaderText="Id_Prestamo" InsertVisible="False"
                    SortExpression="Id_Prestamo" >
                    <ItemStyle Height="0px" Width="0px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                <asp:BoundField DataField="libro" HeaderText="libro" SortExpression="libro" />
                <asp:BoundField DataField="Fecha_Prestamo" HeaderText="Fecha_Prestamo" SortExpression="Fecha_Prestamo" />
                <asp:BoundField DataField="Fecha_Devolucion" HeaderText="Fecha_Devolucion" SortExpression="Fecha_Devolucion" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/biblioteca.mdb"
            SelectCommand="SELECT prestamos.Id_Prestamo, prestamos.Id_Usuario, prestamos.Id_Libro, prestamos.Fecha_Prestamo, prestamos.Fecha_Devolucion, libros.Nombre AS libro, usuarios.Nombre AS usuario FROM ((libros INNER JOIN prestamos ON libros.Id_Libro = prestamos.Id_Libro) INNER JOIN usuarios ON prestamos.Id_Usuario = usuarios.Id_Usuario)"
            UpdateCommand="UPDATE prestamos SET Fecha_Devolucion=@Fecha_Devolucion WHERE Id_Prestamo=@Id_Prestamo"
            DeleteCommand="DELETE FROM prestamos WHERE Id_Prestamo=@Id_Prestamo">
            <UpdateParameters>
              <asp:ControlParameter Name="Fecha_Devolucion" ControlId="GridView1" PropertyName="SelectedRow.Cells[5]"/>
              <asp:ControlParameter Name="Id_Prestamo" ControlId="GridView1" PropertyName="SelectedValue"/>
            </UpdateParameters>
            <DeleteParameters>
              <asp:ControlParameter Name="Id_Prestamo" ControlId="GridView1" PropertyName="SelectedValue"/>
            </DeleteParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
