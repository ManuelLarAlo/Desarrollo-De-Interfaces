import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), //Si el usuario se autentifica devuelve un objeto User de firebase, sino devuelve null
      builder: (context, snapshot) {
        if (!snapshot.hasData) { //snapshot.hasData comprueba si el valor de la secuencia contiene el objeto User
          return SignInScreen( //Si no contiene el objeto User, devuelve el Widget SignInScreen (hay que actualizarlo ahora) 
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: '321733913852-h7fuae4nbd16j54vqhv8depmf1frf24q.apps.googleusercontent.com'),
            ],
            headerBuilder: (context, constraints, shrinkOffset) { //headerBuilder requiere que devuelva un Widget
              return Padding(                                     //El header solo funciona para verlo en móvil, para comprobar si el header está bien o no basta con
                padding: const EdgeInsets.all(20),                //hacer la pantalla más pequeña, si queremos que se vea en web la imagen, tenemos que usar sideBuilder (abajo)
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/flutterfire_300x.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) { //Los argumentos de devolución de llamada incluyen una acción de tipo AuthAction, que es una enumeración que puede utilizar
              return Padding(                    //para detectar si la pantalla en la que se encuentra el usuario es la de iniciar sesión o la de registro
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                  ? const Text('Welcome to FlutterFire, please sign in!')
                  : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) { //Es el mismo argumento que el subtitleBuilder, está destinado a texto en lugar de imágenes, por lo que no expone BoxContraints ni shrinkOffset
              return const Padding(            //Se puede agregar cualquier Widget
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, shrinkOffset) { //Acepta una devolución de llamada, con los argumentros BuildContext y double shrinkOffset, se mostrará a la izquierda
              return Padding(                      //del formulario de inicio de sesión, este Widget solo se muestra en apliaciones web y escritorio
                padding: const EdgeInsets.all(20), //funciona internamente con un punto de interrupción, si la pantalla tiene más de 800 píxeles de ancho, se muestra el contenido lateral y no el encabezado
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('flutterfire_300x.png'),
                ),
              );
            },
          );
        }

        return const HomeScreen(); //Si contiene el objeto User, devuelve una HomeScreen, que es la parte de la apliación donde solo pueden acceder los usuarios autentificados
      },
    );
  }
}