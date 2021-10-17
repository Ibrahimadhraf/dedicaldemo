import 'dart:developer';

import 'package:dedicaldemo/model/response/spec_model_response.dart';
import 'package:dedicaldemo/view/helpers/application_utils/dialogs/helper_dialog.dart';
import 'package:dedicaldemo/view/helpers/application_utils/enums/filter_enum.dart';
import 'package:dedicaldemo/view/helpers/constants.dart';
import 'package:dedicaldemo/viewModels/filter_viewmodel.dart';
import 'package:dedicaldemo/viewModels/places_viewModel.dart';
import 'package:dedicaldemo/viewModels/speciality_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatefulWidget {
  IndexScreenWType? indexScreenWType;
  FilterDialog({this.indexScreenWType});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  FilterType selectedFilter = FilterType.SPECIALITY;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var specController = Provider.of<SpecViewModel>(context);
    var filterController = Provider.of<FilterViewModel>(context);
    var placesController = Provider.of<PlacesViewModel>(context);

    return AlertDialog(
      insetPadding: EdgeInsets.all(5),
      title: Text("Select Filter Type"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //FilterType
          Row(
            children: [
              Expanded(
                child: RadioListTile<FilterType>(
                  value: FilterType.SPECIALITY,
                  groupValue: selectedFilter,
                  onChanged: (v) {
                    setState(() {
                      selectedFilter = v!;
                    });
                  },
                  title: Text('SPECIALITY'),
                ),
              ),
              Expanded(
                child: RadioListTile<FilterType>(
                  value: FilterType.ADDRESS,
                  groupValue: selectedFilter,
                  onChanged: (v) {
                    setState(() {
                      selectedFilter = v!;
                    });
                  },
                  title: Text('ADDRESS'),
                ),
              )
            ],
          )
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
          textColor: Colors.blue,
        ),
        FlatButton(
          onPressed: () async {
            Navigator.pop(context);
            if (selectedFilter == FilterType.SPECIALITY) {
              await HelperDialogs.openSpecialityFilterDialog(
                  ctx: context,
                  selectedSpecs: [],
                  allSpec: specController.specModelResponse!.specs);
              // log(placesController.placeModelResponse!.places
              //     .where((element) => element.specId == result[0].id)
              //     .toList()
              //     .toString());
              // filterController.setMapFilteredPlaces(
              //     places: placesController.placeModelResponse!.places
              //         .where((element) => element.specId == result[0].id)
              //         .toList());

              // log("Result:${result}");
            } else {}
          },
          child: Text('Filter'),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
