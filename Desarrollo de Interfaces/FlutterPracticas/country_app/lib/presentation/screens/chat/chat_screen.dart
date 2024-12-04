import 'package:country_app/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tortilla'),
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView();

  @override
  Widget build(BuildContext context) {
    final contentprovider = null;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: contentprovider.scrollController,
                itemCount: contentprovider.messageList.length,
                itemBuilder: (context, index) {
                  final message= contentprovider.messageList[index]; 
                  return null;
                }
              )
            ),
            const SizedBox(height: 10)
          ],
        )
      ),
    );
  }
}