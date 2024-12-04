import 'package:flutter/material.dart';
import 'package:practica_login/presentation/screens/providers/login_provider.dart';

class MessagefieldBox extends StatelessWidget {

  const MessagefieldBox({super.key});
  
  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final textcontroller2 = TextEditingController();
    final focusnode = FocusNode();
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        ),
      borderRadius: BorderRadius.circular(40)
      );

    final inputDecoration = InputDecoration(
      hintText: 'Usuario',
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      filled: true,
    );
      
    return TextFormField(
      onTapOutside: (event) {
        focusnode.unfocus();
        },
      focusNode: focusnode,
      controller: textcontroller,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //chatprovider.sendMessage(value);
        textcontroller.clear();
        focusnode.requestFocus();
      },
    );
  }
}