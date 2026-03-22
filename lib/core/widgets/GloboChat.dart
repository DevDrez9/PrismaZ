import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

// -------------------------------------------------------------------
// 1. EL CLIPPER CORREGIDO (Ahora dibuja todo dentro de los límites)
// -------------------------------------------------------------------
class GloboTextoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 15.0; // Radio de las esquinas redondeadas
    double tailWidth = 20.0; // Ancho de la base de la cola
    double tailHeight = 20.0; // Altura de la cola

    // Calculamos dónde termina el globo principal (dejando espacio para la cola abajo)
    double bubbleBottom = size.height - tailHeight;

    // --- Dibujamos el cuerpo rectangular redondeado ---
    path.moveTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));

    // Top line
    path.lineTo(size.width - radius, 0);
    // Top-right corner
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
    );

    // Right line
    path.lineTo(size.width, bubbleBottom - radius);
    // Bottom-right corner (Notar que usamos bubbleBottom en vez de size.height)
    path.arcToPoint(
      Offset(size.width - radius, bubbleBottom),
      radius: Radius.circular(radius),
    );

    // --- Definimos la cola ---
    // Bottom line, moving towards the left corner
    path.lineTo(radius + tailWidth, bubbleBottom);

    // Dibujamos el pico (¡Ahora no nos salimos de size.height!)
    path.lineTo(radius, size.height); // Punta de la cola
    path.lineTo(radius, bubbleBottom); // Regresamos a la base del globo

    // Finalizamos el cuerpo
    path.lineTo(0, bubbleBottom); // Esquina inferior izquierda
    path.lineTo(0, radius); // Subimos por el borde izquierdo

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// -------------------------------------------------------------------
// 2. EL WIDGET REUTILIZABLE
// -------------------------------------------------------------------
class GloboTextoWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback? onTap; // 1. Agregamos la propiedad opcional

  const GloboTextoWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.onTap, // 2. La inicializamos en el constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // 3. Envolvemos el ClipPath con el GestureDetector
      child: GestureDetector(
        onTap: onTap, // Si es null, simplemente ignora los toques
        child: ClipPath(
          clipper:
              GloboTextoClipper(), // Asume que el clipper está definido arriba
          child: BlurContainer(
            opacity: 0.5,
            color: AppTheme.colorVerde,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                left: 20,
                top: 18,
                right: 20,
                bottom: 40, // El espacio para la cola
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
