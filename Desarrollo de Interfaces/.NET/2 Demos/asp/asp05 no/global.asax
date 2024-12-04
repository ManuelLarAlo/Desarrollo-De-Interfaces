<%@ Application language="c#" Src="bin/Global.asax.cs" Inherits="Contar"%>

<script runat="server">

    public void Application_Start(Object sender, EventArgs e)
    {
       // Cuando entra el primer usuario a la aplicación.
       Application["nUsuarios"]=0;
    }

    public void Application_End(Object sender, EventArgs e)
    {
        // Cuando sale el último usuario de la aplicación.
        Application.Clear();
    }


    public void Session_Start(Object sender, EventArgs e)
    {
        // Cuando entra un usuario.
        Session["nVisitante"]=Visitas();
        Session["hora"]=laHora();


        Application.Lock();
        Application["nUsuarios"]=int.Parse(Application["nUsuarios"].ToString())+1;
        Application.UnLock();

    }

    public void Session_End(Object sender, EventArgs e)
    {
       // Cuando sale un usuario.
        Application.Lock();
        Application["nUsuarios"]=int.Parse(Application["nUsuarios"].ToString())-1;
        Application.UnLock();
    }

    void Application_BeginRequest(Object sender, EventArgs E)
    {
        // Este controlador de evento, realiza verificaciones de rutas de acceso
        // y ayuda a prevenir los caracteres no válidos y las direcciones URL mal
        // formadas. 
        // Código creado por Microsoft (violación de seguridad).

        if (Request.Path.IndexOf('\\') >= 0 ||
        System.IO.Path.GetFullPath(Request.PhysicalPath) != Request.PhysicalPath)
        {
          throw new HttpException(404, "not found");
        }
    }

</script>
