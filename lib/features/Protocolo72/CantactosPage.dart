import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppTextStyle.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/features/Protocolo72/TarjetaLlamada.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class ContactosPage extends StatelessWidget {
  const ContactosPage({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        l10n.emergencia_titulo,

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
                        l10n.emergencia_subtitulo,
                        style: AppTextStyles.body.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TarjetaLlamada(
                      titulo: l10n.emergecia_card1,
                      subtitulo: l10n.emergencia_card1_desc,
                      numeroTelefono: "911",
                      icono: Icons.local_police_outlined,
                      colorBoton: Theme.of(context).colorScheme.error,
                      colorIcono: Theme.of(context).colorScheme.error,
                    ),
                    SizedBox(height: 10),
                    TarjetaLlamada(
                      titulo: l10n.emergencia_card2,
                      subtitulo: l10n.emergencia_card2_desc,
                      numeroTelefono: "800140348",
                      icono: Icons.local_police_outlined,
                      colorBoton: Theme.of(context).colorScheme.error,
                      colorIcono: Theme.of(context).colorScheme.error,
                    ),
                    SizedBox(height: 10),
                    TarjetaLlamada(
                      titulo: l10n.emergencia_card3,
                      subtitulo: l10n.emergencia_card3_desc,
                      numeroTelefono: "156",
                      icono: Icons.local_police_outlined,
                      colorBoton: Theme.of(context).colorScheme.error,
                      colorIcono: Theme.of(context).colorScheme.error,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
