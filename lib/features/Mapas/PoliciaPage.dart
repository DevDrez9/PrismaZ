import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/features/Mapas/MiUbicacion.dart';

//**importar
//flutter_map: ^6.1.0 # Verifica la última versión en pub.dev
//  latlong2: ^0.9.0
//
// y crear clase MiUbicacion**/

class PoliciaPage extends StatelessWidget {
  // Aquí está tu array de objetos con las coordenadas
  final List<MiUbicacion> ubicaciones = [
    MiUbicacion(
      nombre: "Sucursal La Paz",
      latitud: -16.4990,
      longitud: -68.1333,
    ),
    MiUbicacion(
      nombre: "Sucursal Cochabamba",
      latitud: -17.3895,
      longitud: -66.1568,
    ),
    MiUbicacion(
      nombre: "Sucursal Santa Cruz",
      latitud: -17.7833,
      longitud: -63.1821,
    ),
  ];

  PoliciaPage({Key? key}) : super(key: key);

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
            icon: Icon(Icons.notifications, color: AppTheme.colorPlomo),
            onPressed: () {
              print("Notificaciones");
            },
          ),
          // Botón 2
          IconButton(
            icon: Icon(
              Icons.person_2,
              color: Theme.of(context).colorScheme.inverseSurface,
              size: 30,
            ),
            onPressed: () {
              print("Configuración");
            },
          ),
          const SizedBox(width: 8), // Pequeño espacio al final
        ],
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-16.4990, -68.1333), // Centro inicial del mapa
          initialZoom: 5.5, // Nivel de zoom inicial
        ),
        children: [
          // Capa del mapa base (OpenStreetMap)
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName:
                'com.tu_usuario.tu_app', // Recomendado cambiarlo por el package name de tu app
          ),

          // Capa de los marcadores
          MarkerLayer(
            // Aquí mapeamos tu array de objetos a una lista de Marker
            markers: ubicaciones.map((ubicacion) {
              return Marker(
                point: LatLng(ubicacion.latitud, ubicacion.longitud),
                width: 40.0,
                height: 40.0,
                child: GestureDetector(
                  onTap: () {
                    // Acción al tocar el marcador
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tocaste: ${ubicacion.nombre}')),
                    );
                  },
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.0,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
