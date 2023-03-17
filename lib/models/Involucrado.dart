import 'package:flutter/foundation.dart';

class Involucrado {
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final int edad;
  final int sexo;
  final int sobriedad;
  final int cinturon;
  final int consecuencias;
  final int tipoInvolucrado;
  final int modoTransporte;
  Involucrado({
    @required this.nombre,
    this.apellidoP,
    this.apellidoM,
    @required this.edad,
    @required this.sexo,
    @required this.sobriedad,
    @required this.cinturon,
    @required this.consecuencias,
    @required this.tipoInvolucrado,
    @required this.modoTransporte,
  });
}
