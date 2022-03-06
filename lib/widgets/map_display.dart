import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nudron/screens/map_page.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late GoogleMapController myController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.0,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapPage()));
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        )
      ],
    );
  }
}
