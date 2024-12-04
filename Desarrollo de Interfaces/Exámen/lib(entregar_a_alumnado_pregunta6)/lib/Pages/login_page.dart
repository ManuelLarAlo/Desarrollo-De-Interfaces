//import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:iseneca_jandula/Providers/usuarios_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _usuario = '';
  String _clave = '';

  final usuariosProvider = UsuariosProvider();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 64, 127, 1.0),
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: sizeScreen.height * 0.15,
          ),
          titleSeneca(),
          inputUsuario(sizeScreen),
          inputPassword(sizeScreen),
          entrarButton(context,sizeScreen),
          lostPassword(),
          SizedBox(
            height: sizeScreen.height * 0.1,
          ),
          footPage()
        ]),
      ),
    );
  }

  Center titleSeneca() {
    return Center(
      child: Text('iSéneca',
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontSize: 56.0,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget footPage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage('assets/img/logo.png'),
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Junta de Andalucía',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Consejería de Educación y Deporte',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          Text(
            'v11.3.0',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  GestureDetector lostPassword() {
    return GestureDetector(
      onTap: (),
      child: Center(
        child: Column(
          children: [
            Text(
              'No recuerdo de mi contraseña',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '______________________________',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Container entrarButton(Size sizeScreen) {
    return Container(
      height: sizeScreen.height * 0.14,
      width: double.infinity,
      padding: EdgeInsets.all(sizeScreen.width * 0.07),
      child: FlatButton(
          child: Text("Entrar"),
          onPressed: () {
            comprobarUsuario();
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }

  Container inputPassword(Size sizeScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: sizeScreen.width * 0.07,
          vertical: sizeScreen.height * 0.02),
      child: TextField(
        style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            labelText: 'Contraseña',
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: Colors.white,
            )),
      ),
    );
  }

  Container inputUsuario(Size sizeScreen) {
    return Container(
      padding: EdgeInsets.all(sizeScreen.width * 0.07),
      child: TextField(
        style: TextStyle(color: Colors.white),
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          labelText: 'Usuario',
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void comprobarUsuario() async {
    final usuarios = await usuariosProvider.getUsuarios();

    usuarios.forEach((user) {
      if (user.user == _usuario && user.clave == _clave)
        Navigator.pushNamed(context, 'menus', arguments: _usuario);
    });
  }
}
