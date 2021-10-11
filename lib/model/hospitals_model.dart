import 'package:dedicaldemo/model/main_hospital_model.dart';

class HospitalsModel extends MainHospitalModel{
  late String? name;

  late int ? id;
  late String ? insurancePercent;
  late String ? address;

  HospitalsModel({ String ?city, String?  governorate,  String? specialty, this.id,
      this.insurancePercent ,this.name ,this.address}):super(specialty: specialty ,
  governorate: governorate ,city: city);
}