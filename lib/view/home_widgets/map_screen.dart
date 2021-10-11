import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  var location = LatLng(30.0596185, 31.1884234);
  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(30.0596185, 31.1884234),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) _controller.complete(controller);
            },
          ),
        )
      ],
    );
  }
}
