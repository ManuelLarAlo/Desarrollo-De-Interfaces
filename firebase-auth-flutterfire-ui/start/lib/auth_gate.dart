import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
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
            ],
            headerBuilder: (context, constraints, shrinkOffset) { //headerBuilder requiere que devuelva un Widget
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/flutterfire_300x.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                  ? const Text('Welcome to FlutterFire, please sign in!')
                  : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
          );
        }

        return const HomeScreen(); //Si contiene el objeto User, devuelve una HomeScreen, que es la parte de la apliación donde solo pueden acceder los usuarios autentificados
      },
    );
  }
}