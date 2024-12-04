
using System;

class Nif
{

	private static string todas="TRWAGMYFPDXBNJZSUVHLCKE";
	
	public static bool Okey(string n,ref char l)
        {
            bool ok=false;
	    l=char.ToUpper(l);	
            char L=todas[int.Parse(n)%23];
            if (L==l) ok=true;
	    l=L;
            return ok;
	}

	
	public static bool Okey(ref string N)
        {  
	    char l=N[N.Length-1];
            string n=N.Substring(0,N.Length-1);
	    bool ok=Okey(n,ref l);	
            N=n+l;
	    return ok;
	}

}

class prueba
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
