import 'package:flutter/material.dart';

class DispMenus extends StatelessWidget {
  final String text;
  DispMenus(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 14, left: 30),
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
