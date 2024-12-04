import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iseneca_jandula/Models/usuarios_model.dart';

class UsuariosProvider {
  String _url = 'script.google.com';
  String _spreadsheetId = '1bkQCsGJNSRkdoeoz626OurCi-6qrBy1BpWHAA6Xm';
  String _sheet = 'users';

  Future<List<Usuario>> getUsuarios() async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbwzIS56cYwERWAYsya9DYtJkMzsqcThJYjaR-mXP4nkgd1P8uZjvoZhxr5gs57/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheets': _sheet,
        });

    final resp = await _procesarRespuesta(url);
    return resp;
  }

  Future<List<Usuario>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final usuarios = Usuarios.fromJsonList(decodedData);
    return usuarios.items;
  }
}