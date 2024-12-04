/*
Compliar con: csc /target:library /out:demo10.dll demo10.cs
*/

using System;

namespace validaciones
{
public class Nif
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
}
