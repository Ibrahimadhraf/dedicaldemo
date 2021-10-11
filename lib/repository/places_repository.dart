import 'package:dedicaldemo/mock/mock_inceptors.dart';
import 'package:dedicaldemo/model/response/places_model.dart';

class PlacesRepository{

  static Future<PlaceModel> getPlaces() async {

    return await MockInterceptor().onRequest(
      RequestOptions.
      , v)
  }
}