import 'package:flutter/material.dart';
import 'package:incidentes_viales_colima/Screens/NuevoAdministrador.dart';
import '../Widgets/ListaAdministrador.dart';
import '../Administrador.dart';
import 'Login.dart';
import 'HomePage.dart';

class AgregarAdmin extends StatefulWidget {
  static const routeName = '/AgregarAdmin';
  @override
  State<AgregarAdmin> createState() => _AgregarAdminState();
}

class _AgregarAdminState extends State<AgregarAdmin> {
  final List<Administrador> _userAdmins = [];
  /*int changeStatus(int estatus) {
    setState(
      () {
         _userAgentes.where((ag){
          return ag.nombre = estatus;
         });
        );
      },
    );
  }*/

  void _addNewAdmin(
      String agNombre,
      String agApellidoP,
      String agApellidoM,
      String agNumeroAgente,
      String agPassword,
      int agEstatus,
      DateTime chosenDate) {
    final newAdministrador = Administrador(
      nombre: agNombre,
      apellidoP: agApellidoP,
      apellidoM: agApellidoM,
      numAgente: agNumeroAgente,
      password: agPassword,
      estatus: agEstatus,
      date: chosenDate,
    );

    setState(() {
      _userAdmins.add(newAdministrador);
    });
  }

  void _startAddNewAgente(BuildContext ctx) {
    showModalBottomSheet(
      isDismissible: false,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NuevoAdministrador(_addNewAdmin),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  /*void BloquearAgente(String nombre, int estado) {
    setState(
      () {_userAgentes.any((element) => false)},
    );
  }*/

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
                child: ListaAdministrador(_userAdmins)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewAgente(context),
      ),
    );
  }
}
