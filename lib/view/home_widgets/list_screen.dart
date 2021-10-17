import 'package:dedicaldemo/view/home_widgets/details_screen.dart';
import 'package:dedicaldemo/viewModels/places_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var placeController = Provider.of<PlacesViewModel>(context);

    return (placeController.placeModelResponse?.status != 200)
        ? Center(child: Text(placeController.placeModelResponse?.message ?? ""))
        : Center(
            child: ListView(
              children: [
                ...placeController.placeModelResponse!.places.map(
                  (e) => ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(
                                    placeModel: e,
                                  ))),
                      title: Text(e.name),
                      trailing: Icon(Icons.arrow_forward_ios)),
                )
              ],
            ),
          );
  }
}
