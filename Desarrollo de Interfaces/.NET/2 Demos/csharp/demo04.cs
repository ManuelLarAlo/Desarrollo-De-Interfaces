using System;
namespace Gestion
{
	class Iva
	{
  	        public static void AplicarIva (ref float p,float i)
	        {   p= p*(1+i/100);}

  	        static void Main()
	        {
	             Console.WriteLine("Precio:");
                     float precio=Convert.ToSingle(Console.ReadLine());
		     // Como utilizo ref precio debe inicializarse
	             Console.WriteLine("Iva   :");
	             float tipoA=Convert.ToSingle(Console.ReadLine());
                     Iva.AplicarIva(ref precio,tipoA);
	             Console.WriteLine("P.V.P.({0}% IVA): {1}",tipoA, precio);	
	        }
	}
}

