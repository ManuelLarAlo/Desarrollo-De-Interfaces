<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Devolucion.aspx.cs" Inherits="Devolucion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 584px">
            <tr>
                <td style="width: 94px">
                    BIBLIOTECA</td>
                <td style="width: 27px; text-align: center">
                    -</td>
                <td>
                    PRESTAMOS</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AnadirPrestamo.aspx">Añadir Prestamo</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Devolucion.aspx">Devolucion</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ListarPrestamo.aspx">Listar Prestamos</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="BorrarPrestamo.aspx">Borrar Prestamo</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="BorrarTodoPrestamo.aspx">Borrar Todo</asp:HyperLink></td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td style="width: 525px">
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 525px">
                    &nbsp;
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="AccessDataSource1" Width="213px">
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                            <asp:BoundField DataField="Nombre" HeaderText="Usuario" SortExpression="Nombre" />
                            <asp:BoundField DataField="Expr1" HeaderText="Obra" SortExpression="Expr1" />
                            <asp:BoundField DataField="Fecha_Prestamo" HeaderText="Fecha Prestamo" SortExpression="Fecha_Prestamo" />
                            <asp:BoundField DataField="Fecha_Devolucion" HeaderText="Fecha Devolucion" SortExpression="Fecha_Devolucion" />
                        </Columns>
                    </asp:GridView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
                        DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [prestamos] WHERE [Id_Prestamo] = ? AND [Id_Usuario] = ? AND [Id_Libro] = ? AND [Fecha_Prestamo] = ? AND [Fecha_Devolucion] = ?"
                        InsertCommand="INSERT INTO [prestamos] ([Id_Usuario], [Id_Libro], [Fecha_Prestamo], [Fecha_Devolucion], [Id_Prestamo]) VALUES (?, ?, ?, ?, ?)"
                        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT usuarios.Nombre, libros.Nombre AS Expr1, prestamos.Fecha_Prestamo, prestamos.Fecha_Devolucion FROM ((usuarios INNER JOIN prestamos ON usuarios.Id_Usuario = prestamos.Id_Usuario) INNER JOIN libros ON prestamos.Id_Libro = libros.Id_Libro)"
                        UpdateCommand="UPDATE prestamos SET Id_Usuario = ?, Id_Libro = ?, Fecha_Prestamo = ?, Fecha_Devolucion = ? WHERE (Id_Prestamo = ?) AND (Id_Usuario = ?) AND (Id_Libro = ?) AND (Fecha_Prestamo = ?) AND (Fecha_Devolucion = ?)">
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
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:Parameter Name="Id_Libro" Type="Int32" />
                            <asp:Parameter Name="Fecha_Prestamo" Type="String" />
                            <asp:Parameter Name="Fecha_Devolucion" Type="String" />
                            <asp:Parameter Name="Id_Prestamo" Type="Int32" />
                        </InsertParameters>
                    </asp:AccessDataSource>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
