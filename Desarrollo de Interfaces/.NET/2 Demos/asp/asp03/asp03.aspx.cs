using System;
using System.Web.UI;

public partial class Default:Page 
{
    protected void Page_Load()
    { 
        if (IsPostBack)
        {
            miPanel.Visible = false;
            mensaje.Text = "Su NIF es:" + Comprobar();
        }
    }

    public string Comprobar()
    {
       string aviso = "incorrecto";
       if (Nif.Okey(dni.Text,letra.Text.ToUpper()[0]))
          {aviso=" correcto.";}
       return aviso;
    }

}

public static class Nif
{
	private static string todas="TRWAGMYFPDXBNJZSUVHLCKE";
	
	public static bool Okey(string n, char l)
        {
	  bool ok=false;
          try
          {
            
	    l=char.ToUpper(l);	
            char L=todas[int.Parse(n)%23];
            if (L==l) ok=true;
           }
           catch
	   {}
            return ok;
	}

	public static bool Okey(string N)
        {  
	    char l=N[N.Length-1];
            string n=N.Substring(0,N.Length-1);
	    bool ok=Okey(n,l);	
            N=n+l;
	    return ok;
	}

}

