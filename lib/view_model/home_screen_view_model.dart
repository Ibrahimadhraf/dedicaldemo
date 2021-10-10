import 'dart:developer';

import 'package:dedicaldemo/model/filter_model.dart';
import 'package:dedicaldemo/model/hospitals_model.dart';
import 'package:dedicaldemo/view/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:filter_list/filter_list.dart';
class HomeScreenViewModel extends GetxController {
  List<HospitalsModel> filterHospitalList =[];
  List<FilterModel> filterList = [
    FilterModel(specialty: "Cardiology / cardiac surgery", governorate: "test"),
    FilterModel(
      specialty: "Dentistry",
    ),
    FilterModel(
      specialty: "Dermatology",
    ),
    FilterModel(
      specialty: "Ear, nose and throat (ENT)",
    ),
    FilterModel(
      specialty: "Endocrinology",
    ),
    FilterModel(
      specialty: "Gastroenterology",
    ),
    FilterModel(
      specialty: "Hematology",
    ),
    FilterModel(
      specialty: "Internal Medicine",
    ),
    FilterModel(specialty: "Nephrology"),
    FilterModel(
      specialty: "Obstetrics and Gynecology",
    ),
    FilterModel(
      specialty: "Ophthalmology",
    ),
    FilterModel(
      specialty: "Orthopedics",
    ),
    FilterModel(
      specialty: "Pediatrics",
    ),
    FilterModel(
      specialty: "Plastic surgery",
    ),
    FilterModel(
      specialty: "Urology",
    ),
    FilterModel(
      specialty: "Veterinary medicine",
    ),
  ];
  List<HospitalsModel> hospitalsList = [
    HospitalsModel(
        specialty: "Cardiology / cardiac surgery",
        city: "Cairo",
        id: 1,
        name: "مستشفي جامعة الدول ",
        address:
            "٢٦ شارع جامعة الدول العربية امام بوابة نادي الزمالك بالمهندسين أعلي مترو ماركت",
        governorate: "Cairo"),
    HospitalsModel(
        specialty: "Dentistry",
        id: 2,
        name: "Coptic Hospital",
        city: "Cairo",
        governorate: "Cairo",
        address: "Ramsis st. extension - beside NBE branch - Cairo"),
    HospitalsModel(
        specialty: "Ear, nose and throat (ENT)",
        id: 3,
        name: "Al Helal Hospital",
        city: "Cairo",
        governorate: "Cairo",
        address: " شارع شريف باشا، Al Fawalah, Abdeen, Cairo Governorate"),
    HospitalsModel(
        specialty: "Endocrinology",
        id: 4,
        address: " شارع شريف باشا، Al Fawalah, Abdeen, Cairo Governorate",
        name: "مستشفى القاهرة التخصصى",
        city: "Cairo",
        governorate: "Cairo"),
    HospitalsModel(
        specialty: "Gastroenterology",
        id: 5,
        name: "El-Gomhoria Teaching Hospital",
        city: "Cairo",
        governorate: "Cairo",
        address:
            " 12 El Baramouny St، 12 ش البارمونى، As Saqqyin، Abdeen, Cairo"),
    HospitalsModel(
        id: 11,
        specialty: "Hematology",
        name: "Al Helal Hospital",
        city: "Cairo",
        governorate: "Cairo",
        address:
            "4 Haret Abou Shalouaa, Al Mansi, Bab El Sharia, Cairo Governorate"),
    HospitalsModel(
        specialty: "Internal Medicine",
        id: 6,
        name: "مستشفى الجلاء التعليمى",
        governorate: "Cairo",
        city: "Cairo",
        address:
            "El-Galaa St, Al Qalayah, Al Azbakeya, Cairo Governorate 11432"),
    HospitalsModel(
        specialty: "Nephrology",
        id: 7,
        name: "Cairo fatemic hospital",
        city: "Cairo",
        governorate: "Cairo",
        address: "El-Gamaleya, El Gamaliya, Cairo Governorate"),
    HospitalsModel(
        specialty: "Obstetrics and Gynecology",
        id: 8,
        name: "مستشفى قصر العيني التعليمي الجديد",
        governorate: "Cairo",
        city: "Cairo",
        address: "10 Doctor Rd, Al Eini, El Sayeda Zeinab, Cairo Governorate"),
    HospitalsModel(
        specialty: "Ophthalmology",
        id: 9,
        city: "Cairo",
        governorate: "Cairo",
        name: "مستشفى الحكمة",
        address: "القصر العيني، الدواوين، عابدي،"),
    HospitalsModel(
        specialty: "Orthopedics",
        id: 10,
        name: "Italian Hospital",
        address: "17 El Sarayat St, Abbassieh Abbassieh"),
    HospitalsModel(
        specialty: "Pediatrics", id: 11, city: 'Cairo', governorate: "Cairo" ,
        name: "مستشفى الحكمة",
        address: "القصر العيني، الدواوين، عابدي،"),
    HospitalsModel(
        specialty: "Plastic surgery",
        id: 12,
        name: "Dar El-Shefa Hospital",
        address: "25 Mohammed Al Fahmi, Al Abbaseyah Al Gharbeyah, El Weili"),
    HospitalsModel(
        specialty: "Urology",
        id: 13,
        name: "Greek Hospital in Cairo",
        address: " ١٥ احمد فؤاد السرايات",
        city: "Cairo",
        governorate: 'Cairo'),
    HospitalsModel(specialty: "Veterinary medicine", id: 14 ,name: "Misr International Hospital",
    address: "12ش السرايا، ميدان فيني",governorate: "Giza",city: "Giza"),
    HospitalsModel(id: 15 ,specialty: "Cardiology / cardiac surgery" ,city: 'Giza',governorate: "Giza" ,
    name: "مستشفى الجيزة التخصصى" ,address: " محمد الذكي، متفرع من شارع خاتم المرسلين الهرم ، الجيزة,"),
    HospitalsModel(id: 16 ,name:"Al Haram Hospital" ,specialty: "Obstetrics and Gynecology" ,governorate: 'Giza',
    city: 'Giza',address: 'Al Haram, Oula Al Haram, El Omraniya, Giza Governorate' ,
    ),
    // HospitalsModel(id: 17),
    // HospitalsModel(id: 18),
    // HospitalsModel(id: 19),
    // HospitalsModel(id: 20),
    // HospitalsModel(id: 21),
    // HospitalsModel(id: 22),
  ];
  void openFilterSpecialistDialog() async {
    await FilterListDialog.display<FilterModel>(
        Get.context,
        useSafeArea: true,
        listData: filterList,

        height: SizeConfig().screenHeight*.85,
        headlineText: "Select Country",
        headerTextStyle:  TextStyle(
            color: Colors.blue,
            fontSize: SizeConfig().fontSize16
        ),
        searchFieldHintText: "Search Here",
        choiceChipLabel: (item) {
          return item!.specialty;
        },
        validateSelectedItem: (list, val) {
          return list!.contains(val);
        },
        onItemSearch: (list, text) {

          if (list!.any((element) =>
              element.specialty!.toLowerCase().contains(text.toLowerCase()))) {
            return list
                .where((element) =>
                element.specialty!.toLowerCase().contains(text.toLowerCase()))
                .toList();

          }
          else{
            return [];
          }
        },
        onApplyButtonClick: (list) {
          if (list != null) {
            filterHospitalList.clear();
       for(int i=0; i<list.length;i++){
           filterHospitalList.addAll(hospitalsList.where((element) => element.specialty==list[i].specialty ).toList());

           log("${filterHospitalList.length}");

       }
              log("${list.last.specialty}");
            update();
          }
          Navigator.pop(Get.context!);
        });
  }
}
