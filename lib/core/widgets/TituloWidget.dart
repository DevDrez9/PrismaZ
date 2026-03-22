import 'package:flutter/material.dart';

class Titulowidget extends StatelessWidget {
  final String titulo;

  const Titulowidget({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      width: 300,
      child: Text(
        titulo,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Theme.of(context).colorScheme.inverseSurface,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
