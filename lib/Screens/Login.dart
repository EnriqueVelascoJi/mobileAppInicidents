import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/HomePage.dart';
import '../Widgets/DisplayText.dart';
import 'DatosRecContraseña.dart';

class Login extends StatelessWidget {
  static const routeName = '/Login';
  final numeroAController = TextEditingController();
  final contraController = TextEditingController();
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
        //mainAxisAlignment: MainAxisAlignment.center,
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
              //onSubmitted: (){},
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
          ),
          DisplayText('Contraseña', 30),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: contraController,
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Ingresar'),
            ),
          ),
          DisplayText('¿No recuerdas tu contraseña?', 30),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DatosRecContrasena()),
              );
            },
            child: Text('Recuperar contraseña'),
          )
        ],
      ),
    );
  }
}
