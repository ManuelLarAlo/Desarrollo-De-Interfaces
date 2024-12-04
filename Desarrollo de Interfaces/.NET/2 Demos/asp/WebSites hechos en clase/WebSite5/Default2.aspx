<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="nombre" />
                <asp:BoundField DataField="nifAlumno" HeaderText="NIF" SortExpression="nifAlumno" />
                <asp:BoundField DataField="periodo" HeaderText="periodo" SortExpression="periodo" />
                <asp:BoundField DataField="fol" HeaderText="fol" SortExpression="fol" />
                <asp:BoundField DataField="ret" HeaderText="ret" SortExpression="ret" />
                <asp:BoundField DataField="ina" HeaderText="ina" SortExpression="ina" />
                <asp:BoundField DataField="sim" HeaderText="sim" SortExpression="sim" />
                <asp:BoundField DataField="ral" HeaderText="ral" SortExpression="ral" />
                <asp:BoundField DataField="fpr" HeaderText="fpr" SortExpression="fpr" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/evalua.mdb"
            SelectCommand="SELECT Notas.nifAlumno, Notas.periodo, Notas.fol, Notas.ret, Notas.ina, Notas.sim, Notas.ral, Notas.fpr, Alumnos.nombre FROM (Notas INNER JOIN Alumnos ON Notas.nifAlumno = Alumnos.nif) WHERE (Notas.periodo = ?) AND (Notas.nifAlumno like ?)">
            <SelectParameters>
                <asp:SessionParameter Name="periodo" SessionField="periodo" Type="String" />
                <asp:SessionParameter Name="?" SessionField="alumno" />
            </SelectParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
