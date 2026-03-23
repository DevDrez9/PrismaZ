import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';

import 'package:flutter/material.dart';
// Asegúrate de importar tu AppTheme, BlurContainer y tu función cardBienvenida
import 'package:flutter/material.dart';
import 'package:salud_apps/features/AyudaPage/AyudaPage.dart';
import 'package:salud_apps/features/Protocolo72/MenuProtocolo.dart';
import 'package:salud_apps/l10n/app_localizations.dart';
// Asegúrate de tener tus importaciones de AppTheme, BlurContainer y cardBienvenida

class ModalBienvenida extends StatelessWidget {
  const ModalBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.all(20),
      child: BlurContainer(
        opacity: 0.5,
        color: Theme.of(context).colorScheme.primary,
        child: SizedBox(
          width: AppTheme.getMainWidth(context),
          height: AppTheme.getMainHeight80(context),
          // 1. ¡LA MAGIA DEL STACK! Nos permite poner elementos uno encima de otro
          child: Stack(
            children: [
              // Capa 1: Tu contenido original, perfectamente centrado
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        l10n.modaa_title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                              wordSpacing: 12,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(
                          // Quitamos el "Replacement"
                          MaterialPageRoute(
                            builder: (context) =>
                                AyudaPage(), // Tu nueva pantalla
                          ),
                        ),
                      },
                      child: cardBienvenida(
                        context,
                        "Quiero calmarme",
                        "(Contencion emocional)",
                        Colors.white,
                        Colors.white,
                        Colors.purple,
                        "assets/heart_check.svg",
                        70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(
                          // Quitamos el "Replacement"
                          MaterialPageRoute(
                            builder: (context) =>
                                MenuProtocolo(), // Tu nueva pantalla
                          ),
                        ),
                      },
                      child: cardBienvenida(
                        context,
                        "Fui victima de violencia Sexual",
                        "(Guia 72 horas)",
                        Colors.white,
                        Colors.white,
                        Colors.red,
                        "assets/chat.svg",
                        70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => {Navigator.of(context).pop()},
                      child: cardBienvenida(
                        context,
                        "Explorar app",
                        "(Asistencia legal)",
                        Colors.black,
                        Colors.black,
                        Colors.white,
                        "assets/chat.svg",
                        70,
                      ),
                    ),
                  ],
                ),
              ),

              // Capa 2: El botón 'X' anclado en la esquina superior derecha
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors
                        .white, // Color blanco para que resalte en tu fondo primario
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Esto cierra el modal
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardBienvenida(
  context,
  texto,
  subTexto,
  Color colorText,
  Color colorIcono,
  Color colorFondo,
  String imagen,
  double svgHeight,
) {
  return BlurContainer(
    opacity: 0.5,
    color: colorFondo,

    child: Container(
      width: AppTheme.getMainWidth80(context),
      height: 120,
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(width: 10),
          SizedBox(
            height: svgHeight,
            child: SvgPicture.asset(
              imagen!,
              fit: BoxFit.contain,
              colorFilter: colorIcono != null
                  ? ColorFilter.mode(colorIcono!, BlendMode.srcIn)
                  : null,
            ),
          ),
          SizedBox(width: 10),

          Container(
            width: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  texto,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorText,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                Text(
                  subTexto,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorText,
                    fontWeight: FontWeight.w100,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    ),
  );
}
