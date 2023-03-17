import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/RecPassword.dart';
import '../Widgets/DisplayText.dart';

class CodigoVer extends StatelessWidget {
  static const routeName = '/CodigoVer';
  final cController = TextEditingController();
  final oController = TextEditingController();
  final dController = TextEditingController();
  final iController = TextEditingController();
  final gController = TextEditingController();
  final ooController = TextEditingController();
  bool get wantKeepAlive => true;
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
      body: Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DisplayText('Ingrese código de verificación', 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'C',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: cController,
                    //onSubmitted: (){},
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Ó',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: oController,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'D',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: dController,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'I',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: iController,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'G',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: gController,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'O',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: ooController,
                  ),
                ),
              ],
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
                    MaterialPageRoute(builder: (context) => RecPassword()),
                  );
                },
                child: Text('Verificar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
