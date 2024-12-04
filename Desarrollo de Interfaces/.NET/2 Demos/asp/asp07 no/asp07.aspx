<%@ Page Language="C#"%>
<%-- Diversas formas de retornar la página al servidor para ser procesada.
    
     Al hacer clic sobre los controles Button estos devuelven automáticamente la
     página al servidor. En el ejemplo se le ha asignado el mismo manejador de eventos
     del servidor a todos los botones y luego se detecta sobre el cual he hecho clic y
     se actua en consecuencia.
     
     El control RadioButtonList no presenta una devolución automática de la página
     al servidor, la forzamos nosotros estableciendo su propiedad AutoPastBack a true.
     Cuando esta viene devuelta se ejecuta el método asociado a su evento OnSelectedIndexChanged.
               
     Al cambiar el control CheckBox no se realiza una devolución al servidor,
     pero cuando otro control devuelve la página al servidor, se ejecuta el manejador
     de enventos (ProcesarCheckBox) que le hemos asociado al evento OnCheckedChanged,
     si su valor ha cambiado desde la última vez que se ejecuto la página en el servidor. 
--%>


<script runat="server">
    
    
    void CambioRadioButton(object sender, EventArgs e)
    {
        observaciones.Text = observaciones.Text + "\nLa elección del modo de pago es devuelta y gestionada en el servidor. Opción seleccionada:" + modoPagoRBL.SelectedValue; 
    
    }
    
    void ProcesarBotones(object sender, EventArgs e)
    {
        Button b;
        b = (Button)sender;
        switch (b.ID)
        {
            case "borrarBUT":
                observaciones.Text=observaciones.Text+"\nA hecho clic sobre el botón Nuevos Datos. La página ha sido devuelta al servidor, donde se ha detectado que botón ha sido pulsado y se ha procesado.";
                break;
            case "reservarBUT":
                observaciones.Text = observaciones.Text + "\nA hecho clic sobre el botón Realizar reservas. La página ha sido devuelta al servidor, donde se ha detectado que botón ha sido pulsado y se ha procesado.";
                break;
        }

    }

    void ProcesarCheckBox(object sender,EventArgs e)
    {
        observaciones.Text=observaciones.Text+"\nCheckBox ha cambiado, respecto a la última devolución.";
    }
        
        
</script>

<html>
<head>
    <title>Ejemplo (ASP07).- </title>
</head>
<body>
    <form id="miForm" runat="server">
       <table>
         <tr>
            <td >Teléfono:</td>
            <td>
                <asp:TextBox ID="telefono" runat="server" Columns="9" MaxLength="9"></asp:TextBox></td>
            <td ></td>
            <td></td>
         </tr>
         <tr>
            <td >Apellidos:</td>
            <td>
                <asp:TextBox ID="apellidos" runat="server" Columns="40" MaxLength="40"></asp:TextBox></td>
            <td>Nombre:</td>
            <td>
                <asp:TextBox ID="nombre" runat="server" Columns="20" MaxLength="20"></asp:TextBox></td>
         </tr>
         <tr>
            <td >Localidad:</td>
            <td>
                <asp:TextBox ID="localidad" runat="server" Columns="40" MaxLength="40"></asp:TextBox></td>
            <td>C.P.:</td>
            <td>
                <asp:TextBox ID="cPostal" runat="server" Columns="5" Enabled="False" MaxLength="5"></asp:TextBox></td>
         </tr>
         <tr>
            <td >Entregara vehículo:</td>
            <td>
                <asp:CheckBox ID="EntregaCHB" OnCheckedChanged="ProcesarCheckBox" runat="server" /></td>
            <td></td>
             <td></td>
         </tr>
         <tr>
            <td >Modelo:</td>
            <td>
                <asp:DropDownList ID="modelosDDL" runat="server">
                    <asp:ListItem Value="a0">[Seleccione el modelo deseado]</asp:ListItem>
                    <asp:ListItem Value="a146">Alfa 146</asp:ListItem>
                    <asp:ListItem Value="a156">Alfa 156</asp:ListItem>
                    <asp:ListItem Value="aspider">Alfa Spider</asp:ListItem>
                </asp:DropDownList></td>
            <td></td>
            <td></td>
         </tr>
         <tr>
            <td ></td>
            <td></td>
            <td ></td>
            <td></td>
         </tr>
         <tr>
            <td >Forma de Pago:</td>
            <td>
                <asp:RadioButtonList ID="modoPagoRBL" runat="server" OnSelectedIndexChanged="CambioRadioButton" AutoPostBack="True">
                    <asp:ListItem Selected="True">Contado</asp:ListItem>
                    <asp:ListItem>Finaciera</asp:ListItem>
                    <asp:ListItem>Banco</asp:ListItem>
                </asp:RadioButtonList></td>
            <td></td>
            <td></td>
         </tr>
         <tr>
            <td ></td>
            <td></td>
            <td ></td>
            <td>
                <asp:Button ID="reservarBUT" runat="server" Text="Realizar reserva" Width="125px"  OnClick="ProcesarBotones"/></td>
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td ></td>
            <td>
                <asp:Button ID="borrarBUT" runat="server" Text="Nuevos datos" Width="125px" OnClick="ProcesarBotones" /></td>
         </tr>
         <tr>
             <td colspan="4">
                 Observaciones:</td>
         </tr>
         <tr>
             <td colspan="4">
                <asp:TextBox ID="observaciones" runat="server" Columns="75" Height="200px" TextMode="MultiLine"></asp:TextBox></td>
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td ></td>
            <td></td>
         </tr>
       </table>   
    </form>
</body>
</html>
