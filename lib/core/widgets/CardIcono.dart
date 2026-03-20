import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

enum IconPosition { left, right }

class CardIconoTexto extends StatelessWidget {
  final String texto;
  final String svgPath;

  // Parámetros de Estilo de Texto
  final Color? textColor;
  final double fontSize;

  // Parámetros de Icono
  final Color? iconColor;
  final double iconSize; // Nuevo: Tamaño del icono
  final IconPosition iconPosition;

  // Parámetros de Fondo (Blur)
  final Color? backgroundColor; // Nuevo: Color del fondo
  final double backgroundOpacity; // Nuevo: Opacidad del fondo
  final double blurAmount;

  final VoidCallback? onTap;

  const CardIconoTexto({
    super.key,
    required this.texto,
    required this.svgPath,
    this.textColor,
    this.fontSize = 16.0,
    this.iconColor,
    this.iconSize = 24.0, // Tamaño por defecto
    this.iconPosition = IconPosition.left,
    this.backgroundColor, // Si es null, BlurContainer usa su defecto
    this.backgroundOpacity = 0.2, // Opacidad por defecto
    this.blurAmount = 10.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Preparamos el Icono
    Widget icono = SvgPicture.asset(
      svgPath,
      height: iconSize,
      width: iconSize,
      colorFilter: iconColor != null
          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
          : null,
    );

    // 2. Preparamos el Texto
    Widget contenidoTexto = Expanded(
      child: Text(
        texto,
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: BlurContainer(
        // Pasamos los nuevos datos al BlurContainer
        color: backgroundColor ?? Colors.white,
        opacity: backgroundOpacity,
        blur: blurAmount,
        child: Container(
          width: AppTheme.getMainWidth80(context),
          height: 70,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Se ajusta al contenido
            children: [
              if (iconPosition == IconPosition.left) ...[
                icono,
                const SizedBox(width: 12),
              ],

              contenidoTexto,

              if (iconPosition == IconPosition.right) ...[
                const SizedBox(width: 12),
                icono,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
