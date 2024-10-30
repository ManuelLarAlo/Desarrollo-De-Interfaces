import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

// TODO(codelab user): Get API key
const clientId = 'YOUR_CLIENT_ID';

void main() async {
 WidgetsFlutterBinding.ensureInitialized(); //Le dice a Flutter que no comience a ejecutar el código del widget de la aplicación hasta que el marco de Flutter esté completamente iniciado
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
 //Firebase.initializeApp configura una conexión entre tu aplicación Flutter y tu proyecto de Firebase. 
 //DefaultFirebaseOptions.currentPlatform se importa desde nuestro archivo firebase_options.dart generado


 runApp(const MyApp());
}
