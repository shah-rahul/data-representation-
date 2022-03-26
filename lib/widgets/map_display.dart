import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/screens/map_page.dart';
import 'package:provider/provider.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late GoogleMapController myController;
  final LatLng _center = const LatLng(
    19.06954050064087,
    72.82650232315063,
  );

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markerList = Provider.of<MapDataProvider>(context).mapDataList;

    return Stack(
      children: [
        GoogleMap(
          markers: markerList,
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MapPage()));
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        )
      ],
    );
  }
}
