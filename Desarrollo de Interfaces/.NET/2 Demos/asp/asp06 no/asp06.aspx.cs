using System;
using System.Data;

public partial class Default : System.Web.UI.Page 
{
    int ed;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            ed = Int16.Parse(edad.Text);
            if (ed > 18)
                // Error personalizado (404) en Web.Confing si no existe un tratamiento previo en Global.asax
                Response.Redirect("mayor.html");
            else
                // Provoco un error de la aplicación
                throw (new ApplicationException());
        }
                    
    }

    // Si especificamos Page_Error los errores son tratados aquí.

    protected void Page_Error(object sender, EventArgs e)
    {
	    Exception objErr = Server.GetLastError().GetBaseException();
        string error ="<h1><B>Error</B></h1><hr>" +
                      "<br><B>En     : </B>" + Request.Url.ToString() +
                      "<br><B>Mensaje: </B>" + objErr.Message.ToString();
			
	    Response.Write(error.ToString());
	    // Borro el error lo que impide que sea también tratado en Global.asax
        Server.ClearError();
    }
  

}
