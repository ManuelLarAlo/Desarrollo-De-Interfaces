
using System;	
class adivina
{
		
 		static void Main()
		{

		 int num,prueba=0,intentos=0;
		 Random generador=new Random();
   	         num=generador.Next(1,100);	  		
		
		try
		{
		  do
		  {
		    Console.Write("Su n�mero:");
		    prueba=Int16.Parse(Console.ReadLine()); // si la cadena no tiene el formato correcto da error.
		    if (prueba<1 || prueba> 100) throw new ArgumentOutOfRangeException(); // este error lo proboco yo.
		    intentos++;
		    if(prueba>num)
		  	Console.WriteLine("El n�mero buscado es menor");
		    else
			if (prueba<num)
			   Console.WriteLine("el n�mero buscado es mayor");
 		  } while (prueba!=num);
		  Console.WriteLine("� Enhorabuena !");
		 }
		 catch (Exception e)
		 {
 		    Console.WriteLine("Fin del Juego -> "+e.Message);
                 }
		 finally
		 {
		    Console.WriteLine("El n�mero secreto era el:{0}.",num);
		    Console.WriteLine("Usted ha realizado:{0} intentos v�lidos.",intentos); 
		 }
		 return;
	 	}

}