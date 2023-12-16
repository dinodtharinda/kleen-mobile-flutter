import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kleen/utils/custom/app_custom_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  final Set<Marker> _markers = Set.of([]);
  @override
  Widget build(BuildContext context) {
    void addMarker(LatLng location) {
    const MarkerId markerId = MarkerId('1');
    final Marker marker = Marker(
      markerId: markerId,
      position: location,
      infoWindow: const InfoWindow(
        title: 'Marker Title',
        snippet: 'Marker Snippet',
      ),
      onTap: () {
        // Handle marker tap events here
        print('Marker Tapped');
      },
    );

    setState(() {
      _markers.add(marker);
    });
  }
    return Scaffold(

        // bottomNavigationBar:
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              onTap: (location) {
                 _markers.clear();
         
          addMarker(location);
              },
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                 
                });
              },
              initialCameraPosition: const CameraPosition(
                target: gmap.LatLng(37.7749, -122.4194), // Initial map center
                zoom: 12.0, // Initial zoom level
              ),
              minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
              zoomGesturesEnabled: true,
              indoorViewEnabled: true,
              markers: _markers,
            ),
            CustomButton(
              title: "Select Place",
              onTap: () {
                print("Select Place");
                 
              },
            ),
          ],
        ));
  }
}
