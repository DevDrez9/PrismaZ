import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CardTexto extends StatelessWidget {
  final String? textoCard;
  final Color? color;
  final VoidCallback?
  onTap; // 1. Definimos el onTap como opcional (puede ser null)

  const CardTexto({
    super.key,
    required this.textoCard,
    this.color, // 2. Quitamos el valor por defecto de aquí
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 3. Aquí resolvemos el color: Si 'color' es null, usa el del Theme.
    final colorFinal = color ?? Theme.of(context).colorScheme.surface;

    // 4. Envolvemos el widget principal para detectar el toque
    return GestureDetector(
      onTap:
          onTap, // Si onTap es null, el GestureDetector simplemente lo ignora
      child: BlurContainer(
        color: colorFinal, // Usamos la variable que acabamos de resolver
        showShadow: true,
        opacity: 0.8,
        child: Container(
          width: AppTheme.getMainWidth80(context),
          height: 70,
          alignment: Alignment.center,
          child: Text(
            // Tip de seguridad: Usar ?? '' evita que la app colapse
            // si por error le pasas null, a diferencia de usar '!'
            textoCard ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
