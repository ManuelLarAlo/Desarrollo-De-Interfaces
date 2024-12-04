using System;

public partial class Default : System.Web.UI.Page 
{
    void Page_Load()
    {
    		/* La fecha es cargada desde aquí.
               La hora yel número de visitante desde una variable de sesión.
               Y el número de usuarios conectados desde una variable de aplicación.
             */

        	DateTime instante =DateTime.Now;
  
            string mes="";
        	switch (instante.Month)
       			 {case 1:mes="Enero";break;
        		 case 2:mes="Febrero";break;
        		 case 3:mes="Marzo";break;
        		 case 4:mes="Abril";break;
        		 case 5:mes="Mayo";break;
        		 case 6:mes="Junio";break;
        		 case 7:mes="Julio";break;
        		 case 8:mes="Agosto";break;
        		 case 9:mes="Septiembre";break;
        		 case 10:mes="Octubre";break;
        		 case 11:mes="Noviembre";break;
        		 case 12:mes="Diciembre";break;
        		}
        	
            fecha.Text=instante.Day.ToString()+" de "+mes+" de "+instante.Year.ToString();
        	hora.Text=Session["hora"].ToString();
            usuario.Text = Session["nVisitante"].ToString();
            usuariosOnline.Text = Application["nUsuarios"].ToString();
    }

}
