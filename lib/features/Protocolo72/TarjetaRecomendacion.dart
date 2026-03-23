import 'package:flutter/material.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class TarjetaRecomendacion extends StatelessWidget {
  final String texto;
  final String? subtexto; // Es opcional (?)
  final IconData icono;

  // Colores personalizables con valores por defecto similares a tu imagen
  final Color colorTexto;
  final Color colorSubtexto;
  final Color colorIcono;
  final Color colorFondoIcono;

  const TarjetaRecomendacion({
    super.key,
    required this.texto,
    this.subtexto, // No tiene 'required', así que puede ir vacío
    required this.icono,
    this.colorTexto = const Color(0xFFC93B3E), // Rojo oscuro
    this.colorSubtexto = const Color(0xFF333333), // Gris muy oscuro
    this.colorIcono = const Color(0xFFC93B3E), // Rojo oscuro
    this.colorFondoIcono = const Color(0xFFFFEAEA), // Rosado/Rojo muy claro
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      opacity: 0.9,
      color: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // Sombra muy suave para que resalte del fondo como en tu diseño
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 1. Círculo con el Icono
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: colorFondoIcono,
                shape: BoxShape.circle,
              ),
              child: Icon(icono, color: colorIcono, size: 26),
            ),

            const SizedBox(width: 16), // Separación
            // 2. Columna de Textos
            Expanded(
              // Expanded evita que los textos largos rompan la pantalla
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    texto,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorTexto,
                      height: 1.2,
                    ),
                  ),

                  // ¡La magia! Solo dibuja el subtexto si le pasaste uno
                  if (subtexto != null && subtexto!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtexto!,
                      style: TextStyle(fontSize: 14, color: colorSubtexto),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
