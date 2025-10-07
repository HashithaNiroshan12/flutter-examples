import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:version_3_22_8/features/maps/domain/locations.dart'
    as locations;

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final Map<String, Marker> markers = {};
  late GoogleMapController googleMapController;
  late LatLng center = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) async {
    final getGoogleOffices = await locations.getGoogleOffices();
    setState(() {
      markers.clear();
      for (final office in getGoogleOffices.offices) {
        final marker = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lng),
            infoWindow:
                InfoWindow(title: office.name, snippet: office.address));
        markers[office.name] = marker;
      }
    });
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Office Locations'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition:
            const CameraPosition(target: LatLng(0, 0), zoom: 2),
        markers: markers.values.toSet(),
      ),
    );
  }
}
