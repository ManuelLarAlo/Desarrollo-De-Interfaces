import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practica_login/config/theme/app_theme.dart';
import 'package:practica_login/presentation/screens/login_screen.dart';
import 'package:practica_login/presentation/screens/providers/login_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider() )
      ],
      child: MaterialApp(
        theme: AppTheme( selectedColor: 0).theme(),
        home: const LoginScreen(),
      ),
    );
  }
}