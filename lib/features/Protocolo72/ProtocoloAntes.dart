import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salud_apps/core/Themes/AppTextStyle.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/features/Protocolo72/TarjetaRecomendacion.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';

class ProtocoloAntes extends StatelessWidget {
  const ProtocoloAntes({super.key});

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
          "Yamapiri",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black,
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "Antes de 72 horas",

                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "Fase 1: Accion Inmediata",

                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "Preservacion de Evidencia (Vital)",

                        style: AppTextStyles.body.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TarjetaRecomendacion(
                      texto: "NO bañarse",
                      icono: Icons.shower,
                      colorIcono: Theme.of(context).colorScheme.error,
                      colorTexto: Theme.of(context).colorScheme.error,
                      colorFondoIcono: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                    ),
                    SizedBox(height: 10),
                    TarjetaRecomendacion(
                      texto: "NO lavarse los dientes/cortar las uñas",
                      icono: Icons.cleaning_services_outlined,
                      colorIcono: Theme.of(context).colorScheme.error,
                      colorTexto: Theme.of(context).colorScheme.error,
                      colorFondoIcono: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                    ),
                    SizedBox(height: 10),
                    TarjetaRecomendacion(
                      texto: "NO cambiarse la ropa",
                      subtexto: "(Usar bolsa de papel si es necesario)",
                      icono: Icons.checkroom_rounded,
                      colorIcono: Theme.of(context).colorScheme.error,
                      colorTexto: Theme.of(context).colorScheme.error,
                      colorFondoIcono: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                    ),
                    SizedBox(height: 10),
                    TarjetaRecomendacion(
                      texto: "NO limpiar la escena",
                      icono: Icons.domain_disabled,
                      colorIcono: Theme.of(context).colorScheme.error,
                      colorTexto: Theme.of(context).colorScheme.error,
                      colorFondoIcono: Theme.of(
                        context,
                      ).colorScheme.errorContainer,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "Paso 2: A donde acudir?",

                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TarjetaCentroSaludEstatico(onTap: () => {}),
                    SizedBox(height: 20),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "Paso 3: Ellos haran la denuncia por ti",

                        style: AppTextStyles.title.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: AppTheme.getMainWidth80(context),
                      child: Text(
                        "El personal médico tiene la obligación de reportar el delito a las autoridades y darte toda la atención que necesitas.",

                        style: AppTextStyles.body.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: AppTheme.getMainWidth60(context),
                      child: SvgPicture.asset(
                        "assets/undraw_warnings_agxg.svg",
                        fit: BoxFit.contain,
                      ),
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

class TarjetaCentroSaludEstatico extends StatelessWidget {
  // 1. Agregamos la variable para recibir la función
  final VoidCallback onTap;

  const TarjetaCentroSaludEstatico({
    super.key,
    required this.onTap, // 2. La pedimos como obligatoria
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      opacity: 0.9,
      color: Theme.of(context).colorScheme.surface,

      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- FILA SUPERIOR: ICONO Y ETIQUETA ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA1D19C),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.add_location_alt_rounded,
                    color: Color(0xFF102A14),
                    size: 32,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA1D19C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Prioridad",
                    style: TextStyle(
                      color: Color(0xFF102A14),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- TÍTULO ---
            const Text(
              "Centro de Salud",
              style: TextStyle(
                color: Color(0xFF38324A),
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),

            // --- PÁRRAFO ---
            const Text(
              "Solicita el Kit PPE (Profilaxis Post-Exposición) para prevenir infecciones y embarazo. No requiere denuncia previa.",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            // --- BOTÓN "IR AHORA" ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                // 3. ¡LA CONECTAMOS AL BOTÓN!
                onPressed: onTap,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1D19C),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Ir ahora",
                  style: TextStyle(
                    color: Color(0xFF102A14),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
