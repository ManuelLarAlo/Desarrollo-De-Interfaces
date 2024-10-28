import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_login/domain/entities/usuario.dart';

class UserProvider {
  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://sheets.googleapis.com/v4/spreadsheets/14XANU8qzh60_v56fFQIc-dCOW_mV-9GcuJklBCncluk/values/users?key=AIzaSyCmXgOksKHaRKzsZ6U1uI9Sm6TQxTs6tW0'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<User> users = [];

        //Este bucle for vale para saltar la primera fila del json ["id", "username", "password"] porque no nos interesa procesar eso,
        //solo nos interesan los usuarios y contraseñas del archivos

        for (var user in jsonData['values'].skip(1)) { 
          users.add(User(username: user[1], password: user[2])); 
        }

        return users;
      } else {
        throw Exception('Error al cargar usuarios: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
