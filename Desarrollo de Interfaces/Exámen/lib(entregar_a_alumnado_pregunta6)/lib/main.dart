import 'package:flutter/material.dart';
//import 'package:iseneca_jandula/Pages/bbdd_page.dart';
import 'package:iseneca_jandula/Pages/login_page.dart';
import 'package:iseneca_jandula/Pages/menu_page.dart';


void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
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
        'home' : (BuildContext context) => LoginPage(),
        'menupage' : (BuildContext context) => MenuPage(),
      },
    );
  }
}
