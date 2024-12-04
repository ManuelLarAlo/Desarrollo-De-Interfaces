
using System;

class Iva
{
   		float t;
          
		// Constructor predeterminado

		public Iva()
  		{
		    t=16.0F;
  		}

		// Constructor con parámetros
	
	        public Iva(float tipo)
  		{
		     t=tipo;
  		}
		
		static void Main()
		{
		    Iva miIva1=new Iva();
		    Console.WriteLine("Estoy utilizando un objeto con un tipo de iva estándar de: {0} %", miIva1.t);
		    Iva miIva2=new Iva(24.5F);
		    Console.WriteLine("Estoy utilizando un objeto con un tipo de iva estándar de: {0} %", miIva2.t);

		}

}

