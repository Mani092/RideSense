import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesense/search%20location.dart';
import 'package:get/get.dart';

class location extends StatefulWidget {

  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  var controller = Get.put(selected_loc());

  final Completer<GoogleMapController> con = Completer();
  @override
  Widget build(BuildContext context) {
    Marker marker = Marker(
      markerId: MarkerId('selected_location'), // Unique ID for the marker
      position: LatLng(controller.lat.value, controller.long.value),
      infoWindow: InfoWindow(
        title: 'Selected Location',
        snippet: 'Lat: ${controller.lat.value}, Long: ${controller.long.value}',
      ),
    );
    CameraPosition cammpos = CameraPosition(
      target: LatLng(controller.lat.value, controller.long.value),
      zoom:14,);
print(controller.lat);
print(controller.long);
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        backgroundColor: Colors.transparent,

      ),

      body: GoogleMap (

        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        // zoomGesturesEnabled: true,
        markers: {marker},
        initialCameraPosition: cammpos,
        onMapCreated: (GoogleMapController gmc) {
          con.complete(gmc);
        },

      ),
    );
  }
}
