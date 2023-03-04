import 'package:flutter/material.dart';

class ActionData {
  final String id;
  final String title;
  final Color color;
  final Image indicador;

  ActionData({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
    @required this.indicador,
  });
}
