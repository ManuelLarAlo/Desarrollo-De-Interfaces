class Usuarios {

  List<Usuario> items = List<Usuario>.empty();
  Usuarios();
  Usuarios.fromJsonList(List jsonList){
    if (jsonList == null)
    {
      return;
    }
    for (var item in jsonList) {
      final usuario =  Usuario.fromJsonMap(item);
      items.add(usuario);
    }
  }
}

class Usuario {
  late final String id;
  late final String user;
  late final String clave;

  Usuario({
    required this.id,
    required this.user,
    required this.clave,
  });

  Usuario.fromJsonMap(Map<String,dynamic> json)
  {
    id=json['id'];
    user=json['user'];
    clave=json['clave'];
  }
}