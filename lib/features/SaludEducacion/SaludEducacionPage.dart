import 'package:flutter/material.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';

import 'package:salud_apps/core/widgets/DropBox.dart';
import 'package:salud_apps/features/SaludEducacion/DerechoInfo.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class Saludeducacionpage extends StatefulWidget {
  const Saludeducacionpage({super.key});

  @override
  State<Saludeducacionpage> createState() => _SaludeducacionpageState();
}

class _SaludeducacionpageState extends State<Saludeducacionpage> {
  DerechoInfo? derechoSeleccionado;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // 1. Armamos la lista vinculando los títulos con sus contenidos desde l10n
    final List<DerechoInfo> listaDerechos = [
      DerechoInfo(titulo: l10n.der_sex_1, contenido: l10n.der_sex_1_content),
      DerechoInfo(titulo: l10n.der_sex_2, contenido: l10n.der_sex_2_content),
      DerechoInfo(titulo: l10n.der_sex_3, contenido: l10n.der_sex_3_content),
      DerechoInfo(titulo: l10n.der_sex_4, contenido: l10n.der_sex_4_content),
      DerechoInfo(titulo: l10n.der_sex_5, contenido: l10n.der_sex_5_content),
      DerechoInfo(titulo: l10n.der_sex_6, contenido: l10n.der_sex_6_content),
      DerechoInfo(titulo: l10n.der_sex_7, contenido: l10n.der_sex_7_content),
      DerechoInfo(titulo: l10n.der_sex_8, contenido: l10n.der_sex_8_content),
      DerechoInfo(titulo: l10n.der_sex_9, contenido: l10n.der_sex_9_content),
      DerechoInfo(titulo: l10n.der_sex_10, contenido: l10n.der_sex_10_content),
      DerechoInfo(titulo: l10n.der_sex_11, contenido: l10n.der_sex_11_content),
      // ... agrega aquí todos los demás hasta el der_rep_7 ...
      DerechoInfo(titulo: l10n.der_rep_7, contenido: l10n.der_rep_7_content),
    ];
    final List<String> opcionesDropdown = listaDerechos
        .map((d) => d.titulo)
        .toList();

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
              children: [
                Center(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 300,
                    child: Text(
                      "Tu Guia en educacion Sexual",
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
                CustomDropdown(
                  opciones: opcionesDropdown, // Le pasamos la lista de títulos
                  hint: "¿Qué quieres explorar hoy?",
                  onChanged: (valorSeleccionado) {
                    // Cuando el usuario elige un título, buscamos el objeto completo
                    setState(() {
                      derechoSeleccionado = listaDerechos.firstWhere(
                        (derecho) => derecho.titulo == valorSeleccionado,
                      );
                    });
                  },
                ),
                const SizedBox(height: 32),
                if (derechoSeleccionado != null)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          derechoSeleccionado!.titulo, // Título seleccionado
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          derechoSeleccionado!
                              .contenido, // Contenido de ese título
                          style: const TextStyle(
                            fontSize: 16,
                            height:
                                1.5, // Interlineado para facilitar la lectura
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  // Mensaje inicial cuando no se ha tocado el dropdown
                  const Center(
                    child: Text(
                      'Selecciona un derecho arriba para leer los detalles.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                      textAlign: TextAlign.center,
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
