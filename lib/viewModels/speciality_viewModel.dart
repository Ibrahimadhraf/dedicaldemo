import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:dedicaldemo/model/response/spec_model_response.dart';
import 'package:dedicaldemo/repository/places_repository.dart';
import 'package:dedicaldemo/repository/spec_repository.dart';
import 'package:flutter/material.dart';

class SpecViewModel extends ChangeNotifier {
  SpecModelResponse? specModelResponse;
  getAllSpecs() async {
    specModelResponse = await SpecRepository.getSpecs();
    notifyListeners();
  }
}
