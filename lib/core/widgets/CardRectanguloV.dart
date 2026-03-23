import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class CardRectanguloV extends StatelessWidget {
  final String? textoCard;
  final String imagen;
  final double? svgHeight;
  final Color? iconColor;
  final VoidCallback? onTap;

  const CardRectanguloV({
    super.key,
    required this.textoCard,
    required this.imagen,
    this.svgHeight = 90.0,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. ¡LA MAGIA! Detectamos si la ruta termina en .svg (ignorando mayúsculas/minúsculas)
    final bool esSvg = imagen.toLowerCase().endsWith('.svg');

    return BlurContainer(
      color: Theme.of(context).colorScheme.surface,
      showShadow: true,
      opacity: 0.5,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          highlightColor: Colors.transparent,
          child: Container(
            width: AppTheme.getMainWidth25(context),
            height: MediaQuery.of(context).size.width * 0.45,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 2. Renderizado Condicional
                SizedBox(
                  height: svgHeight,
                  child: esSvg
                      ? SvgPicture.asset(
                          imagen, // Si es SVG, usa SvgPicture
                          fit: BoxFit.contain,
                          colorFilter: iconColor != null
                              ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                              : null,
                        )
                      : Image.asset(
                          imagen, // Si es PNG, JPG, JPEG, etc., usa Image nativo
                          fit: BoxFit.contain,
                          // Aplica el color a PNGs transparentes
                        ),
                ),

                const SizedBox(
                  height: 15,
                ), // Corrección: de width a height por estar en Column

                Text(
                  textoCard ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
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
