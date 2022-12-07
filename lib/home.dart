import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _marker.addAll(list);
    // TODO: implement initState
    super.initState();
  }

  late Completer<GoogleMapController> _completer;
  static final CameraPosition _kGooglePlek =
      CameraPosition(target: LatLng(23.777176, 90.399452), zoom: 14.4746);
  List<Marker> _marker = [];
  final List<Marker> list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(23.777176, 90.399452),
        infoWindow: InfoWindow(title: "My Pogit")),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
            compassEnabled: false,
            myLocationEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _completer.complete(controller);
            },
            initialCameraPosition: _kGooglePlek),
      ),
    );
  }
}
