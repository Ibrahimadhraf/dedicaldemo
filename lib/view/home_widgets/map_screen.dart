import 'dart:async';

import 'package:dedicaldemo/view/helpers/application_utils/dialogs/helper_dialog.dart';
import 'package:dedicaldemo/view/helpers/application_utils/enums/filter_enum.dart';
import 'package:dedicaldemo/viewModels/filter_viewmodel.dart';
import 'package:dedicaldemo/viewModels/home_screen_view_model.dart';
import 'package:dedicaldemo/viewModels/places_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  var location = LatLng(30.0596185, 31.1884234);
  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(30.0596185, 31.1884234),
    zoom: 13,
  );
  @override
  Widget build(BuildContext context) {
    var placeController = Provider.of<PlacesViewModel>(context);

    return (placeController.placeModelResponse?.status != 200)
        ? Center(child: Text(placeController.placeModelResponse?.message ?? ""))
        : GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: Set.from(placeController.placeModelResponse!.places.map(
                (e) => Marker(
                    markerId: MarkerId(e.id.toString()),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(e.latitude, e.longitude)))),
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) _controller.complete(controller);
            },
          );
  }
}
