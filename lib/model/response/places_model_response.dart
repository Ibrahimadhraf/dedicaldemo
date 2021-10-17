import 'package:dedicaldemo/model/response/base_response.dart';

class PlaceModelResponse extends BaseResponse {
  late List<PlaceModel> places;
  PlaceModelResponse.fromJson(Map<String, dynamic> json) : super(json) {
    if (json['data'] != null) {
      places = [];
      List dataList = json['data'];
      dataList.forEach((element) {
        places.add(PlaceModel.fromJson(element));
      });
    }
  }
}

class PlaceModel {
  late int id;
  late String name;
  late String price;
  late String img;
  late String address;
  late String country;
  late String city;
  late double latitude;
  late double longitude;
  late String url;
  late int insurranceDiscount;
  late int specId;
  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    url = json['url'];
    insurranceDiscount = json['insurranceDiscount'];
    specId = json['spec_id'];
  }
}
