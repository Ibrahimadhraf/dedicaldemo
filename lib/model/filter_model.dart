import 'package:dedicaldemo/model/main_hospital_model.dart';

class FilterModel extends MainHospitalModel{


  FilterModel({ String? city ,String? governorate ,String? specialty}) :super(city: city ,
  governorate:  governorate , specialty: specialty);
}