<%@ Page Language="C#"%>


<script runat="server">
    void ProcesarBotonASP(Object sender, EventArgs e)
    {
       Response.Write("<scr" + "ipt> alert('Tras ejecutar el correspondiente codigo en el cliente, se ejecuta este código en el servidor.') </scr" + "ipt>");

    }  
</script>

<html>
<head>
<title>Ejemplo(ASP08).-</title>
<script language="javascript">
    
    function muevoraton()
    {
       alert('Aunque es un control de servidor, es posible asignarle código a eventos que se produce en el cliente como a onmouseover. En principio no hay devolución de página ni interacción con el servidor.');
    }
    function hagoclic()
    {
        alert('Al elegir cualquier opción se esta desencadenando la ejecución de este código en el navegador.');
        if (document.forms[0].radioListASP[1].checked)
        {
          alert('El navegador ha detectado que ha seleccionado la segunda opcion esto provoca que se envie la página al servidor.');
          document.forms[0].submit();
        }
        
    }
</script>
</head>
<body>
    <form id="miForm" runat="server">
       <table>
         <tr>
            <td >
                Control CheckBox:</td>
            <td>
                <asp:CheckBox ID="casillaASP"  onmouseover="muevoraton();" runat="server" /></td>
            <td></td>
             <td></td>
         </tr>
         <tr>
            <td >
                Control RadioButtonList:</td>
            <td>
                <asp:RadioButtonList ID="radioListASP" runat="server" onclick="hagoclic();">
                    <asp:ListItem>Contado</asp:ListItem>
                    <asp:ListItem>Finaciera</asp:ListItem>
                    <asp:ListItem>Banco</asp:ListItem>
                </asp:RadioButtonList></td>
            <td></td>
            <td></td>
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="botonASP" runat="server" Text="Button ASP" Width="118px" OnClientClick="alert('Esto es un control de servidor (Button), al hacer clic sobre él se devolverá la página al servidor, pero antes se está ejecutando este código en el lado del cliente');" onclick="ProcesarBotonASP"/></td>
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <input id="botonHTML" type="button" onclick="alert('Esto es un boton html, al hacer clic el navegador esta ejecutando este código. No hay interacción con el servidor.');" value="Boton HTML" /></td>
         </tr>
         
         
       </table>   
    </form>
</body>
</html>
