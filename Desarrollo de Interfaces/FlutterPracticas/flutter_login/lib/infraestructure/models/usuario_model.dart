
import 'package:flutter_login/domain/entities/usuario.dart';

class UserModel {
  final int id;
  final String nombre;
  final String clave;
  
  UserModel ({
    required this.id,
    required this.nombre,
    required this.clave,
  });

    factory UserModel.fromJsonMap(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      nombre: json["nombre"],
      clave: json["clave"],
  );

  Usuario toEntity() => Usuario(
    id: id,
    nombre: nombre,
    clave: clave
  );
}