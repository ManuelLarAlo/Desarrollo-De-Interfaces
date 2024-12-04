using System;
namespace Gestion
{
	class Iva
	{
  	        public static float AplicarIva (float p) 
   	        {   return p*(1+16F/100); }
  	        public static float AplicarIva (float p,float i)
	        {   return p*(1+i/100); }

  	        static void Main()
	        {
	             Console.WriteLine("Precio:");
	             float precio=Convert.ToSingle(Console.ReadLine());
	             Console.WriteLine("P.V.P.(16% IVA) : {0}",Iva.AplicarIva(precio));	
	             Console.WriteLine("A otro IVA:");
	             float tipoA=Convert.ToSingle(Console.ReadLine());
	             Console.WriteLine("P.V.P.({0}% IVA): {1}",tipoA, Iva.AplicarIva(precio,tipoA));	
	        }
	}
}

