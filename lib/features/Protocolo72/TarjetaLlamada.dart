import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:url_launcher/url_launcher.dart';

class TarjetaLlamada extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String numeroTelefono;
  final IconData
  icono; // Usamos IconData, pero puedes cambiarlo a un SVG si prefieres
  final Color colorIcono;
  final Color colorBoton;

  const TarjetaLlamada({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.numeroTelefono,
    required this.icono,
    this.colorIcono = const Color(0xFF8E5B6A), // Color granate por defecto
    this.colorBoton = const Color(0xFFC63437), // Rojo del botón por defecto
  });

  // Función mágica para abrir la app de teléfono
  Future<void> _llamarNumero(BuildContext context) async {
    final Uri launchUri = Uri(scheme: 'tel', path: numeroTelefono);

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      // Si por alguna razón no puede llamar (ej. un emulador sin app de teléfono)
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No se pudo iniciar la llamada al $numeroTelefono"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      opacity: 0.5,
      color: Theme.of(context).colorScheme.surfaceDim,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. ICONO A LA IZQUIERDA
            Icon(icono, size: 55, color: colorIcono),
            const SizedBox(width: 16),

            // 2. COLUMNA DE TEXTOS Y BOTÓN A LA DERECHA
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF35314B), // Azul oscuro tipo imagen
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Botón de Llamar
                  SizedBox(
                    width: double
                        .infinity, // Para que el botón ocupe todo el ancho disponible
                    child: ElevatedButton(
                      onPressed: () => _llamarNumero(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorBoton,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        "Llamar",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
