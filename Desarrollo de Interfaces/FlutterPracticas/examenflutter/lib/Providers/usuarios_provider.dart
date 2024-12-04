import 'dart:async';
import 'dart:convert';
import 'package:examenflutter/Models/usuarios_model.dart';
import 'package:dio/dio.dart';


class UsuariosProvider {
  final String _url = 'script.google.com';
  final String _spreadsheetId = '1KfhMOxfC2nm_O9s5mxVK-fSHXV44xgXVkvLVcv-2XVU';
  final String _sheet = 'usuarios';

  final _dio = Dio();
  
  Future<List<Usuario>> getUsuarios() async {
    final url = Uri.https(
        _url,
        'macros/s/AKfycbyPsB_koj3MwkmRFn8IJU-k4sOP8nRfnHHKNNt9xov9INZ1VEsQbu96gDR8Seiz0oDGOQ/exec',
        {
          'spreadsheetId': _spreadsheetId,
          'sheets': _sheet,
        });

    final resp = await _procesarRespuesta(url);
    return resp;
  }

  Future<List<Usuario>> _procesarRespuesta(Uri url) async {
    final resp = await _dio.get(url.toString());
    final decodedData = json.decode(resp.toString());

    final usuarios = Usuarios.fromJsonList(decodedData);
    return usuarios.items;
  }
}

