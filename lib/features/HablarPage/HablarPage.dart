import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/CardRectangulo.dart';
import 'package:salud_apps/core/widgets/CardTexto.dart';
import 'package:salud_apps/core/widgets/CustomTextArea.dart';
import 'package:salud_apps/core/widgets/CustomToggleSwitch.dart';
import 'package:salud_apps/core/widgets/GloboChat.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';

class HablarPage extends StatefulWidget {
  const HablarPage({super.key});

  @override
  State<HablarPage> createState() => _HablarPageState();
}

class _HablarPageState extends State<HablarPage> {
  final TextEditingController miControladorTexto = TextEditingController();
  bool usarPresets = true;

  // 2. Instanciamos el motor de voz
  final FlutterTts flutterTts = FlutterTts();

  // 3. Creamos la función mágica que hará hablar a tu app
  Future<void> _hablarTexto(String texto) async {
    await flutterTts.setLanguage("es-ES"); // Configura el idioma
    await flutterTts.setSpeechRate(0.5); // Velocidad (0.5 es normal)
    await flutterTts.setVolume(1.0); // Volumen máximo
    await flutterTts.setPitch(1.0); // Tono normal

    await flutterTts.speak(texto); // ¡Da la orden de hablar!
  }

  @override
  void dispose() {
    flutterTts
        .stop(); // 4. MUY IMPORTANTE: Apaga la voz si sales de la pantalla
    super.dispose();
  }

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
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      width: 300,
                      child: Text(
                        "Habla por mi",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.inverseSurface,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),

                    SizedBox(height: 50),
                    Center(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: 300,
                        child: Text(
                          "Aveces no podemos hablar debido a lo que sucede a nuestro al rededor.\nLa app tiene una funcion que te protege",
                          textAlign: TextAlign.justify,

                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ), // Margen a los lados
                      child: CustomToggleSwitch(
                        textoIzquierda: "Presets",
                        textoDerecha: "Escribe tu",
                        onChanged: (bool valorSeleccionado) {
                          setState(() {
                            usarPresets =
                                valorSeleccionado; // Actualizamos tu variable
                          });

                          // Aquí puedes imprimir para verificar que funciona
                          if (usarPresets) {
                            print("El usuario quiere usar Presets");
                          } else {
                            print("El usuario quiere Escribir");
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 25),

                    usarPresets
                        ? Column(
                            children: [
                              GloboTextoWidget(
                                text: "Necesito encontrar una farmacia",
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                onTap: () => {
                                  _hablarTexto(
                                    "Necesito encontrar una farmacia",
                                  ),
                                },
                              ),
                              GloboTextoWidget(
                                text: "Necesito encontrar una farmacia",
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                onTap: () => {
                                  _hablarTexto(
                                    "Necesito encontrar una farmacia",
                                  ),
                                },
                              ),
                              GloboTextoWidget(
                                text: "Necesito encontrar una farmacia",
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                onTap: () => {
                                  _hablarTexto(
                                    "Necesito encontrar una farmacia",
                                  ),
                                },
                              ),
                              GloboTextoWidget(
                                text: "Necesito encontrar una farmacia",
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.inverseSurface,
                                onTap: () => {
                                  _hablarTexto(
                                    "Necesito encontrar una farmacia",
                                  ),
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              CustomTextArea(controller: miControladorTexto),
                              SizedBox(height: 20),
                              CardTexto(
                                textoCard: "HABLA POR MI",
                                color: AppTheme.colorVerde,
                                onTap: () => {
                                  _hablarTexto(miControladorTexto.text),
                                },
                              ),
                            ],
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
