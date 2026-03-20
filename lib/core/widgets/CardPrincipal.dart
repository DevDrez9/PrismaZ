import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class Cardprincipal extends StatelessWidget {
  final String? textoCard;
  final String imagen;
  final double? svgHeight; // Parámetro para el alto del SVG
  final Color? iconColor; // Parámetro para el color del SVG

  const Cardprincipal({
    super.key,
    required this.textoCard,
    required this.imagen,
    this.svgHeight = 100.0, // Valor por defecto
    this.iconColor, // Si es null, el SVG usa sus colores originales
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      showShadow: true,
      opacity: 0.8,
      child: Container(
        width: AppTheme.getMainWidth375(context),
        height: 209,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contenedor para el SVG
            SizedBox(
              height: svgHeight,
              child: SvgPicture.asset(
                imagen,
                fit: BoxFit.contain,
                // Aplicamos el color solo si se proporciona uno
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              textoCard ?? "",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
