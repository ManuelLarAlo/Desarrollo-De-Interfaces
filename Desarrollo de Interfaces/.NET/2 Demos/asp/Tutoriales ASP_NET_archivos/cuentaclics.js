function scc_click(clic_Id, parametro)
{
    if (subgurim_cc_cookieHabilitada() && !subgurim_cc_hasClickado(clic_Id, parametro))
    {
        var Unico = esUnico(clic_Id, parametro);
        subgurim_cc_guardarClickar(clic_Id, parametro)

        if (!parametro)
        {
            parametro = "";
        }

        var NAJAX_image = new Image();

        //NAJAX_image.src = "http://localhost:1487/CuentaClics/acciones/cuentaclics.aspx?clic_Id="+clic_Id+"&parametro="+parametro+"&unico="+Unico+"&i="+subgurim_cc_random();
        NAJAX_image.src = "http://www.cuentaclics.com/acciones/cuentaclics.aspx?clic_Id="+clic_Id+"&parametro="+parametro+"&unico="+Unico+"&i="+subgurim_cc_random();
    }

}



/**VARIOS**/


function subgurim_cc_random()
{
    var dt = new Date();
    var ran=Math.random()*400;
    return dt.getTime() + '-' + ran;
}

/**COOKIES**/

function esUnico(clic_Id, parametro)
{
    return (getCookie(getKey(clic_Id, parametro, 1))!=null ? "false" : "true");
}

function subgurim_cc_hasClickado(clic_Id, parametro)
{
    return getCookie(getKey(clic_Id, parametro))!=null ? 1 : 0;;
}

function subgurim_cc_guardarClickar(clic_Id, parametro)
{
    var ahora = new Date();
    
    ahora.setSeconds(ahora.getSeconds() + 5);
    setCookie(getKey(clic_Id, parametro), "1", ahora, "/");
    
    ahora.setHours(ahora.getHours() + 24);    
    ahora.setHours(0,0,0,0);    
    
    setCookie(getKey(clic_Id, parametro, 1), "1", ahora, "/");
}

function getKey(clic_Id, parametro, unicidad)
{
    var key = "ccs_Clic_Id" + clic_Id;    
    if (parametro)
    {
        key += "_Parametro" + parametro;
    }
    if (unicidad == 1)
    {
        key += "_Unicidad";
    }
    
    return key;
}

function subgurim_cc_cookieHabilitada()
{
    var r = subgurim_cc_random();
    setCookie(r,"1");

	return getCookie(r)!=null;
}


/*
   name - name of the cookie
   value - value of the cookie
   [expires] - expiration date of the cookie
     (defaults to end of current session)
   [path] - path for which the cookie is valid
     (defaults to path of calling document)
   [domain] - domain for which the cookie is valid
     (defaults to domain of calling document)
   [secure] - Boolean value indicating if the cookie transmission requires
     a secure transmission
   * an argument defaults when it is assigned null as a placeholder
   * a null placeholder is not required for trailing omitted arguments
*/

function setCookie(name, value, expires, path, domain, secure) {
  var curCookie = name + "=" + escape(value) +
      ((expires) ? "; expires=" + expires.toGMTString() : "") +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      ((secure) ? "; secure" : "");
      document.cookie = curCookie;
}


/*
  name - name of the desired cookie
  return string containing value of specified cookie or null
  if cookie does not exist
*/

function getCookie(name) {
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
    begin = dc.indexOf(prefix);
    if (begin != 0) return null;
  } else
    begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
    end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}


/*
   name - name of the cookie
   [path] - path of the cookie (must be same as path used to create cookie)
   [domain] - domain of the cookie (must be same as domain used to
     create cookie)
   path and domain default if assigned null or omitted if no explicit
     argument proceeds
*/

function deleteCookie(name, path, domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
}

// date - any instance of the Date object
// * hand all instances of the Date object to this function for "repairs"

function fixDate(date) {
  var base = new Date(0);
  var skew = base.getTime();
  if (skew > 0)
    date.setTime(date.getTime() - skew);
}

