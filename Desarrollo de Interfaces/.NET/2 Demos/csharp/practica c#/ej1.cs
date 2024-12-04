using System;
namespace miespacio
{
        class miclase{
                public void saludo()
                {
                        System.Console.WriteLine("Hola Mundo");
                }
                static void saludo(float t)
                {
                        Console.WriteLine("Hola Mundo  n£mero: " + Convert.ToString(t));
                }

                static void Main()
                {
                        miclase a=new miclase();
                        a.saludo();
                        miclase.saludo(3.23F);
                }
        }
}
