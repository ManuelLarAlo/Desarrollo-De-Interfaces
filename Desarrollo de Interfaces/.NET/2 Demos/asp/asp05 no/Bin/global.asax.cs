using System;
using System.IO;

public class Contar : System.Web.HttpServerUtility
   {
        public int Visitas()
        {
          int v;
          string contador = Server.MapPath("\\App_Data\\") + "contador.txt";
          FileInfo ya=new FileInfo (contador);
          if (ya.Exists)
          {
              using (StreamReader leer = File.OpenText(contador))
              {
                  v = int.Parse(leer.ReadLine());
                  v++;
              }
          }
          else
          {  v=1;}

          using (StreamWriter escribir = File.CreateText(contador))
          {
              escribir.WriteLine(v.ToString());
          }
 
          return v;
        }
        
        public string laHora()
        {
            DateTime ya =DateTime.Now;
       		string h="",m="";
        	h=ya.Hour.ToString();
        	m=ya.Minute.ToString();
        	if (ya.Hour<10) h="0"+h;
        	if (ya.Minute<10) m="0"+m;
        	return (h+":"+m);
        }
    }
