import 'package:dio/dio.dart';
import 'package:flutter_login/domain/entities/usuario.dart';
import 'package:flutter_login/infraestructure/models/usuario_model.dart';

class GetAnswer {
  final _dio = Dio();

  Future<Usuario> getAnswer() async {
    final response = await _dio.get('Url del spreadsheet');

    if (response.statusCode == 200) {
      final userModel = UserModel.fromJsonMap(response.data);
      return userModel.toEntity();
    }

    throw UnimplementedError();
  }
}
