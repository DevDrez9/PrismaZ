import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CardTexto extends StatelessWidget {
  final String? textoCard;

  const CardTexto({super.key, required this.textoCard});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      showShadow: true,
      opacity: 0.8,
      child: Container(
        width: AppTheme.getMainWidth80(context),
        height: 70,
        alignment: AlignmentGeometry.center,
        child: Text(
          textoCard!,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
