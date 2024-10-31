import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person), //Cuando se pulsa este botón, se crea una ruta anónima y navega hacia ella, es una ruta que mostrará el widget ProfileScreen
            onPressed: () {                 //Que se devuelve desde la llamada MaterialPage.builder
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen( //Cuando se crea la instancia de ProfileScreen, le pasa la lista de acciones al argumento actions
                    appBar: AppBar(                    //El ProfileScreen.appBar acepta un Widget appBar normal
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [ //El Widget ProfileScreen tiene el argumento children, que acepta una lista de widgets, los cuales se colocarán verticalmente dentro de un
                      const Divider(), //Widget column, que se usa internamente para crear ProfileScreen
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('flutterfire_300x.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('dash.png'),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
