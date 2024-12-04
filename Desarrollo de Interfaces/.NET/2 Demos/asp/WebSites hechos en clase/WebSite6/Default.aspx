<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
            DataKeyNames="nif" DataSourceID="AccessDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="nif" HeaderText="nif" ReadOnly="True" SortExpression="nif" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                <asp:CheckBoxField DataField="baja" HeaderText="baja" SortExpression="baja" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/evalua.mdb"
            DeleteCommand="DELETE FROM [Alumnos] WHERE [nif] = ?" InsertCommand="INSERT INTO [Alumnos] ([nif], [nombre], [baja]) VALUES (?, ?, ?)"
            SelectCommand="SELECT [nif], [nombre], [baja] FROM [Alumnos]" UpdateCommand="UPDATE [Alumnos] SET [nombre] = ?, [baja] = ? WHERE [nif] = ?">
            <DeleteParameters>
                <asp:Parameter Name="nif" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="baja" Type="Boolean" />
                <asp:Parameter Name="nif" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="nif" Type="String" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="baja" Type="Boolean" />
            </InsertParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
