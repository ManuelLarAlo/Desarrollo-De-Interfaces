import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: Wrap(
        spacing: 10,
        children: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.add),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.red;
                  }
                  else if (states.contains(WidgetState.hovered)) {
                    return Colors.blue;
                  }
                return null;
                }
              ),
              shape: WidgetStateProperty.all(const CircleBorder()),
            )
          ),
        ],
      )
    );
  }
}