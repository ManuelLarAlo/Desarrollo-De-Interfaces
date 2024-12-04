import 'package:flutter/material.dart';
import 'package:flutter_login/config/helpers/get_answer.dart';
import 'package:flutter_login/domain/entities/usuario.dart';

class LoginProvider extends ChangeNotifier{

  List<Usuario> usuarios = [];

  final GetAnswer getAnswer = GetAnswer();

    Future<void> getUser() async {

    await Future.delayed(const Duration(seconds: 2));

    final Answer = await getAnswer.getAnswer();

    //llamada con dio a la url
    //devolver un response.data --> List<Map<String, String>> --> usuariosactuales

    //for para añadir los usuarios 
    //for (User usuario in usuariosactuales) {
    // usuarios.add(User.fromJSON(usuario));
    //}
    notifyListeners();
  }
}