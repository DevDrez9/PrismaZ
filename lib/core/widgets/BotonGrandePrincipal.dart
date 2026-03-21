import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class BotonGrandePrincipal extends StatelessWidget {
  final String? textoCard;
  final String imagen;
  final double? svgHeight;
  final Color? iconColor;
  final VoidCallback? onTap; // 1. Agregamos el callback de acción

  const BotonGrandePrincipal({
    super.key,
    required this.textoCard,
    required this.imagen,
    this.svgHeight = 100.0,
    this.iconColor,
    this.onTap, // Parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      color: Theme.of(context).colorScheme.primaryContainer,
      showShadow: true,
      opacity: 0.8,
      child: Material(
        // 2. Agregamos Material para que el InkWell funcione
        color: Colors.transparent, // Importante que sea transparente
        child: InkWell(
          onTap: onTap, // 3. Asignamos la acción
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor: Colors.transparent,
          child: Container(
            width: AppTheme.getMainWidth80(context),
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: svgHeight,
                  child: SvgPicture.asset(
                    imagen,
                    fit: BoxFit.contain,
                    colorFilter: iconColor != null
                        ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                        : null,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  textoCard ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
