import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppTextStyle.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/CardPrincipal.dart';
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/features/Protocolo72/CantactosPage.dart';
import 'package:salud_apps/features/Protocolo72/ProtocoloAntes.dart';
import 'package:salud_apps/features/Protocolo72/ProtocoloDespues.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class MenuProtocolo extends StatelessWidget {
  const MenuProtocolo({super.key});

  @override
  Widget build(BuildContext context) {
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        title: Text(
          l10n.home_appBarTittle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 37,
          ),
        ),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (Locale locale) {
              // ¡Así de simple! Cambias el valor de la variable global
              // y toda la app se actualiza al instante.
              appLocale.value = locale;
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              const PopupMenuItem<Locale>(
                value: Locale('es', ''),
                child: Text('Español'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('ay', ''),
                child: Text('Aymara'),
              ),
            ],
          ),

          // Botón 2
          IconButton(
            icon: Icon(
              Icons.menu_book,
              color: Theme.of(context).colorScheme.inverseSurface,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                // Quitamos el "Replacement"
                MaterialPageRoute(
                  builder: (context) =>
                      Saludeducacionpage(), // Tu nueva pantalla
                ),
              );
            },
          ),
          const SizedBox(width: 8), // Pequeño espacio al final
        ],
      ),
      body: Stack(
        children: [
          // Capa 1: La imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  esTemaOscuro
                      ? 'assets/background_dark.png' // Imagen para el modo oscuro
                      : 'assets/background.png', // Imagen para el modo claro
                ),
                fit: BoxFit.cover, // Para que cubra toda la pantalla
              ),
            ),
          ),

          // Capa 2: Tu contenido real
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.center,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    width: AppTheme.getMainWidth80(context),
                    child: Text(
                      l10n.protocol_title,

                      style: AppTextStyles.title.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: AppTheme.getMainWidth80(context),
                    child: Text(
                      l10n.protocol_subtitle,
                      style: AppTextStyles.body.copyWith(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  cardGrandeTexto(
                    l10n.procotol_car1,
                    context,
                    onTap: () => {
                      Navigator.of(context).push(
                        // Quitamos el "Replacement"
                        MaterialPageRoute(
                          builder: (context) =>
                              ProtocoloAntes(), // Tu nueva pantalla
                        ),
                      ),
                    },
                  ),
                  SizedBox(height: 20),
                  cardGrandeTexto(
                    l10n.protocol_card2,
                    context,
                    onTap: () => {
                      Navigator.of(context).push(
                        // Quitamos el "Replacement"
                        MaterialPageRoute(
                          builder: (context) =>
                              ProtocoloDespues(), // Tu nueva pantalla
                        ),
                      ),
                    },
                  ),
                  SizedBox(height: 20),

                  Cardprincipal(
                    textoCard: l10n.protocol_btnContacotsEmmergencia,
                    imagen:
                        "assets/local_police_24dp_8B4A61_FILL0_wght400_GRAD0_opsz24.svg",
                    contenedorColor: AppTheme.colorAmariilo,
                    opacityBlur: 1,
                    colorTexto: Colors.red,
                    iconColor: Colors.red,
                    onTap: () => {
                      Navigator.of(context).push(
                        // Quitamos el "Replacement"
                        MaterialPageRoute(
                          builder: (context) =>
                              ContactosPage(), // Tu nueva pantalla
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 1. Agregamos '{VoidCallback? onTap}' como parámetro opcional
Widget cardGrandeTexto(String texto, context, {VoidCallback? onTap}) {
  // 2. Envolvemos el BlurContainer en un GestureDetector
  return GestureDetector(
    onTap: onTap, // 3. Le pasamos la acción que recibimos
    // Opcional: Esto ayuda a que detecte el clic incluso si tocas una parte transparente del contenedor
    behavior: HitTestBehavior.opaque,

    child: BlurContainer(
      opacity: 0.5,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        // Aquí me imagino que va tu texto
        width: AppTheme.getMainWidth80(context),
        height: 200,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Container(
          width: AppTheme.getMainWidth60(context),
          alignment: Alignment.center,
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: AppTextStyles.textBig.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 35,
            ),
          ),
        ),
      ),
    ),
  );
}
