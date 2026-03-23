import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/AppTextStyle.dart';
import 'package:salud_apps/core/Themes/AppThem.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/core/widgets/BotonGrande.dart';
import 'package:salud_apps/features/Mapas/PoliciaPage.dart';
import 'package:salud_apps/features/Protocolo72/TarjetaRecomendacion.dart';
import 'package:salud_apps/features/SaludEducacion/SaludEducacionPage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

class ProtocoloDespues extends StatelessWidget {
  const ProtocoloDespues({super.key});

  @override
  Widget build(BuildContext context) {
    final esTemaOscuro = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true, // 1. Fundamental para que el cuerpo suba
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false, // Fuerza el título a la izquierda
        title: Text(
          l10n.home_appBarTittle,
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
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: AppTheme.getMainWidth80(context),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        width: AppTheme.getMainWidth80(context),
                        child: Text(
                          l10n.despues72h,

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
                          l10n.despues72h_desc,

                          style: AppTextStyles.body.copyWith(
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.health_and_safety_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            l10n.despues72h_tit1,

                            style: AppTextStyles.title.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      TarjetaRecomendacion(
                        texto: l10n.despues72h_tit1_card1_tit,
                        subtexto: l10n.despues72h_tit1_card1_desc,
                        icono: Icons.biotech,
                        colorIcono: Theme.of(context).colorScheme.primary,
                        colorTexto: Theme.of(context).colorScheme.primary,
                        colorFondoIcono: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                      ),
                      SizedBox(height: 20),
                      TarjetaRecomendacion(
                        texto: l10n.despues72h_tit1_card2_tit,
                        subtexto: l10n.despues72h_subCard2_desc,
                        icono: Icons.healing,
                        colorIcono: Theme.of(context).colorScheme.primary,
                        colorTexto: Theme.of(context).colorScheme.primary,
                        colorFondoIcono: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                      ),
                      SizedBox(height: 20),
                      CardDespues(context),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.gavel,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            l10n.despues72h_tit2,

                            style: AppTextStyles.subtitle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Text(
                        l10n.despues72h_tit2_desc,

                        style: AppTextStyles.caption.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PoliciaPage(),
                            ),
                          ),
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffa5d6a7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: Color(0xff0b300d)),
                              Text(
                                l10n.despues72h_tit2_btn,
                                style: TextStyle(
                                  color: Color(0xff0b300d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            color: Theme.of(context).colorScheme.primary,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            l10n.despues72h_tit3,

                            style: AppTextStyles.subtitle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        l10n.despues72h_tit3_desc,

                        style: AppTextStyles.caption.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      BlurContainer(
                        opacity: 0.9,
                        color: Theme.of(context).colorScheme.primary,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          // 1. Quité el height: 200 para que se adapte al contenido automáticamente
                          child: Row(
                            // 2. Alineamos los elementos al inicio (arriba) por si el texto es muy largo
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.heart_broken,
                                color: Theme.of(context).colorScheme.surface,
                                size: 50,
                              ),
                              const SizedBox(
                                width: 15,
                              ), // Un poquito más de separación
                              // 3. ¡LA SOLUCIÓN CLAVE! Envolvemos la Columna en un Expanded.
                              // Esto le dice: "Ocupa solo el espacio que queda en la pantalla hacia la derecha".
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Alinea los textos a la izquierda
                                  children: [
                                    Text(
                                      l10n.despues72h_subCard2,
                                      // 4. Te sugiero poner maxLines u overflow por si el título crece mucho
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.subtitle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surface,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ), // Reduje un poco este espacio para que se vea más natural
                                    // 5. Quité el Expanded del Text interno porque ahora la columna ya sabe cuál es su límite
                                    Text(
                                      l10n.despues72h_subCard2_desc,
                                      style: AppTextStyles.caption.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surface,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget CardDespues(context) {
  return BlurContainer(
    opacity: 0.5,
    color: Theme.of(context).colorScheme.primary,

    child: Container(
      width: AppTheme.getMainHeight80(context),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Derechos repructivos I.L.E",

            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
              fontSize: 24,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Tienes derecho a la Interrupcion Legal del Embarazo I.L.E.",

            style: AppTextStyles.caption.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(height: 20),

          BlurContainer(
            opacity: 0.9,
            color: Theme.of(context).colorScheme.surface,

            child: Container(
              width: AppTheme.getMainHeight80(context),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "En casos de violencia Sexual",

                    style: AppTextStyles.subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "• No se requiere orden Judicial \n• Solo es necesaria la copia de la Denuncia Policial",

                    style: AppTextStyles.caption.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
