import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/BreathingExerciseWidget.dart';

class AyudaPage extends StatelessWidget {
  const AyudaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ), // Estilo iOS moderno
          onPressed: () {
            Navigator.of(context).pop(); // Acción para volver atrás
          },
        ),

        actions: [
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Respira profundo, hazlo con calma",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  BreathingExerciseWidget(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
