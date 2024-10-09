import 'package:country_app/presentation/screens/chat/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MessagefieldBox extends StatelessWidget {

  const MessagefieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final contentprovider = context.watch<ContentProvider>();
    final textcontroller = TextEditingController();
    final focusnode = FocusNode();
    //final colors = Theme.of(context).colorScheme;
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        ),
      borderRadius: BorderRadius.circular(40)
      );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      filled: true,

      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textcontroller.value.text;
          contentprovider.sendMessage(textValue);
          textcontroller.clear();
        },
      ),
    );
      
    return TextFormField(
      onTapOutside: (event) {
        focusnode.unfocus();
        },
      focusNode: focusnode,
      controller: textcontroller,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        chatprovider.sendMessage(value);
        textcontroller.clear();
        focusnode.requestFocus();
      },
      onChanged: (value) {
        print("Changed $value");
      }
    );
  }
}