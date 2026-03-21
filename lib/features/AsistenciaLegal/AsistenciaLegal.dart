import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/InfoCard.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/CardCuadrado.dart';
import 'package:salud_apps/core/widgets/CardRectangulo.dart';
import 'package:salud_apps/core/widgets/CardTexto.dart';
import 'package:salud_apps/core/widgets/DropBox.dart';
import 'package:salud_apps/core/widgets/ProfesionalCard.dart';
import 'package:salud_apps/features/AbogadosPage/AbogadosPage.dart';
import 'package:salud_apps/features/AyudaPage/AyudaPage.dart';

class AsistenciaLegalPage extends StatelessWidget {
  AsistenciaLegalPage({super.key});

  // 1. Tu array de objetos
  final List<PerfilProfesional> profesionales = [
    PerfilProfesional(
      nombre: 'Dra. Ana López',
      especialidad: 'Cardiología',
      imagenUrl: 'https://i.pravatar.cc/150?img=1', // Imagen de prueba
      calificacion: 4.8,
    ),
    PerfilProfesional(
      nombre: 'Lic. Carlos Ruiz',
      especialidad: 'Fisioterapia',
      imagenUrl: 'https://i.pravatar.cc/150?img=11',
      calificacion: 4.9,
    ),
    PerfilProfesional(
      nombre: 'Dra. María Gómez',
      especialidad: 'Pediatría',
      imagenUrl: 'https://i.pravatar.cc/150?img=5',
      calificacion: 4.7,
    ),
  ];

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
              children: [
                Center(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 300,
                    child: Text(
                      "Tu Guia de accion legal",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 300,
                    child: Text(
                      "Si ha ocurrido algun accidente a tus derechos a integridad fisica fueron dalados o vildenaros exolora los botones de acuerdo a tu necesidad.\nRecuerda primero buscar un lugar seguro.",
                      textAlign: TextAlign.justify,

                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardCuadrado(
                      textoCard: "Ayuda",
                      imagen: "assets/heart_check.svg",
                      iconColor: Colors.red,
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
                    SizedBox(width: 10),
                    CardCuadrado(
                      textoCard: "Crear una denuncia",
                      imagen: "assets/docs.svg",
                      iconColor: Colors.red,
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 45, right: 45),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contactos Legales",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.labelLargeBold
                                ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                          ),
                          InkWell(
                            onTap: () => {
                              Navigator.of(context).push(
                                // Quitamos el "Replacement"
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AbogadoPage(), // Tu nueva pantalla
                                ),
                              ),
                            },
                            child: Container(
                              width: 100,
                              height: 25,

                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Ver todo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100, // Altura fija del card
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: profesionales.length,
                          itemBuilder: (context, index) {
                            return ProfesionalCard(
                              perfil: profesionales[index],
                              isHorizontal: true,
                              esGrande:
                                  false, // Cambia esto a false para ver la versión del 35%
                              onTap: () {
                                // Aquí pones la navegación, por ejemplo:
                                print(
                                  'Navegando al perfil de ${profesionales[index].nombre}',
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 45, right: 45),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "¿No puedes hablar?",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelLargeBold
                            ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                      ),
                      SizedBox(height: 20),
                      CardTexto(textoCard: "HABLA POR MI", color: Colors.red),
                    ],
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
