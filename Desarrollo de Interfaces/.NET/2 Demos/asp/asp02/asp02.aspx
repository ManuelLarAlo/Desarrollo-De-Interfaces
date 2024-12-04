<%@ Page Language="C#" %>
<html>
<head>
    <title>Ejemplo(ASP02).-</title>
</head>
<script runat="server" >

    public void Page_Load(object sender, EventArgs e)
    { 
        if (IsPostBack)
        {
            miPanel.Visible = false;
            mensaje.Text = "Su NIF es:" + Comprobar();
        }
    }

    
    public bool Okey(string n, char l)
    {
        string todas = "TRWAGMYFPDXBNJZSUVHLCKE";
        bool ok = false;
        try
        {

            l = char.ToUpper(l);
            char L = todas[int.Parse(n) % 23];
            if (L == l) ok = true;
        }
        catch
        { }
        return ok;
    }
    
    public string Comprobar()
    {
       string aviso = "incorrecto";
       if (Okey(dni.Text,letra.Text.ToUpper()[0]))
          {aviso=" correcto.";}
       return aviso;
    }
</script>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="miPanel" runat="server" Height="50px" Width="225px">
        <asp:Label ID="Label1" runat="server" Text="D.N.I:"></asp:Label>
        <asp:TextBox ID="dni" runat="server" Columns="8" MaxLength="8"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Letra:"></asp:Label>
        <asp:TextBox ID="letra" runat="server" Columns="1" MaxLength="1"></asp:TextBox><br />
        <asp:Button ID="miBoton" runat="server" Text="Verificar" />
   </asp:Panel><br />
   <asp:Label ID="mensaje" runat="server" Text=""></asp:Label></form>
</body>
</html>
