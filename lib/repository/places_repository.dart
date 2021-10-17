import 'package:dedicaldemo/mock/mock_inceptors.dart';
import 'package:dedicaldemo/model/response/places_model_response.dart';

class PlacesRepository {
  static Future<PlaceModelResponse> getPlaces() async {
    return PlaceModelResponse.fromJson(
        await JsonMockInterceptor.getData("places"));
  }
}
