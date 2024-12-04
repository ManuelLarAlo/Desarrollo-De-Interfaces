<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BorrarObra.aspx.cs" Inherits="BorrarObra" %>

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
                    OBRAS</td>
            </tr>
        </table>
        <table style="width: 582px">
            <tr>
                <td style="width: 525px; height: 21px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AnadirObra.aspx">Añadir Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ListarObra.aspx">Listar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="ModificarObra.aspx">Modificar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="BorrarObra.aspx">Borrar Obra</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="BorrarTodoObra.aspx">Borrar Todo</asp:HyperLink></td>
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
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Libro"
                        DataSourceID="AccessDataSource2">
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                            <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
                            <asp:BoundField DataField="Editorial" HeaderText="Editorial" SortExpression="Editorial" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        </Columns>
                    </asp:GridView>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" ConflictDetection="CompareAllValues"
                        DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [libros] WHERE [Id_Libro] = ? AND [Autor] = ? AND [Editorial] = ? AND [Nombre] = ?"
                        InsertCommand="INSERT INTO [libros] ([Id_Libro], [Autor], [Editorial], [Nombre]) VALUES (?, ?, ?, ?)"
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
                            <asp:Parameter Name="Id_Libro" Type="Int32" />
                            <asp:Parameter Name="Autor" Type="String" />
                            <asp:Parameter Name="Editorial" Type="String" />
                            <asp:Parameter Name="Nombre" Type="String" />
                        </InsertParameters>
                    </asp:AccessDataSource>
                    <br />
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
