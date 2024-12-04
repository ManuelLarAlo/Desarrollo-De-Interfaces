using System;
namespace Gestion
{
	class Iva
	{
		static float t;
		static Iva()
		{
		    t=16.0F;

		}
  	        public static float AplicarIva (float p) 
   	        {   return p*(1+t/100); }
  	      
  	        static void Main()
	        {
	             Console.WriteLine("Precio:");
	             float precio=Convert.ToSingle(Console.ReadLine());
	             Console.WriteLine("P.V.P.: {0}",Iva.AplicarIva(precio));	
	        }
	}
}

