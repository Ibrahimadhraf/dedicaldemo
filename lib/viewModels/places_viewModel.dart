import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:dedicaldemo/repository/places_repository.dart';
import 'package:flutter/material.dart';

class PlacesViewModel extends ChangeNotifier {
  PlaceModelResponse? placeModelResponse;
  getAllPlaces() async {
    placeModelResponse = await PlacesRepository.getPlaces();
    notifyListeners();
  }
}
