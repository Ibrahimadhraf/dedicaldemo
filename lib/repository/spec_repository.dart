import 'package:dedicaldemo/mock/mock_inceptors.dart';
import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:dedicaldemo/model/response/spec_model_response.dart';

class SpecRepository {
  static Future<SpecModelResponse> getSpecs() async {
    return SpecModelResponse.fromJson(
        await JsonMockInterceptor.getData("spec"));
  }
}
