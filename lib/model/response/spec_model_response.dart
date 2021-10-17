import 'package:dedicaldemo/model/response/base_response.dart';

class SpecModelResponse extends BaseResponse {
  List<SpecModel>? specs;
  SpecModelResponse.fromJson(Map<String, dynamic> json) : super(json) {
    if (json['data'] != null) {
      specs = [];
      List dataList = json['data'];
      dataList.forEach((element) {
        specs!.add(SpecModel.fromJson(element));
      });
    }
  }
}

class SpecModel {
  late int id;
  late String name;

  SpecModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
