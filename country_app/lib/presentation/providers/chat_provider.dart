import 'package:country_app/config/helpers/get_api_answer.dart';
import 'package:country_app/domain/entities/country.dart';
import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {

  final ScrollController scroll = ScrollController();
  final GetApiAnswer getApiAnswer = GetApiAnswer();

    Future<void> sendMessage(String text) async {
      if (text.isEmpty) return;
      notifyListeners();
  }
}