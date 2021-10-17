import 'dart:developer';

import 'package:dedicaldemo/model/response/places_model_response.dart';
import 'package:dedicaldemo/model/response/spec_model_response.dart';
import 'package:dedicaldemo/view/helpers/application_utils/enums/filter_enum.dart';
import 'package:dedicaldemo/view/widgets/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:get/get.dart';

class HelperDialogs {
  static showFilterDialog(
      {required BuildContext context, IndexScreenWType? type}) {
    showDialog(
        context: context,
        builder: (ctx) => FilterDialog(
              indexScreenWType: type,
            ));
  }

  static openSpecialityFilterDialog(
      {List<SpecModel>? allSpec,
      List<SpecModel>? selectedSpecs,
      BuildContext? ctx}) async {
    await FilterListDialog.display<SpecModel>(ctx,
        listData: allSpec!,
        selectedListData: selectedSpecs,
        headlineText: "Select Speciality",
        searchFieldHintText: "Search Here", choiceChipLabel: (item) {
      return item?.name;
    }, validateSelectedItem: (list, val) {
      return list!.contains(val);
    }, onItemSearch: (list, text) {
      if (list!.any((element) =>
          element.name.toLowerCase().contains(text.toLowerCase()))) {
        return list
            .where((element) =>
                element.name.toLowerCase().contains(text.toLowerCase()))
            .toList();
      } else {
        return [];
      }
    }, onApplyButtonClick: (list) {
      // Navigator.pop(context!);

      Get.back();
    });
  }
}
