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
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/features/SaludEducacion/MenuDerechos.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(child: CardTexto(textoCard: "Bienvenido")),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 10.0, // Espacio horizontal entre los hijos
                    runSpacing: 16.0, // Espacio vertical entre las líneas
                    alignment:
                        WrapAlignment.start, // Alineación de los elementos
                    children: [
                      BotonGrandePrincipal(
                        textoCard: "Asistencia Legal ",
                        subText: "Violencia sexual,ILE",
                        imagen: "assets/gavel.svg",
                        iconColor: Theme.of(context).colorScheme.inverseSurface,
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
                        textoCard: "Chat Bot",
                        imagen: "assets/chat.svg",
                        iconColor: Theme.of(context).colorScheme.primary,
                        onTap: () => {abrirWhatsApp()},
                      ),
                      CardRectanguloV(
                        textoCard: "Aprender",
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
                        textoCard: "Comunidad",
                        imagen: "assets/conversation.svg",
                        iconColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),

                Cardprincipal(
                  textoCard: "Estacion de policia mas cercana",
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
                SizedBox(height: 25),
                Cardprincipal(
                  textoCard: "Quiero Calmarme",
                  imagen:
                      "assets/stress_management_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg",
                  isImageRight: true,
                  contenedorColor: AppTheme.colorVerde,

                  opacityBlur: 0.95,
                  onTap: () => {
                    Navigator.of(context).push(
                      // Quitamos el "Replacement"
                      MaterialPageRoute(
                        builder: (context) => AyudaPage(), // Tu nueva pantalla
                      ),
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
