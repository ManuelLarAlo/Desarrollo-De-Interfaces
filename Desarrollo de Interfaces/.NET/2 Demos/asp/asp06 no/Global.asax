

<script runat="server">
   
    // Si se omite un tratamiento específico de errores en cada página (Page_Error).
    // pueden ser tratados de forma global aquí.
   
    void Application_Error(Object sender, EventArgs E)
    {
        Exception objErr = Server.GetLastError().GetBaseException();
        string error = "<h1><B>Error</B></h1><hr>" +
                      "<br><B>En     : </B>" + Request.Url.ToString() +
                      "<br><B>Mensaje: </B>" + objErr.Message.ToString();

        Response.Write(error.ToString());
     // no libero el error para que también sea tratado en Web.config
    }
   
</script>
