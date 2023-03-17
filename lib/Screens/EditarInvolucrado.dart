import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Login.dart';

class EditarInvolucrado extends StatelessWidget {
  const EditarInvolucrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);
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
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
