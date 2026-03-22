import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/BreathingExerciseWidget.dart';
import 'package:salud_apps/core/widgets/IconoCLetras.dart';
import 'package:salud_apps/features/HablarPage/HablarPage.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';

class AyudaPage extends StatelessWidget {
  const AyudaPage({super.key});

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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppTheme.getMainWidth60(context),
                          child: Text(
                            "Manten la calma, te acompaño",
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Respira profundo, hazlo con calma",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                    ),
                    SizedBox(height: 25),
                    BreathingExerciseWidget(),
                    SizedBox(height: 25),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Paso a paso para calmarte",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          BlurContainer(
                            blur: 10,
                            opacity: 0.5,
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainer,

                            child: Container(
                              width: double.infinity,

                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  IconoCLetras(
                                    texto: "Toma asiento y relaja los hombros",
                                    svgPath:
                                        "assets/event_seat_24dp_8B4A61_FILL0_wght400_GRAD0_opsz24.svg",
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  IconoCLetras(
                                    texto: "Bebe un poco de agua lentamente",
                                    svgPath:
                                        "assets/water_drop_24dp_8B4A61_FILL0_wght400_GRAD0_opsz24.svg",
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  IconoCLetras(
                                    texto:
                                        "Respira y habla con una voz tranquila",
                                    svgPath: "assets/chat.svg",
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  IconoCLetras(
                                    texto:
                                        "Estira suavemente tus manos y el cuello",
                                    svgPath:
                                        "assets/accessibility_new_24dp_8B4A61_FILL0_wght400_GRAD0_opsz24.svg",
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            right: 25.0,
            child: Material(
              color: Colors
                  .transparent, // Necesario para que el efecto de onda (ripple) funcione bien
              child: InkWell(
                onTap: () => {
                  Navigator.of(context).push(
                    // Quitamos el "Replacement"
                    MaterialPageRoute(
                      builder: (context) => HablarPage(), // Tu nueva pantalla
                    ),
                  ),
                },
                borderRadius: BorderRadius.circular(
                  15,
                ), // Mismo radio que el contenedor para la onda
                child: Container(
                  // ¡AQUÍ ESTÁ TU CONTROL TOTAL DE TAMAÑO!
                  width: 80, // Puedes hacerlo rectangular
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                      100,
                    ), // Bordes redondeados
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  // Puedes poner una fila con un ícono y texto
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mic, color: Colors.white),
                      SizedBox(width: 3),
                      Text(
                        'Ayuda',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
