import 'package:flutter/material.dart';
import 'models/actionData.dart';

final actionstOptions = [
  ActionData(
    id: 'op1',
    title: 'Llenar reporte',
    color: Colors.purple,
    indicador: Image.asset('assets/images/Reporte.PNG'),
  ),
  ActionData(
    id: 'op2',
    title: 'Mis reportes',
    color: Colors.red,
    indicador: Image.asset('assets/images/MisReportes.PNG'),
  ),
  ActionData(
    id: 'op3',
    title: 'Ver Todos los reportes',
    color: Colors.indigoAccent,
    indicador: Image.asset('assets/images/Ver.PNG'),
  ),
  ActionData(
    id: 'op4',
    title: 'Agregar agente',
    color: Colors.lightGreen,
    indicador: Image.asset('assets/images/AddAgente.PNG'),
  ),
  ActionData(
    id: 'op5',
    title: 'Agregar administrador',
    color: Colors.yellow,
    indicador: Image.asset('assets/images/AddAdmin.PNG'),
  ),
  ActionData(
    id: 'op6',
    title: 'Ver todos los usuarios',
    color: Colors.teal,
    indicador: Image.asset('assets/images/Ver.PNG'),
  ),
  ActionData(
    id: 'op7',
    title: 'Descargar Base de Datos',
    color: Colors.deepOrange,
    indicador: Image.asset('assets/images/Download.PNG'),
  ),
];
