import 'package:dedicaldemo/model/response/base_response.dart';

class PlaceModel extends BaseResponse {
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

  PlaceModel.fromJson(Map<String, dynamic> json) : super(json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['url'] = this.url;
    data['insurranceDiscount'] = this.insurranceDiscount;
    data['spec_id'] = this.specId;
    return data;
  }
}
