import 'package:flutter/material.dart';
import '../models/Involucrado.dart';

class ListaInvolucrados extends StatelessWidget {
  final List<Involucrado> involucrados;
  ListaInvolucrados(this.involucrados);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(child: Text('Id'))),
            ),
            title: Text(
              involucrados[index].nombre,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            subtitle: Text(
              involucrados[index].consecuencias.toString(),
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            trailing: IconButton(
              icon: Icon(Icons.watch),
              color: Theme.of(context).errorColor,
              onPressed: () {},
            ),
            /*IconButton(
                  icon: Icon(Icons.edit),
                  color: Theme.of(context).errorColor,
                  onPressed: () {},
                ),*/

            onTap: () {},
          ),
        );
      }),
      itemCount: involucrados.length,
    );
  }
}
