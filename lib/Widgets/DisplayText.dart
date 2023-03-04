import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final double top;
  DisplayText(this.text, this.top);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: top, bottom: 15),
      alignment: Alignment.center,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Trykker',
              fontWeight: FontWeight.bold,
              fontSize: 18)),
    );
  }
}
