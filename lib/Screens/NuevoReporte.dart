import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/AgregarInvolucrado.dart';
import 'package:incidentes_viales_colima/Screens/Login.dart';
import 'package:intl/intl.dart';
import '../Widgets/ShowDataItemNEWR.dart';
import 'HomePage.dart';
import '../Widgets/DispMenus.dart';
import '../Widgets/GetNums.dart';
import '../Widgets/imageImput.dart';
import '../Widgets/GetText.dart';
import '../Widgets/LocationInput.dart';

enum Clasificacion {
  Nofatal,
  Fatal,
  SoloDanos,
}

enum TipoIncidente {
  VehiculoAutomotor,
  Peaton,
  Animal,
  ObjetoFijo,
  Volcadura,
  Pasajero,
  SalidaCamino,
  Incendio,
  Ferrocarril,
  Motocicleta,
  Ciclista,
  Multiple,
  Otro,
}

enum Superficie {
  Empedrado,
  HuellasRodamiento,
  Adoquin,
  Concreto,
  Asfalto,
  Terraceria,
}

class NuevoReporte extends StatelessWidget {
  static const routeName = '/Nuevo_Reporte';

  //final List<DataNR> datos;
  //NuevoReporte(this.datos);

  //final String opcionId;
  @override
  Widget build(BuildContext context) {
    /*final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;*/
    final DateTime date = DateTime.now();
    int opSelected1;
    int opSelected2;
    int opSelected3;
    // final categoryId = routeArgs['id'];
    /*final opcionselected = actionstOptions.where(
      (opcion) {
        return opcion.id.contains(categoryId);
      },
    ).toList();*/

    final appBar = AppBar(
      title: Image.asset(
        'assets/images/im2.PNG',
        height: 50,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.logout,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        )
      ],
      backgroundColor: Colors.cyan,
    );
    return Scaffold(
      backgroundColor: ThemeData.light().backgroundColor,
      appBar: appBar,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: ShowDataItemNEWR('No. Incidente'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: ShowDataItemNEWR(DateFormat.yMMMd().format(date)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: ShowDataItemNEWR(DateFormat.Hms().format(date)),
                ),
              ),
            ],
          ),
          GetText('Calle 1'),
          GetText('Calle 2'),
          GetText('Número'),
          LocationInput(),
          Row(
            children: [
              Expanded(
                child: DispMenus('Clasificación'),
              ),
              PopupMenuButton<Clasificacion>(
                onSelected: (Clasificacion op) {
                  switch (op) {
                    case Clasificacion.Fatal:
                      opSelected1 = op.index;

                      break;
                    case Clasificacion.Nofatal:
                      opSelected1 = op.index;

                      break;
                    case Clasificacion.SoloDanos:
                      opSelected1 = op.index;

                      break;
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Clasificacion>>[
                  CheckedPopupMenuItem<Clasificacion>(
                    value: Clasificacion.Fatal,
                    child: Text('Fatal'),
                    checked: opSelected1 == 0 ? true : false,
                  ),
                  CheckedPopupMenuItem<Clasificacion>(
                    value: Clasificacion.Nofatal,
                    child: Text('No fatal'),
                    checked: opSelected1 == 1 ? true : false,
                  ),
                  CheckedPopupMenuItem<Clasificacion>(
                    value: Clasificacion.SoloDanos,
                    child: Text('Solo daños'),
                    checked: opSelected1 == 2 ? true : false,
                  ),
                ],
              ),
            ],
          ),
          GetNums('No. personas fallecidas'),
          GetNums('No. personas heridas'),
          GetNums('No. personas involucradas'),
          Row(
            children: [
              Expanded(
                child: DispMenus('Tipo de incidente'),
              ),
              PopupMenuButton<TipoIncidente>(
                onSelected: (TipoIncidente op) {
                  switch (op) {
                    case TipoIncidente.VehiculoAutomotor:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Peaton:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Animal:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.ObjetoFijo:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Volcadura:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Pasajero:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.SalidaCamino:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Incendio:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Ferrocarril:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Motocicleta:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Ciclista:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Multiple:
                      opSelected2 = op.index;
                      break;
                    case TipoIncidente.Otro:
                      opSelected2 = op.index;
                      break;
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<TipoIncidente>>[
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.VehiculoAutomotor,
                    child: Text('Colisión con vehículo automotor'),
                    checked: opSelected2 == 0 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Peaton,
                    child: Text('Colisión con peatón'),
                    checked: opSelected2 == 1 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Animal,
                    child: Text('Colisión con animal'),
                    checked: opSelected2 == 2 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.ObjetoFijo,
                    child: Text('Colisión con Objeto fijo'),
                    checked: opSelected2 == 3 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Volcadura,
                    child: Text('Volcadura'),
                    checked: opSelected2 == 4 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Pasajero,
                    child: Text('Caída de pasajero'),
                    checked: opSelected2 == 5 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.SalidaCamino,
                    child: Text('Salida del camino'),
                    checked: opSelected2 == 6 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Incendio,
                    child: Text('Incendio'),
                    checked: opSelected2 == 7 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Ferrocarril,
                    child: Text('Colisión con ferrocarril'),
                    checked: opSelected2 == 8 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Motocicleta,
                    child: Text('Colisión con motocicleta'),
                    checked: opSelected2 == 9 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Ciclista,
                    child: Text('Colisión con ciclista'),
                    checked: opSelected2 == 10 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Multiple,
                    child: Text('Colisión multiple'),
                    checked: opSelected2 == 11 ? true : false,
                  ),
                  CheckedPopupMenuItem<TipoIncidente>(
                    value: TipoIncidente.Otro,
                    child: Text('Otro'),
                    checked: opSelected2 == 12 ? true : false,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DispMenus('Superficie'),
              ),
              PopupMenuButton<Superficie>(
                onSelected: (Superficie op) {
                  switch (op) {
                    case Superficie.Empedrado:
                      opSelected3 = op.index;
                      break;
                    case Superficie.HuellasRodamiento:
                      opSelected3 = op.index;
                      break;
                    case Superficie.Adoquin:
                      opSelected3 = op.index;
                      break;
                    case Superficie.Concreto:
                      opSelected3 = op.index;
                      break;
                    case Superficie.Asfalto:
                      opSelected3 = op.index;
                      break;
                    case Superficie.Terraceria:
                      opSelected3 = op.index;
                      break;
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Superficie>>[
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.Empedrado,
                    child: Text('Empedrado'),
                    checked: opSelected3 == 0 ? true : false,
                  ),
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.HuellasRodamiento,
                    child: Text('Huellas de rodamiento'),
                    checked: opSelected3 == 1 ? true : false,
                  ),
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.Adoquin,
                    child: Text('Adoquín'),
                    checked: opSelected3 == 2 ? true : false,
                  ),
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.Concreto,
                    child: Text('Concreto'),
                    checked: opSelected3 == 3 ? true : false,
                  ),
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.Asfalto,
                    child: Text('Asfalto'),
                    checked: opSelected3 == 4 ? true : false,
                  ),
                  CheckedPopupMenuItem<Superficie>(
                    value: Superficie.Terraceria,
                    child: Text('Terracería'),
                    checked: opSelected3 == 5 ? true : false,
                  ),
                ],
              ),
            ],
          ),
          ImageInput(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0.8),
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(217, 217, 217, 1)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text('Cancelar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.8),
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(217, 217, 217, 1)),
                      ),
                      onPressed: () {},
                      child: Text('Guardar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.8),
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(217, 217, 217, 1)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgregarInvolucrado()),
                        );
                      },
                      child: Text('Continuar'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
