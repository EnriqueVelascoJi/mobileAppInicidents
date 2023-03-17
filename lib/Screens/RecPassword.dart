import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/HomePage.dart';

class RecPassword extends StatelessWidget {
  static const routeName = '/RecPassword';
  final numeroAController = TextEditingController();
  final contraController = TextEditingController();
  final contraconfirmaController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, bottom: 15),
              alignment: Alignment.center,
              child: Text('Inserte número de agente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Trykker',
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            Container(
              padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
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
            Container(
              padding: EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: Text('Inserte nueva Contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Trykker',
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
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
                //onSubmitted: (){},
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: Text(
                'Confirme nueva Contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Trykker',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
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
                controller: contraconfirmaController,
                //onSubmitted: (){},
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
