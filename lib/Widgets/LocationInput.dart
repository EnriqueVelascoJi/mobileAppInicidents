import 'package:flutter/material.dart';
import 'package:location/location.dart';
//import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
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
          child: _previewImageUrl == null
              ? Text(
                  'Sin ubicación elegida',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
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
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
