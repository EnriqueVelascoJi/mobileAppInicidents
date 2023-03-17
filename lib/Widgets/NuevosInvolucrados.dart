import 'package:flutter/material.dart';

enum Sexo {
  Hombre,
  Mujer,
  SinDato,
}

enum Sobriedad {
  Si,
  No,
  SinDato,
  NoAplica,
}

enum UsoCinturon {
  Si,
  No,
  SinDato,
  NoAplica,
}

enum Consecuencias {
  Fallecido,
  Herido,
  SinHeridad,
}

enum TipoInvolucrado {
  Conductor,
  Pasajero,
  Peaton,
}

enum ModoDeTransporte {
  Automovil,
  CamionetaDePasajeros,
  Microbus,
  CamionUrbPasajeros,
  Omnibus,
  CamionetaDeCarga,
  CamionDeCarga,
  Tractor,
  Ferrocarril,
  Motocicleta,
  Bicicleta,
  Peaton,
  OtroVehiculo,
}

class NuevosInvolucrados extends StatefulWidget {
  final Function addInvolucrado;
  NuevosInvolucrados(this.addInvolucrado);

  @override
  State<NuevosInvolucrados> createState() => _NuevosInvolucradosState();
}

class _NuevosInvolucradosState extends State<NuevosInvolucrados> {
  final nombreController = TextEditingController();
  final apellidoPController = TextEditingController();
  final apellidoMController = TextEditingController();
  final edadController = TextEditingController();
  int opSexo;
  int opSobriedad;
  int opCinturon;
  int opConsecuencias;
  int opTipoInvolucrado;
  int opModoTransporte;

  void submitData() {
    if (nombreController.text.isEmpty) {
      return;
    }
    final enteredName = nombreController.text;
    final enteredApellidoP = apellidoPController.text;
    final enteredApellidoM = apellidoMController.text;
    final enteredEdad = int.parse(edadController.text);
    final enteredSexo = opSexo;
    final enteredSobriedad = opSobriedad;
    final enteredCinturon = opCinturon;
    final enteredConsecuencias = opConsecuencias;
    final enteredInvolucrado = opTipoInvolucrado;
    final enteredTransporte = opModoTransporte;

    if (enteredName.isEmpty) {
      return;
    }

    widget.addInvolucrado(
      enteredName,
      enteredApellidoP,
      enteredApellidoM,
      enteredEdad,
      enteredSexo,
      enteredSobriedad,
      enteredCinturon,
      enteredConsecuencias,
      enteredInvolucrado,
      enteredTransporte,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Nombre'),
                controller: nombreController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Apellido Paterno'),
                controller: apellidoPController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Apellido Materno'),
                controller: apellidoMController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Edad'),
                controller: edadController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),

                // onChanged: (val) => amountInput = val,
              ),
              Row(
                children: [
                  Expanded(child: Text('Sexo')),
                  Expanded(
                    child: PopupMenuButton<Sexo>(
                      onSelected: (Sexo op) {
                        switch (op) {
                          case Sexo.Hombre:
                            setState(() {
                              opSexo = op.index;
                            });

                            break;
                          case Sexo.Mujer:
                            setState(() {
                              opSexo = op.index;
                            });
                            break;
                          case Sexo.SinDato:
                            setState(() {
                              opSexo = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Sexo>>[
                        CheckedPopupMenuItem<Sexo>(
                          value: Sexo.Hombre,
                          child: Text('Hombre'),
                          checked: opSexo == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<Sexo>(
                          value: Sexo.Mujer,
                          child: Text('Mujer'),
                          checked: opSexo == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<Sexo>(
                          value: Sexo.SinDato,
                          child: Text('Sin Dato'),
                          checked: opSexo == 2 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Sobriedad')),
                  Expanded(
                    child: PopupMenuButton<Sobriedad>(
                      onSelected: (Sobriedad op) {
                        switch (op) {
                          case Sobriedad.Si:
                            setState(() {
                              opSobriedad = op.index;
                            });

                            break;
                          case Sobriedad.No:
                            setState(() {
                              opSobriedad = op.index;
                            });
                            break;
                          case Sobriedad.SinDato:
                            setState(() {
                              opSobriedad = op.index;
                            });
                            break;
                          case Sobriedad.NoAplica:
                            setState(() {
                              opSobriedad = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Sobriedad>>[
                        CheckedPopupMenuItem<Sobriedad>(
                          value: Sobriedad.Si,
                          child: Text('Si'),
                          checked: opSobriedad == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<Sobriedad>(
                          value: Sobriedad.No,
                          child: Text('No'),
                          checked: opSobriedad == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<Sobriedad>(
                          value: Sobriedad.SinDato,
                          child: Text('Sin Dato'),
                          checked: opSobriedad == 2 ? true : false,
                        ),
                        CheckedPopupMenuItem<Sobriedad>(
                          value: Sobriedad.NoAplica,
                          child: Text('No Aplica'),
                          checked: opSobriedad == 3 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Uso de cinturón')),
                  Expanded(
                    child: PopupMenuButton<UsoCinturon>(
                      onSelected: (UsoCinturon op) {
                        switch (op) {
                          case UsoCinturon.Si:
                            setState(() {
                              opCinturon = op.index;
                            });
                            break;
                          case UsoCinturon.No:
                            setState(() {
                              opCinturon = op.index;
                            });
                            break;
                          case UsoCinturon.SinDato:
                            setState(() {
                              opCinturon = op.index;
                            });
                            break;
                          case UsoCinturon.NoAplica:
                            setState(() {
                              opCinturon = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<UsoCinturon>>[
                        CheckedPopupMenuItem<UsoCinturon>(
                          value: UsoCinturon.Si,
                          child: Text('Si'),
                          checked: opCinturon == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<UsoCinturon>(
                          value: UsoCinturon.No,
                          child: Text('No'),
                          checked: opCinturon == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<UsoCinturon>(
                          value: UsoCinturon.SinDato,
                          child: Text('Sin Dato'),
                          checked: opCinturon == 2 ? true : false,
                        ),
                        CheckedPopupMenuItem<UsoCinturon>(
                          value: UsoCinturon.NoAplica,
                          child: Text('No Aplica'),
                          checked: opCinturon == 3 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Consecuencias')),
                  Expanded(
                    child: PopupMenuButton<Consecuencias>(
                      onSelected: (Consecuencias op) {
                        switch (op) {
                          case Consecuencias.Fallecido:
                            setState(() {
                              opConsecuencias = op.index;
                            });
                            break;
                          case Consecuencias.Herido:
                            setState(() {
                              opConsecuencias = op.index;
                            });
                            break;
                          case Consecuencias.SinHeridad:
                            setState(() {
                              opConsecuencias = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Consecuencias>>[
                        CheckedPopupMenuItem<Consecuencias>(
                          value: Consecuencias.Fallecido,
                          child: Text('Fallecido'),
                          checked: opConsecuencias == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<Consecuencias>(
                          value: Consecuencias.Herido,
                          child: Text('Herido'),
                          checked: opConsecuencias == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<Consecuencias>(
                          value: Consecuencias.SinHeridad,
                          child: Text('Sin heridas'),
                          checked: opConsecuencias == 2 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Tipo de involucrado')),
                  Expanded(
                    child: PopupMenuButton<TipoInvolucrado>(
                      onSelected: (TipoInvolucrado op) {
                        switch (op) {
                          case TipoInvolucrado.Conductor:
                            setState(() {
                              opTipoInvolucrado = op.index;
                            });
                            break;
                          case TipoInvolucrado.Pasajero:
                            setState(() {
                              opTipoInvolucrado = op.index;
                            });
                            break;
                          case TipoInvolucrado.Peaton:
                            setState(() {
                              opTipoInvolucrado = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<TipoInvolucrado>>[
                        CheckedPopupMenuItem<TipoInvolucrado>(
                          value: TipoInvolucrado.Conductor,
                          child: Text('Conductor'),
                          checked: opTipoInvolucrado == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<TipoInvolucrado>(
                          value: TipoInvolucrado.Pasajero,
                          child: Text('Pasajero'),
                          checked: opTipoInvolucrado == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<TipoInvolucrado>(
                          value: TipoInvolucrado.Peaton,
                          child: Text('Peatón'),
                          checked: opTipoInvolucrado == 2 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Modo de transporte')),
                  Expanded(
                    child: PopupMenuButton<ModoDeTransporte>(
                      onSelected: (ModoDeTransporte op) {
                        switch (op) {
                          case ModoDeTransporte.Automovil:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.CamionetaDePasajeros:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Microbus:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.CamionUrbPasajeros:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Omnibus:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.CamionetaDeCarga:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.CamionDeCarga:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Tractor:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Ferrocarril:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Motocicleta:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Bicicleta:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.Peaton:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                          case ModoDeTransporte.OtroVehiculo:
                            setState(() {
                              opModoTransporte = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<ModoDeTransporte>>[
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Automovil,
                          child: Text('Automóvil'),
                          checked: opModoTransporte == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.CamionetaDePasajeros,
                          child: Text('Camioneta de pasajeros'),
                          checked: opModoTransporte == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Microbus,
                          child: Text('Microbús'),
                          checked: opModoTransporte == 2 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.CamionUrbPasajeros,
                          child: Text('Camión urbano de pasajeros'),
                          checked: opModoTransporte == 3 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Omnibus,
                          child: Text('Autobús (Ómnibus)'),
                          checked: opModoTransporte == 4 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.CamionetaDeCarga,
                          child: Text('Camioneta de carga'),
                          checked: opModoTransporte == 5 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.CamionDeCarga,
                          child: Text('Camión de carga'),
                          checked: opModoTransporte == 6 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Tractor,
                          child: Text('Tractor con o sin remolque'),
                          checked: opModoTransporte == 7 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Ferrocarril,
                          child: Text('Ferrocarril'),
                          checked: opModoTransporte == 8 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Motocicleta,
                          child: Text('Motocicleta'),
                          checked: opModoTransporte == 9 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Bicicleta,
                          child: Text('Bicicleta'),
                          checked: opModoTransporte == 10 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.Peaton,
                          child: Text('Persona caminando (Peatón'),
                          checked: opModoTransporte == 11 ? true : false,
                        ),
                        CheckedPopupMenuItem<ModoDeTransporte>(
                          value: ModoDeTransporte.OtroVehiculo,
                          child: Text('Otro vehículo'),
                          checked: opModoTransporte == 12 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Text('Cancelar'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: Text('Agregar Involucrado'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                      ),
                      onPressed: submitData,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
