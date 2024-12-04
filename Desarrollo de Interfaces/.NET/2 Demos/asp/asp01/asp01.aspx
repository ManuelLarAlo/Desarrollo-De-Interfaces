<%@ Page Language="C#"%>

<script runat="server">
    string N,L;

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
    
    public string comprobar()
    {
       string metodo=Request.RequestType;
       string mensaje=" INCORRECTA.";
       if (metodo=="GET")
       {
          N=Request.QueryString["dni"];
          L=Request.QueryString["letra"].ToUpper();
       }
       else
       {
          N=Request.Form["dni"];
          L=Request.Form["letra"].ToUpper();
        }
       if (L.Length==1)
        {
            if (Okey(N,L[0]))
               {mensaje=" CORRECTA.";}
        }
       return mensaje;
    }

</script>
<html>
<head>
<title>Ejemplo(ASP01).-</title>
</head>
<body>
    Con la dirección URL " <%= Request.Url%>"<br />
    y através del puerto: <%= Request.Url.Port %><br />
    nos ha solicitado la validez de la letra del nif, la respuesta es:
    <%= comprobar() %>
</body>
</html>
