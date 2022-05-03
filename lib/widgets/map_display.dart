import 'dart:async';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nudron/config/map_helper.dart';
import 'package:nudron/models/map_marker.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/screens/map_page.dart';
import 'package:provider/provider.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  final Completer<GoogleMapController> _mapController = Completer();
  late GoogleMapController myController;
  final Set<Marker> _markers = Set();
  final List _rawMarkers = [];
  final int _minClusterZoom = 0;
  final int _maxClusterZoom = 19;
  Fluster<MapMarker>? _clusterManager;
  double _currentZoom = 15;

  bool _isMapLoading = true;
  bool _areMarkersLoading = true;
  final Color _clusterColor = Colors.orange;
  final Color _clusterTextColor = Colors.white;
  final String _markerImageUrl =
      'https://img.icons8.com/emoji/48/000000/blue-circle-emoji.png';
  final LatLng _center = const LatLng(
    19.06954050064087,
    72.82650232315063,
  );

  void _onMapCreated(GoogleMapController controller) {
    controller
        .setMapStyle(_mapStyle)
        .then((value) => _mapController.complete(controller));

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers();
  }

  final List<LatLng> _markerLocations = [];

  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(MapMarker(
        id: _markerLocations.indexOf(markerLocation).toString(),
        position: markerLocation,
        icon: markerImage,
        window:
            _rawMarkers[_markerLocations.indexOf(markerLocation)].infoWindow,
      ));
    }

    _clusterManager = await MapHelper.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
  }

  Future<void> _updateMarkers([double? updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      
      _clusterTextColor,
      80,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }

  void setLatLngList() {
    Provider.of<MapDataProvider>(context).mapDataList.forEach((element) {
      _rawMarkers.add(element);
    });
    Provider.of<MapDataProvider>(context).mapDataList.forEach((element) {
      _markerLocations.add(element.position);
    });
  }

  String _mapStyle = '';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setLatLngList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: Stack(
        children: <Widget>[
          
          // Google Map widget
          Opacity(
            opacity: _isMapLoading ? 0 : 1,
            child: GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: _currentZoom,
              ),
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
          ),

          // Map loading indicator
          Opacity(
            opacity: _isMapLoading ? 1 : 0,
            child: Center(child: CircularProgressIndicator()),
          ),

          // Map markers loading indicator
          if (_areMarkersLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 2,
                  color: Colors.grey.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'Loading',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
