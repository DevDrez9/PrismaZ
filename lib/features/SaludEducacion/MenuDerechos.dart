import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/BotonGrandePrincipal.dart';
import 'package:salud_apps/core/widgets/CardPrincipal.dart';
import 'package:salud_apps/core/widgets/TituloWidget.dart';
import 'package:salud_apps/features/CrearDenunciaPage/CrearDenunciaPage.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';

class Menuderechos extends StatelessWidget {
  const Menuderechos({super.key});

  @override
  Widget build(BuildContext context) {
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        title: Text(
          "Yanapiri",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.inverseSurface,
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
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    BotonGrandePrincipal(
                      textoCard: "Violencia Sexual",

                      imagen: "assets/undraw_blooming_g9e9.svg",
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CrearDenunciaPage(idPreseleccionado: 1),
                          ),
                        ),
                      },
                    ),
                    BotonGrandePrincipal(
                      textoCard: "I.L.E",
                      imagen: "assets/undraw_expecting_j6le.svg",
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CrearDenunciaPage(idPreseleccionado: 2),
                          ),
                        ),
                      },
                    ),
                    BotonGrandePrincipal(
                      textoCard: "Discriminacion en salud",
                      imagen: "assets/undraw_injured_0ynx.svg",
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const CrearDenunciaPage(idPreseleccionado: 3),
                          ),
                        ),
                      },
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
