using System;

namespace Gestion
{
	class Iva
	{
  	        static float t;

                public static float Tipo
		{
		  get
		  {return t;}
		  set
		  {t=value;}
		}

 		public static float AplicarIva (float p) 
   		{
		      return p*(1+t/100);
   		}
	}

	class usarIva
	{
		static void Main()
		{
		    Console.WriteLine("IVA aplicable:");
		    string tipoA=Console.ReadLine();
		    Iva.Tipo=Convert.ToSingle(tipoA); 	
		    Console.WriteLine("Precio:");
		    string precio=Console.ReadLine();
		    Console.WriteLine("P.V.P.({0}% IVA): {1}",Iva.Tipo, Iva.AplicarIva(Convert.ToSingle(precio)));	
		   
		}
	}
}
