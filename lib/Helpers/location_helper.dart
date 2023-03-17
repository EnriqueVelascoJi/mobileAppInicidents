import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationHelper {
  static FlutterMap generateLocationPreviewImage(
      {double latitud, double longitud}) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(latitud, longitud),
        zoom: 9.2,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
                width: 80,
                height: 80,
                point: LatLng(latitud, longitud),
                builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {},
                      ),
                    ))
          ],
        ),
      ],
    );
  }
}
