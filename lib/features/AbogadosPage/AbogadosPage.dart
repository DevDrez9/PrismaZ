import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/InfoCard.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/core/widgets/ProfesionalCard.dart';

class AbogadoPage extends StatefulWidget {
  const AbogadoPage({super.key});

  @override
  State<AbogadoPage> createState() => _AbogadoPageState();
}

class _AbogadoPageState extends State<AbogadoPage> {
  // Tu array original de datos (intacto)
  final List<PerfilProfesional> profesionales = [
    PerfilProfesional(
      nombre: 'Dra. Ana López',
      especialidad: 'Penal',
      imagenUrl: '...',
      calificacion: 4.8,
    ),
    PerfilProfesional(
      nombre: 'Lic. Carlos Ruiz',
      especialidad: 'Familiar',
      imagenUrl: '...',
      calificacion: 4.9,
    ),
    PerfilProfesional(
      nombre: 'Dra. María Gómez',
      especialidad: 'Infanil',
      imagenUrl: '...',
      calificacion: 4.7,
    ),
    PerfilProfesional(
      nombre: 'Dr. Juan Pérez',
      especialidad: 'Penal',
      imagenUrl: '...',
      calificacion: 4.5,
    ),
  ];

  // 1. Variable que guarda el filtro actual (Por defecto mostramos "Todas")
  String especialidadSeleccionada = 'Todas';

  // 2. Extraemos dinámicamente las especialidades para no escribirlas a mano
  List<String> get listaEspecialidades {
    // Usamos un Set para evitar especialidades duplicadas
    final especialidadesUnicas = profesionales
        .map((p) => p.especialidad)
        .toSet();
    return ['Todas', ...especialidadesUnicas];
  }

  // 3. Creamos una lista filtrada que será la que realmente mostremos en pantalla
  List<PerfilProfesional> get profesionalesFiltrados {
    if (especialidadSeleccionada == 'Todas') {
      return profesionales;
    }
    return profesionales
        .where(
          (profesional) => profesional.especialidad == especialidadSeleccionada,
        )
        .toList();
  }

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
            child: Column(
              children: [
                Center(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 350,
                    child: Text(
                      "Abogados Recomendados",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 60, // Altura del contenedor de burbujas
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    itemCount: listaEspecialidades.length,
                    itemBuilder: (context, index) {
                      final especialidad = listaEspecialidades[index];
                      final estaSeleccionada =
                          especialidad == especialidadSeleccionada;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(especialidad),
                          selected: estaSeleccionada,
                          // Estilos de la burbuja
                          selectedColor: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                          labelStyle: TextStyle(
                            color: estaSeleccionada
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: estaSeleccionada
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ), // Borde muy redondeado
                          ),
                          onSelected: (bool selected) {
                            // Al tocar, actualizamos el estado para redibujar la pantalla
                            setState(() {
                              especialidadSeleccionada = especialidad;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

                // --- SECCIÓN DE RESULTADOS (LISTA VERTICAL) ---
                Expanded(
                  child: profesionalesFiltrados.isEmpty
                      ? const Center(
                          // Mensaje por si alguna categoría se queda sin profesionales
                          child: Text(
                            'No hay profesionales en esta especialidad.',
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16.0),
                          // ¡IMPORTANTE! Usamos la lista filtrada, no la original
                          itemCount: profesionalesFiltrados.length,
                          itemBuilder: (context, index) {
                            return ProfesionalCard(
                              perfil: profesionalesFiltrados[index],
                              esGrande: true,
                              isHorizontal: false, // Es vertical
                              onTap: () {
                                print(
                                  'Ver perfil de: ${profesionalesFiltrados[index].nombre}',
                                );
                              },
                            );
                          },
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
