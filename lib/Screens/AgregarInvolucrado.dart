import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/models/Involucrado.dart';
import '../Widgets/NuevosInvolucrados.dart';
import 'Login.dart';
import 'HomePage.dart';
import '../Widgets/ListaInvolucrado.dart';

class AgregarInvolucrado extends StatefulWidget {
  static const routeName = '/AgregarInvolucrado';
  @override
  State<AgregarInvolucrado> createState() => _AgregarInvolucradoState();
}

class _AgregarInvolucradoState extends State<AgregarInvolucrado> {
  final List<Involucrado> _userInvolucrado = [];
  void _addNewInvolucrado(
      String invNombre,
      String invApellidoP,
      String invApellidoM,
      int invEdad,
      int invSexo,
      int invSobriedad,
      int invCinturon,
      int invConsecuencias,
      int invTipoInvolucrado,
      int invModoTransporte) {
    final newInvolucrado = Involucrado(
        nombre: invNombre,
        apellidoP: invApellidoP,
        apellidoM: invApellidoM,
        edad: invEdad,
        sexo: invSexo,
        sobriedad: invSobriedad,
        cinturon: invCinturon,
        consecuencias: invConsecuencias,
        tipoInvolucrado: invTipoInvolucrado,
        modoTransporte: invModoTransporte);

    setState(() {
      _userInvolucrado.add(newInvolucrado);
    });
  }

  void _startAddNewInvolucrado(BuildContext ctx) {
    showModalBottomSheet(
      isDismissible: false,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NuevosInvolucrados(_addNewInvolucrado),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.7,
                child: ListaInvolucrados(_userInvolucrado)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewInvolucrado(context),
      ),
    );
  }
}
