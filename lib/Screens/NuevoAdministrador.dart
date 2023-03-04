import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Estatus {
  DadoDeBaja,
  InActivo,
  Activo,
}

class NuevoAdministrador extends StatefulWidget {
  final Function addAgente;
  NuevoAdministrador(this.addAgente);

  @override
  State<NuevoAdministrador> createState() => _NuevoAdminState();
}

class _NuevoAdminState extends State<NuevoAdministrador> {
  final nombreController = TextEditingController();
  final apellidoPController = TextEditingController();
  final apellidoMController = TextEditingController();
  final numeroAgenteController = TextEditingController();
  final passwordController = TextEditingController();
  Estatus opciones;
  int opSelected = 3;
  bool estado = false;

  final DateTime selectedDate = DateTime.now();
  void submitData() {
    if (nombreController.text.isEmpty) {
      return;
    }
    final enteredName = nombreController.text;
    final enteredApellidoP = apellidoPController.text;
    final enteredApellidoM = apellidoMController.text;
    final enteredNumeroAgente = numeroAgenteController.text;
    final enteredPassword = passwordController.text;
    final enteredEstatus = opSelected;

    if (enteredName.isEmpty ||
        enteredNumeroAgente.isEmpty ||
        enteredPassword.isEmpty ||
        selectedDate == null) {
      return;
    }

    widget.addAgente(
      enteredName,
      enteredApellidoP,
      enteredApellidoM,
      enteredNumeroAgente,
      enteredPassword,
      enteredEstatus,
      selectedDate,
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
                decoration: InputDecoration(labelText: 'Número de agente'),
                controller: numeroAgenteController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                controller: passwordController,
                onSubmitted: (_) => submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Row(
                children: [
                  Expanded(child: Text('Estatus')),
                  Expanded(
                    child: PopupMenuButton<Estatus>(
                      onSelected: (Estatus op) {
                        switch (op) {
                          case Estatus.Activo:
                            setState(() {
                              opSelected = op.index;
                            });

                            break;
                          case Estatus.DadoDeBaja:
                            setState(() {
                              opSelected = op.index;
                            });

                            break;
                          case Estatus.InActivo:
                            setState(() {
                              opSelected = op.index;
                            });
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Estatus>>[
                        CheckedPopupMenuItem<Estatus>(
                          value: Estatus.DadoDeBaja,
                          child: Text('Dado de baja'),
                          checked: opSelected == 0 ? true : false,
                        ),
                        CheckedPopupMenuItem<Estatus>(
                          value: Estatus.InActivo,
                          child: Text('Inactivo'),
                          checked: opSelected == 1 ? true : false,
                        ),
                        CheckedPopupMenuItem<Estatus>(
                          value: Estatus.Activo,
                          child: Text('Activo'),
                          checked: opSelected == 2 ? true : false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        DateFormat.yMd().format(selectedDate),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                child: Text('Agregar Usuario'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                ),
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
