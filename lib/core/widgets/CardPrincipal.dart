import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class Cardprincipal extends StatelessWidget {
  final String? textoCard;
  final String? imagen;
  final bool isImageRight;
  final double? svgHeight;
  final Color? iconColor;
  final Color? colorTexto;
  final Color? contenedorColor; // 1. ¡Declaramos la nueva variable!
  final VoidCallback? onTap;
  final double? opacityBlur;
  final String? subTexto;

  const Cardprincipal({
    super.key,
    required this.textoCard,
    this.imagen,
    this.isImageRight = false,
    this.svgHeight = 100.0,
    this.iconColor,
    this.opacityBlur = 0.5,
    this.colorTexto,
    this.subTexto,
    this.contenedorColor, // 2. La pedimos en el constructor
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = imagen != null && imagen!.isNotEmpty;

    return BlurContainer(
      // 3. ¡LA MAGIA! Usamos tu color. Si no mandas ninguno (??), usa el del Tema por defecto.
      color: contenedorColor ?? Theme.of(context).colorScheme.primaryContainer,

      showShadow: true,
      opacity: opacityBlur!,

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor: Colors.transparent,
          child: Container(
            width: AppTheme.getMainWidth80(context),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- SVG A LA IZQUIERDA ---
                if (hasImage && !isImageRight) ...[
                  SizedBox(
                    height: svgHeight,
                    child: SvgPicture.asset(
                      imagen!,
                      fit: BoxFit.contain,
                      colorFilter: iconColor != null
                          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 15),
                ],

                // --- TEXTO ---
                Expanded(
                  child: subTexto != null
                      ? Column(
                          children: [
                            Text(
                              textoCard ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color:
                                        colorTexto ??
                                        Theme.of(
                                          context,
                                        ).colorScheme.inverseSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                            ),
                            Text(
                              subTexto ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color:
                                        colorTexto ??
                                        Theme.of(
                                          context,
                                        ).colorScheme.inverseSurface,

                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        )
                      : Text(
                          textoCard ?? "",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color:
                                    colorTexto ??
                                    Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                        ),
                ),

                // --- SVG A LA DERECHA ---
                if (hasImage && isImageRight) ...[
                  const SizedBox(width: 15),
                  SizedBox(
                    height: svgHeight,
                    child: SvgPicture.asset(
                      imagen!,
                      fit: BoxFit.contain,
                      colorFilter: iconColor != null
                          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
