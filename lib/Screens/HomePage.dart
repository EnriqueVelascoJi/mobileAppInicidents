import 'package:flutter/material.dart';
import '../ActionOptions.dart';
import '../OptionItem.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Image.asset(
        'assets/images/im2.PNG',
        height: 50,
      ),
      actions: <Widget>[
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
      appBar: appBar,
      backgroundColor: ThemeData.light().backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Text(
              'Hola @Agente!',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Text(
              '¿Que vamos a hacer hoy?',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(25),
              children: actionstOptions
                  .map(
                    (opData) => OptionItem(
                      opData.id,
                      opData.title,
                      opData.color,
                      opData.indicador,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
