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
import 'package:salud_apps/core/widgets/CardRectanguloV.dart';
import 'package:salud_apps/core/widgets/CardTexto.dart';
import 'package:salud_apps/features/AsistenciaLegal/AsistenciaLegal.dart';
import 'package:salud_apps/features/AyudaPage/AyudaPage.dart';
import 'package:salud_apps/features/BienvenidaPage/BienvenidaPage.dart';
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/features/Protocolo72/MenuProtocolo.dart';
import 'package:salud_apps/features/SaludEducacion/MenuDerechos.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();

    // ¡EL TRUCO MÁGICO!
    // Esto le dice a Flutter: "Espera a que termine de construir la pantalla (build)
    // y justo un milisegundo después, ¡PUM!, lanza el modal."
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostrarModalAutomatico();
    });
  }

  void mostrarModalAutomatico() {
    showDialog(
      context: context,
      // barrierDismissible en 'false' obliga al usuario a tocar una de las opciones
      // y no le permite cerrar el modal tocando fuera de él.
      // Cámbialo a 'true' si quieres que se cierre al tocar el fondo oscuro.
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const ModalBienvenida();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;

    Future<void> abrirWhatsApp() async {
      final String urlString =
          "https://api.whatsapp.com/send/?phone=59176789702&text=Hola+Dra.+Violeta&type=phone_number&app_absent=0";
      final Uri url = Uri.parse(urlString);

      try {
        // Lanzamos la URL directamente sin usar canLaunchUrl
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        // Si falla, lo imprimimos en consola en lugar de romper la app
        debugPrint('No se pudo abrir el enlace: $e');
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
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
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 10.0, // Espacio horizontal entre los hijos
                      runSpacing: 16.0, // Espacio vertical entre las líneas
                      alignment:
                          WrapAlignment.start, // Alineación de los elementos
                      children: [
                        BotonGrandePrincipal(
                          textoCard: l10n.home_asistencia,
                          subText: l10n.home_asistencia_sub1,
                          imagen: l10n.home_asistencia_sub2,

                          iconColor: Theme.of(
                            context,
                          ).colorScheme.inverseSurface,
                          svgHeight: 100,
                          onTap: () => {
                            Navigator.of(context).push(
                              // Quitamos el "Replacement"
                              MaterialPageRoute(
                                builder: (context) =>
                                    Menuderechos(), // Tu nueva pantalla
                              ),
                            ),
                          },
                        ),

                        CardRectanguloV(
                          textoCard: l10n.home_chatBot,
                          imagen: "assets/draVioleta.png",
                          iconColor: Theme.of(context).colorScheme.primary,
                          onTap: () => {abrirWhatsApp()},
                        ),
                        CardRectanguloV(
                          textoCard: l10n.home_aprender,
                          imagen:
                              "assets/book_2_24dp_8B4A61_FILL0_wght400_GRAD0_opsz24.svg",
                          iconColor: Theme.of(context).colorScheme.primary,
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
                        CardRectanguloV(
                          textoCard: l10n.home_comunidad,
                          imagen: "assets/conversation.svg",
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),

                  Cardprincipal(
                    textoCard: l10n.home_policia,
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
                              PoliciaPage(), // Tu nueva pantalla
                        ),
                      ),
                    },
                  ),
                  SizedBox(height: 10),
                  Cardprincipal(
                    textoCard: l10n.home_quieroCalma,
                    imagen:
                        "assets/stress_management_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg",
                    isImageRight: true,
                    contenedorColor: AppTheme.colorVerde,
                    colorTexto: Colors.white,

                    opacityBlur: 0.95,
                    onTap: () => {
                      Navigator.of(context).push(
                        // Quitamos el "Replacement"
                        MaterialPageRoute(
                          builder: (context) =>
                              AyudaPage(), // Tu nueva pantalla
                        ),
                      ),
                    },
                  ),
                  SizedBox(height: 10),
                  Cardprincipal(
                    textoCard: l10n.home_btProtocolo,
                    subTexto: "(En casos de violencia sexual)",

                    isImageRight: true,
                    contenedorColor: Theme.of(context).colorScheme.error,
                    colorTexto: Theme.of(context).colorScheme.onError,

                    opacityBlur: 0.95,
                    onTap: () => {
                      Navigator.of(context).push(
                        // Quitamos el "Replacement"
                        MaterialPageRoute(
                          builder: (context) =>
                              MenuProtocolo(), // Tu nueva pantalla
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
