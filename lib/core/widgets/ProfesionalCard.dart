import 'package:flutter/material.dart';
import 'package:salud_apps/core/constants/InfoCard.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class ProfesionalCard extends StatelessWidget {
  final PerfilProfesional perfil;
  final bool esGrande;
  final bool isHorizontal;
  final VoidCallback? onTap;

  const ProfesionalCard({
    super.key,
    required this.perfil,
    this.esGrande = true,
    this.isHorizontal = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final anchoPantalla = MediaQuery.of(context).size.width;
    final anchoCalculado = isHorizontal
        ? (esGrande ? anchoPantalla * 0.80 : anchoPantalla * 0.6)
        : null;

    // 1. Envolvemos TODO en un Padding para dar el margen exterior real
    return Padding(
      padding: EdgeInsets.only(
        right: isHorizontal ? 16.0 : 0.0,
        bottom: isHorizontal ? 0.0 : 16.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: BlurContainer(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Container(
            width: anchoCalculado,
            height: 100,

            // 2. ¡ELIMINAMOS el margin de aquí adentro!
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Imagen del perfil
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    perfil.imagenUrl,
                    width: 90,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: esGrande ? 90 : 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                  ),
                ),

                // Textos y Calificación
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          perfil.nombre,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: esGrande ? 16 : 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          perfil.especialidad,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: esGrande ? 13 : 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              perfil.calificacion.toString(),
                              style: TextStyle(
                                fontSize: esGrande ? 14 : 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
