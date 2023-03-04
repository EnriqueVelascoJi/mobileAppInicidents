import 'dart:io';

class Places {
  final double latitud;
  final double longitud;
  final String calle1;
  final String calle2;
  final String numero;
  final File imageUrl;

  Places({
    this.calle1,
    this.calle2,
    this.numero,
    this.latitud,
    this.longitud,
    this.imageUrl,
  });
}
