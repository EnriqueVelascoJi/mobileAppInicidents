import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Agente.dart';

class ListaAgentes extends StatelessWidget {
  final List<Agente> agentes;
  //final Function bloquearAgente;
  ListaAgentes(this.agentes);
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
              agentes[index].nombre,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(agentes[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.block),
              color: Theme.of(context).errorColor,
              onPressed: () {},
            ),
          ),
        );
      }),
      itemCount: agentes.length,
    );
  }
}
