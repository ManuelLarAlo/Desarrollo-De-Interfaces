/*
compilar con: csc /reference:demo10.dll clientededemo10dll.cs
*/

using System;
using validaciones;


class cliente
{

		static void Main()
		{
			string dni="26100100";
			char letra='t';
		        Console.WriteLine("{0}  {1}  {2}",Nif.Okey(dni,ref letra),dni,letra.ToString());
			dni="26100100e";
			Console.WriteLine("{0} {1}",Nif.Okey(ref dni),dni);
		
		}
		

}
