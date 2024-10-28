import 'package:flutter/material.dart';
import 'package:flutter_login/presentation/providers/usuarios_provider.dart';
import 'package:flutter_login/domain/entities/usuario.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers(); 
  }

  Future<void> _fetchUsers() async {
    final users = await UserProvider.fetchUsers();

    setState(() {
      _users = users; 
    });
  }

  void _login() {
    final username = userController.text;
    final password = passwordController.text;

    // Validamos si el usuario existe en la lista
    bool userExists = _users.any((user) =>
        user.username == username && user.password == password);

    if (userExists) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: username),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error de inicio de sesión'),
            content: const Text('El usuario y la contraseña no coinciden.'),
            actions: [
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
