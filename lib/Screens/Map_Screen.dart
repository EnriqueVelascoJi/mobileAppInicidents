import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapScreen extends StatefulWidget {
  final double latitudInicial;
  final double longitudInicial;

  MapScreen(this.latitudInicial, this.longitudInicial);
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapLatLng _markerPosition;
  MapZoomPanBehavior _mapZoomPanBehavior;
  MapTileLayerController _controller;
  @override
  void initState() {
    _controller = MapTileLayerController();
    _mapZoomPanBehavior = MapZoomPanBehavior(zoomLevel: 16);
    super.initState();
  }

  void updateMarkerChange(Offset position) {
    // We have converted the local point into latlng and inserted marker
    // in that position.
    _markerPosition = _controller.pixelToLatLng(position);
    if (_controller.markersCount > 0) {
      _controller.clearMarkers();
    }
    _controller.insertMarker(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir ubicación'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.of(context).pop(_markerPosition);
            },
          ),
        ],
      ),

      // To obtain the maps local point, we have added a gesture
      // detector to the map’s widget.
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          updateMarkerChange(details.localPosition);
        },
        child: SfMaps(
          layers: [
            MapTileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              zoomPanBehavior: _mapZoomPanBehavior,
              initialFocalLatLng:
                  MapLatLng(widget.latitudInicial, widget.longitudInicial),
              controller: _controller,
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _markerPosition.latitude,
                  longitude: _markerPosition.longitude,
                  child: Icon(Icons.location_on, color: Colors.red),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
