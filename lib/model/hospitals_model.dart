import 'package:dedicaldemo/model/main_hospital_model.dart';

class HospitalsModel extends MainHospitalModel {
  late String? name;

  late int? id;
  late String? insurancePercent;
  late String? address;
  late double? lat;
  late double? lng;

  HospitalsModel(
      {String? city,
      String? governorate,
      String? specialty,
      this.id,
      this.insurancePercent,
      this.name,
      this.lat,
      this.lng,
      this.address})
      : super(specialty: specialty, governorate: governorate, city: city);
}
