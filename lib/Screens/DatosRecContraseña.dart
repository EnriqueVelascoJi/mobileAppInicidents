import 'package:flutter/material.dart';
import '../Widgets/DisplayText.dart';
import 'CodigoVer.dart';

class DatosRecContrasena extends StatelessWidget {
  final numeroAController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Image.asset(
        'assets/images/im2.PNG',
        height: MediaQuery.of(context).size.height,
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {},
            child: Text(
              'Incidentes viales Colima',
              style: TextStyle(fontFamily: 'Trykker'),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.cyan,
    );
    return Scaffold(
      backgroundColor: ThemeData.light().backgroundColor,
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DisplayText('Inserte número de agente', 60),
          Container(
            padding: EdgeInsets.only(
              right: 30,
              left: 30,
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Número agente',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              controller: numeroAController,
            ),
          ),
          DisplayText(
              'Se enviará un código de verificación al número vinculado a este agente',
              30),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CodigoVer()),
                );
              },
              child: Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
