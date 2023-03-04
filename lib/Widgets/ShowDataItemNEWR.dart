import 'package:flutter/material.dart';

class ShowDataItemNEWR extends StatelessWidget {
  final String text;
  ShowDataItemNEWR(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Text(text, textAlign: TextAlign.center));
  }
}
