import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nudron/models/map_data.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
        ], color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: GoogleMap(
          markers: markerList,
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 20.0,
          ),
        ),
      ),
    ));
  }
}
