import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:flutter/material.dart';

class FilterViewModel extends ChangeNotifier {
  // List<PlaceModel> allPlaces = [];
  var mapFilteredPlaces = <PlaceModel>[];
  var listFilteredPlaces = <PlaceModel>[];

  void setMapFilteredPlaces({List<PlaceModel>? places}) {
    mapFilteredPlaces.clear();
    mapFilteredPlaces.addAll(places!);
    notifyListeners();
  }

  void setListFilteredPlaces({List<PlaceModel>? places}) {
    listFilteredPlaces.clear();
    listFilteredPlaces.addAll(places!);
    notifyListeners();
  }
}
