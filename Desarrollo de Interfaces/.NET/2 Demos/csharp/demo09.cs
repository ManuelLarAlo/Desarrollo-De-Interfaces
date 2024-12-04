
using System;
using System.IO;

class Contar
{
        static int Visitas()
        { int v;
          string contador="contador.txt";
          FileInfo ya=new FileInfo (contador);
          if (ya.Exists)
          {  
	using(StreamReader leer=File.OpenText(contador))
	{ v = int.Parse(leer.ReadLine()); v++;}
          }
          else
	v=1;

               using(StreamWriter escribir=File.CreateText(contador))
               { escribir.WriteLine(v.ToString());}
          return v;
	}

		
	static void Main()
	{
		Console.WriteLine("{0}",Contar.Visitas());
	}
        
}
