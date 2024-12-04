<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <table>
            <tr>
                <td style="width: 3px; height: 68px">
                    <asp:Label ID="Label1" runat="server" Text="Introduce DNI:" Width="171px"></asp:Label></td>
                <td style="height: 68px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td style="width: 176px; height: 68px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="Debe Introducir un DNI"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="Debe estar entre 0 y 50" MaximumValue="50" MinimumValue="0" Type="Integer"></asp:RangeValidator>&nbsp;
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="Ha de introducir un 5" Type="Integer" ValueToCompare="5"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 3px">
                </td>
                <td>
                </td>
                <td style="width: 176px">
                </td>
            </tr>
            <tr>
                <td style="width: 3px">
                </td>
                <td>
                </td>
                <td style="width: 176px">
                </td>
            </tr>
        </table>
    
    </div>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>
