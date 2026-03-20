import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/CardIcono.dart';
import 'package:salud_apps/core/widgets/CardPrincipal.dart';
import 'package:salud_apps/core/widgets/CardTexto.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        title: Text(
          "Prisma Z",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 37,
          ),
        ),
        actions: [
          // Botón 1
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
            onPressed: () {
              print("Notificaciones");
            },
          ),
          // Botón 2
          IconButton(
            icon: Icon(
              Icons.person_2,
              color: Theme.of(context).colorScheme.primary,
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
                Center(
                  child: CardTexto(textoCard: "¡Hola! Aqui te acompañamos"),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 12.0, // Espacio horizontal entre los hijos
                    runSpacing: 16.0, // Espacio vertical entre las líneas
                    alignment:
                        WrapAlignment.start, // Alineación de los elementos
                    children: [
                      Cardprincipal(
                        textoCard: "Salud y Educacion",
                        imagen: "assets/heart_check.svg",
                        iconColor: Colors.red,
                        svgHeight: 100,
                      ),
                      Cardprincipal(
                        textoCard: "Mis derechos",
                        imagen: "assets/gavel.svg",
                        iconColor: Colors.brown,
                        svgHeight: 100,
                      ),
                      Cardprincipal(
                        textoCard: "Chat Bot",
                        imagen: "assets/chat.svg",
                        iconColor: Color(0xff2c8f93),
                        svgHeight: 100,
                      ),
                      Cardprincipal(
                        textoCard: "Comunidad",
                        imagen: "assets/conversation.svg",
                        iconColor: Colors.green,
                        svgHeight: 100,
                      ),
                    ],
                  ),
                ),

                Center(
                  child: CardIconoTexto(
                    texto:
                        "Presioname para ver las farmacias mas cercanas de ti ",
                    svgPath: "assets/foco.svg",
                    iconSize: 32, // Icono más grande
                    iconColor: Colors.green, // Icono rojo
                    backgroundColor: Color(0xffa5d6a7), // Fondo rojizo
                    backgroundOpacity: 0.7, // Muy sutil
                    textColor: Colors.green,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: CardIconoTexto(
                    texto: "Termporizador de seguridad",
                    svgPath: "assets/hourglass.svg",
                    iconPosition: IconPosition.right,
                    iconSize: 32, // Icono más grande
                    iconColor: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer, // Icono rojo
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.tertiary, // Fondo rojizo
                    backgroundOpacity: 0.7, // Muy sutil
                    textColor: Theme.of(context).colorScheme.tertiaryContainer,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
