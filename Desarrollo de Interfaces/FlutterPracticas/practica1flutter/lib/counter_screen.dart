import 'dart:ui';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COLORES'),
      ),
      body: const Center(child: Column(children: Row(children: [Container],),
      ),)
    );
  }
}