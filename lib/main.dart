import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/Login.dart';
import 'Screens/NuevoReporte.dart';
import 'Screens/HomePage.dart';
import 'Screens/RecPassword.dart';
import 'Screens/CodigoVer.dart';
import 'Screens/AgregarAgente.dart';
import 'Screens/AgregarAdmin.dart';

void main() {
  /* SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incidentes viales',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        errorColor: Colors.red,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Trykker',
          ),
        ),
      ),
      home: Login(),
      routes: {
        NuevoReporte.routeName: (ctx) => NuevoReporte(),
        Login.routeName: (ctx) => Login(),
        HomePage.routeName: (ctx) => HomePage(),
        RecPassword.routeName: (ctx) => RecPassword(),
        CodigoVer.routeName: (ctx) => CodigoVer(),
        //MisReportes.routeName: (ctx) => MisReportes(),
        //VerTodosLosReportes.routeName: (ctx) => VerTodosLosReportes(),
        AgregarAgente.routeName: (ctx) => AgregarAgente(),
        AgregarAdmin.routeName: (ctx) => AgregarAdmin(),
        //VerUsurarios.routeName: (ctx) => VerUsurios(),
      },
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Image.asset(
        'assets/images/im2.jpeg',
        height: 50,
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
      appBar: appBar,
      body: Center(
        child: Text('Navigation Time'),
      ),
    );
  }
}*/
