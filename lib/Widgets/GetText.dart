import 'package:flutter/material.dart';

class GetText extends StatelessWidget {
  final textController = TextEditingController();
  final String text;
  GetText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 14),
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
        controller: textController,
      ),
    );
  }
}
