import 'package:examenflutter/Pages/login_page.dart';
import 'package:examenflutter/Pages/menu_page.dart';
import 'package:flutter/material.dart';
//import 'package:iseneca_jandula/Pages/bbdd_page.dart';


void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iSeneca IES Jándula',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        'home' : (BuildContext context) => const LoginPage(),
        'menupage' : (BuildContext context) => MenuPage(),
      },
    );
  }
}
