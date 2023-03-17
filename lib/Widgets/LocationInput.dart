import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';
import '../Helpers/location_helper.dart';
import '../Screens/Map_Screen.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  FlutterMap _previewImage;
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final StaticMapImage = LocationHelper.generateLocationPreviewImage(
        latitud: locData.latitude, longitud: locData.longitude);
    setState(() {
      _previewImage = StaticMapImage;
    });
  }

  Future<void> _SelectOnMap() async {
    final locData = await Location().getLocation();
    final selectedLocation = await Navigator.of(context).push<MapLatLng>(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: ((context) =>
              MapScreen(locData.latitude, locData.longitude))),
    );
    if (selectedLocation == null) {
      return;
    }
    print(selectedLocation.latitude);
    print(selectedLocation.longitude);
    final StaticMapImage = LocationHelper.generateLocationPreviewImage(
        latitud: selectedLocation.latitude,
        longitud: selectedLocation.longitude);
    setState(() {
      _previewImage = StaticMapImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 170,
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            alignment: Alignment.center,
            child: _previewImage == null
                ? Text(
                    'Sin ubicación elegida',
                    textAlign: TextAlign.center,
                  )
                : _previewImage),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: Text('Ubicación Actual'),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: Text('Elegir en mapa'),
              onPressed: _SelectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}
