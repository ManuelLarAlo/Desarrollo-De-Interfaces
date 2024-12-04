class Usuarios {

  List<Usuario> items = new List();
  Usuarios();
  Usuarios.fromJsonList(List jsonList){
    if (jsonList == null)
    {
      return;
    }
    for (var item in jsonList) {
      final usuario = new Usuario.fromJsonMap(item);
      items.add(usuario);
    }
  }
}

class Usuario {
  String id;
  String user;
  String clave;

  Usuario({
    this.id,
    this.user,
    this.clave,
  });

  Usuario.fromJsonMap(Map<String,dynamic> json)
  {
    id=json['id'];
    user=json['user'];
    clave=json['clave'];
  }
}