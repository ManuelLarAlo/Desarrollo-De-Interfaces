import 'package:flutter/material.dart';
import 'package:practica_login/presentation/screens/Widgets/shared/messagefield_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body:  Center(
        child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              const Text('Nombre de Usuario'),
              TextFormField(),
              const Text('Contraseña'),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}