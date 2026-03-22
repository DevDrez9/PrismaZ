import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';

class BotonGrandePrincipal extends StatelessWidget {
  final String? textoCard;
  final String? subText;
  final String imagen;
  final double? svgHeight;
  final Color? iconColor;
  final VoidCallback? onTap;

  const BotonGrandePrincipal({
    super.key,
    required this.textoCard,
    required this.imagen,
    this.subText = "",
    this.svgHeight = 100.0,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Validación correcta: Solo creamos la lista si subText tiene contenido real
    final List<String> misTextos =
        (subText != null && subText!.trim().isNotEmpty)
        ? subText!.split(",")
        : [];

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
            width: AppTheme.getMainWidth80(context),
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- SVG ---
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

                // --- CONTENIDO A LA DERECHA ---
                // 2. Expanded aquí evita que los textos se salgan de la pantalla a lo ancho
                Expanded(
                  child: Column(
                    // Esto centra el título verticalmente si es el único elemento en la columna
                    mainAxisAlignment: MainAxisAlignment.center,

                    // Si hay lista, se alinea a la izquierda. Si está solo, lo centramos.
                    crossAxisAlignment: misTextos.isEmpty
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.center,
                    children: [
                      // Título principal
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          textoCard ?? "",
                          textAlign: misTextos.isEmpty
                              ? TextAlign.left
                              : TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                        ),
                      ),

                      // 3. Mostrar la lista SOLAMENTE si hay elementos
                      if (misTextos.isNotEmpty) ...[
                        const SizedBox(height: 10),

                        // 4. Expanded aquí le da a la lista un límite de altura, evitando que se rompa
                        Expanded(
                          child: ListView.builder(
                            itemCount: misTextos.length,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Text(
                                  "\u2022  " + misTextos[index],
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
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
