import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/BotonGrandePrincipal.dart';
import 'package:salud_apps/core/widgets/CardRectangulo.dart';
import 'package:salud_apps/core/widgets/CardIcono.dart';
import 'package:salud_apps/core/widgets/CardPrincipal.dart';
import 'package:salud_apps/core/widgets/CardTexto.dart';
import 'package:salud_apps/features/AsistenciaLegal/AsistenciaLegal.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        title: Text(
          l10n.home_appBarTitle,
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

          // Botón 1
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            onPressed: () {
              print("Notificaciones");
            },
          ),
          // Botón 2
          IconButton(
            icon: Icon(
              Icons.person_2,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: 30,
            ),
            onPressed: () {
              print("Configuración");
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
                image: AssetImage('assets/background.png'), // O NetworkImage
                fit: BoxFit.cover, // Para que cubra toda la pantalla
              ),
            ),
          ),
          // Capa 2: Tu contenido real
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: CardTexto(textoCard: l10n.home_welcomeMessage)),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 12.0, // Espacio horizontal entre los hijos
                    runSpacing: 16.0, // Espacio vertical entre las líneas
                    alignment:
                        WrapAlignment.start, // Alineación de los elementos
                    children: [
                      BotonGrandePrincipal(
                        textoCard: "Asistencia Legal",
                        imagen: "assets/gavel.svg",
                        svgHeight: 100,
                        onTap: () => {
                          Navigator.of(context).push(
                            // Quitamos el "Replacement"
                            MaterialPageRoute(
                              builder: (context) =>
                                  AsistenciaLegalPage(), // Tu nueva pantalla
                            ),
                          ),
                        },
                      ),
                      Cardprincipal(
                        textoCard: l10n.home_cardMisDerechos,
                        imagen: "assets/heart_check.svg",
                        iconColor: Colors.red,
                        svgHeight: 80,
                        onTap: () => {
                          Navigator.of(context).push(
                            // Quitamos el "Replacement"
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Saludeducacionpage(), // Tu nueva pantalla
                            ),
                          ),
                        },
                      ),

                      Cardprincipal(
                        textoCard: l10n.home_cardChatBot,
                        imagen: "assets/chat.svg",
                        iconColor: Colors.brown,
                        svgHeight: 80,
                      ),

                      Cardprincipal(
                        textoCard: l10n.home_cardComunidad,
                        imagen: "assets/chat.svg",
                        iconColor: Color(0xff2c8f93),
                        svgHeight: 80,
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardRectangulo(
                      textoCard: l10n.home_btnPolicia,
                      imagen: "assets/chat.svg",
                      svgHeight: 50,
                    ),
                    SizedBox(width: 10),
                    CardRectangulo(
                      textoCard: l10n.home_btnTimer,
                      imagen: "assets/chat.svg",
                      svgHeight: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
