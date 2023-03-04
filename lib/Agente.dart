import 'package:flutter/foundation.dart';

class Agente {
  final String nombre;
  final String apellidoP;
  final String apellidoM;
  final String numAgente;
  final String password;
  int estatus;
  final DateTime date;
  Agente(
      {@required this.nombre,
      this.apellidoP,
      this.apellidoM,
      @required this.numAgente,
      @required this.password,
      @required this.estatus,
      this.date});
}
