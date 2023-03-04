import 'package:flutter/material.dart';

class GetNums extends StatelessWidget {
  final String text;
  GetNums(this.text);

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(0),
      margin: const EdgeInsets.only(top: 14, left: 30, right: 50),
      decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(labelText: text),
        controller: nombreController,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
