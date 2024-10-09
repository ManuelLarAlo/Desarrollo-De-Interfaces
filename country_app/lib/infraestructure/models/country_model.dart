import 'package:country_app/domain/entities/country.dart';

class CountryModel {
  final String name;
  final String imageUrl;
  final String capital;

  CountryModel ({
    required this.name,
    required this.imageUrl,
    required this.capital,
  });

  factory CountryModel.fromJsonMap(Map<String, dynamic> json ) => CountryModel(
    name: json["name"], 
    imageUrl: json["image"], 
    capital: json["capital"]
  );

}