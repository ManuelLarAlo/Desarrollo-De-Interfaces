using System;

namespace Gestion
{
	class Iva
	{
  		float t;

                public float Tipo
		{
		  get
		  {return t;}
		  set
		  {t=value;}
		}

 		public float AplicarIva (float p) 
   		{
		      return p*(1+t/100);
   		}
	}

	class usarIva
	{
		static void Main()
		{
		    Iva miIva=new Iva();
		    Console.WriteLine("IVA aplicable:");
		    string tipoA=Console.ReadLine();
		    miIva.Tipo=Convert.ToSingle(tipoA); 	
		    Console.WriteLine("Precio:");
		    string precio=Console.ReadLine();
		    Console.WriteLine("P.V.P.({0}% IVA): {1}",miIva.Tipo, miIva.AplicarIva(Convert.ToSingle(precio)));
		   
		}
	}
}
