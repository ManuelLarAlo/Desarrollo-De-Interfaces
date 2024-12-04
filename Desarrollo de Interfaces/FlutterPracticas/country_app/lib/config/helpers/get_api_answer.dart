import 'package:country_app/domain/entities/country.dart';
import 'package:country_app/infraestructure/models/country_model.dart';
import 'package:dio/dio.dart';

class GetApiAnswer {
  final _dio = Dio();

  Future<Country> getAnswer() async {
    final response = await _dio.get('https://restcountries.com/v3.1/name');

    if (response.statusCode == 200) {
      final CountryModel pais= CountryModel.fromJsonMap(response.data);
      final Flags bandera = pais.flags;
      return countryModel.toMessageEntity();
    }

    throw UnimplementedError();
  }
}