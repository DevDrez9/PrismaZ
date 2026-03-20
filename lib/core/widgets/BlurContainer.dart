import 'dart:ui';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color color;
  final double opacity;
  final BorderRadius? borderRadius; // Radio personalizable
  final bool showShadow; // Interruptor de sombra
  final Color? borderColor; // Color de borde opcional

  const BlurContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.color = Colors.white,
    this.opacity = 0.1,
    this.borderRadius,
    this.showShadow = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // Usamos un radio por defecto si no se pasa uno
    final effectiveRadius = borderRadius ?? BorderRadius.circular(20);

    return Container(
      decoration: BoxDecoration(
        borderRadius: effectiveRadius,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: effectiveRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: effectiveRadius,
              border: Border.all(
                color: borderColor ?? Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
