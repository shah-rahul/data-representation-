import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nudron/config/geoQueries.dart';
import 'package:nudron/models/map_data.dart';

class MapDataProvider extends ChangeNotifier {
  GeoHasher hasher = GeoHasher();
  Set<Marker> mapDataList = {};
  void mapLoader() async {
    final String response = await rootBundle.loadString('assets/mapData.json');
    final data = await json.decode(response) as List;
    data.forEach((element) {
      var data = hasher.decode(element[1]);
      mapDataList.add(Marker(
          markerId: MarkerId(element[0].toString()),
          position: LatLng(data[1], data[0]),
          infoWindow: InfoWindow(
              title: element[2], snippet: "devices : ${element[3]}")));
    });
    notifyListeners();
  }
}
