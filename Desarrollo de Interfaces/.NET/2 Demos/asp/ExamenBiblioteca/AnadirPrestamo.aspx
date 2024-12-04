<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnadirPrestamo.aspx.cs" Inherits="AnadirPrestamo" %>

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
                <td style="width: 577px; height: 21px">
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
                <td style="width: 577px">
                    <br />
                    &nbsp;</td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 577px">
                    &nbsp;
                    <table style="width: 537px">
                        <tr>
                            <td style="width: 196px; height: 67px">
                                &nbsp;USUARIO</td>
                            <td style="height: 67px">
                                &nbsp;OBRA</td>
                            <td style="width: 105px; height: 67px">
                                PRESTAMO</td>
                        </tr>
                        <tr>
                            <td style="width: 196px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AccessDataSource1"
                                    DataTextField="Nombre" DataValueField="Id_Usuario">
                                </asp:DropDownList></td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="AccessDataSource2"
                                    DataTextField="Nombre" DataValueField="Id_Libro">
                                </asp:DropDownList></td>
                            <td style="width: 105px">
                                <asp:TextBox ID="prestamo" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 196px">
                                <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
                                    DataFile="~/App_Data/biblioteca.mdb" DeleteCommand="DELETE FROM [usuarios] WHERE [Id_Usuario] = ? AND [Nombre] = ? AND [DNI] = ?"
                                    InsertCommand="INSERT INTO [usuarios] ([Id_Usuario], [Nombre], [DNI]) VALUES (?, ?, ?)"
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
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:Parameter Name="Nombre" Type="String" />
                                        <asp:Parameter Name="DNI" Type="String" />
                                    </InsertParameters>
                                </asp:AccessDataSource>
                            </td>
                            <td>
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
                            </td>
                            <td style="width: 105px">
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="enviar" runat="server" OnClick="enviar_Click" Text="Añadir" Width="227px" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="prestamo"
                        ErrorMessage="El campo Prestamo no puede estar vacio"></asp:RequiredFieldValidator></td>
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
