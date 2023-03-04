import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final Image image;
  OptionItem(this.id, this.title, this.color, this.image);

  void selectOption(BuildContext ctx) {
    switch (id) {
      case 'op1':
        Navigator.of(ctx).pushNamed(
          '/Nuevo_Reporte',
          arguments: {
            'id': id,
          },
        );
        break;
      case 'op2':
        Navigator.of(ctx).pushNamed(
          '/RecPassword',
        );
        break;
      case 'op3':
        Navigator.of(ctx).pushNamed(
          '/VerTodosLosReportes',
        );
        break;
      case 'op4':
        Navigator.of(ctx).pushNamed(
          '/AgregarAgente',
        );
        break;
      case 'op5':
        Navigator.of(ctx).pushNamed(
          '/AgregarAdmin',
        );
        break;
      case 'op6':
        Navigator.of(ctx).pushNamed(
          '/VerUsuarios',
        );
        break;
      case 'op7':
        Navigator.of(ctx).pushNamed(
          '/DescrgrBD',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectOption(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(27),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 39,
              child: image,
            )
          ],
        ),

        //color: color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.2),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(27),
        ),
      ),
    );
  }
}
