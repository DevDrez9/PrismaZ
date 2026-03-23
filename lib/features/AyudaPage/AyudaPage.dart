import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/BreathingExerciseWidget.dart';
import 'package:salud_apps/core/widgets/IconoCLetras.dart';
import 'package:salud_apps/features/HablarPage/HablarPage.dart';
import 'package:salud_apps/features/Protocolo72/MenuProtocolo.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

// 1. CAMBIAMOS A STATEFUL WIDGET PARA PODER OCULTAR EL BOTÓN
class AyudaPage extends StatefulWidget {
  const AyudaPage({super.key});

  @override
  State<AyudaPage> createState() => _AyudaPageState();
}

class _AyudaPageState extends State<AyudaPage> {
  // 2. CREAMOS LA VARIABLE QUE CONTROLA SI SE MUESTRA EL BOTÓN INFERIOR
  bool _mostrarBotonInferior = true;

  @override
  Widget build(BuildContext context) {
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          l10n.home_appBarTittle,
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
          IconButton(
            icon: Icon(
              Icons.menu_book,
              color: Theme.of(context).colorScheme.inverseSurface,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Saludeducacionpage()),
              );
            },
          ),
          const SizedBox(width: 8),
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
                      ? 'assets/background_dark.png'
                      : 'assets/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa 2: Tu contenido real (Scroll)
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                // Agregamos un padding abajo para que el contenido no quede tapado por el botón flotante largo
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppTheme.getMainWidth60(context),
                          child: Text(
                            l10n.safe_calm_title,
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
                        l10n.safe_calm_subtitle,
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
                              l10n.safe_calm_steps_title,
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
                                    texto: l10n.safe_calm_step1,
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
                                    texto: l10n.safe_calm_step2,
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
                                    texto: l10n.safe_calm_step3,
                                    svgPath: "assets/chat.svg",
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                    iconColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  IconoCLetras(
                                    texto: l10n.safe_calm_step4,
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

          // Capa 3: Tu botón del micrófono arriba a la derecha
          Positioned(
            top: 100.0,
            right: 25.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => HablarPage())),
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
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

          // -------------------------------------------------------------
          // Capa 4: ¡NUEVO BOTÓN FLOTANTE LARGO EN LA PARTE INFERIOR!
          // -------------------------------------------------------------
          // -------------------------------------------------------------
          // Capa 4: ¡NUEVO BANNER ROJO DE URGENCIA!
          // -------------------------------------------------------------
          if (_mostrarBotonInferior)
            Positioned(
              bottom: 30.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFCA383D), // El rojo exacto de tu diseño
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Texto principal
                    const Expanded(
                      child: Text(
                        "¿Acabas de sufrir\nviolencia sexual?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900, // Extra bold
                          height: 1.1, // Interlineado un poco más junto
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // --- BOTÓN "SI" ---
                    Material(
                      color: const Color(
                        0xFFFFDDE0,
                      ), // Rosado pastel de los botones
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          // Aquí pones la acción para cuando dice que SÍ
                          // Ej: Navigator.push(...)
                          print("El usuario presionó SI");
                          Navigator.of(context).push(
                            // Quitamos el "Replacement"
                            MaterialPageRoute(
                              builder: (context) =>
                                  MenuProtocolo(), // Tu nueva pantalla
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          child: const Text(
                            "SI",
                            style: TextStyle(
                              color: Color(0xFF2B2B2B), // Texto oscuro
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8), // Separación entre botones
                    // --- BOTÓN "NO" ---
                    Material(
                      color: const Color(0xFFFFDDE0), // Rosado pastel
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          // Al usar setState, se oculta todo este bloque
                          setState(() {
                            _mostrarBotonInferior = false;
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 14,
                          ),
                          child: const Text(
                            "NO",
                            style: TextStyle(
                              color: Color(0xFF2B2B2B),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
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
