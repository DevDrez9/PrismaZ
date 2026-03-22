import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salud_apps/core/Themes/theme.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/constants/language_notifier.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/features/BienvenidaPage/BienvenidaPage.dart';
import 'package:salud_apps/features/HomePage/HomePage.dart';
import 'package:salud_apps/l10n/app_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Inter", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);

    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (context, currentLocale, child) {
        return MaterialApp(
          title: 'SaludApps',
          theme: brightness == Brightness.light ? theme.light() : theme.dark(),
          initialRoute: 'splash',
          debugShowCheckedModeBanner: false,
          locale: currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate, // Generado por tus archivos .arb
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,

            // ¡NUEVO! Agregamos los respaldos para el aymara
            FallbackMaterialLocalizationDelegate(),
            FallbackCupertinoLocalizationDelegate(),
            FallbackWidgetsLocalizationDelegate(),
          ],
          supportedLocales: const [
            Locale('es', ''), // Español
            Locale('ay', ''), // Inglés
          ],

          routes: <String, WidgetBuilder>{
            'splash': (BuildContext context) => SplashScreen(),
            '/': (BuildContext context) => Homepage(),
          },
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Esperar 2 segundos y luego navegar a la pantalla principal
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"), // Ruta de tu imagen
                fit: BoxFit
                    .cover, // Ajusta la imagen para que cubra todo el fondo
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset("assets/images/logo1.png"),
          ),
        ],
      ),
    );
  }
}

// 1. Respaldo para Material (Botones, AppBar, Calendarios)
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ay';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      await GlobalMaterialLocalizations.delegate.load(const Locale('es', '')); // Forzamos español

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<MaterialLocalizations> old,
  ) => false;
}

// 2. Respaldo para Cupertino (Estilo iOS)
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ay';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      await GlobalCupertinoLocalizations.delegate.load(const Locale('es', '')); // Forzamos español

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<CupertinoLocalizations> old,
  ) => false;
}

// 3. Respaldo para Widgets generales
class FallbackWidgetsLocalizationDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const FallbackWidgetsLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ay';

  @override
  Future<WidgetsLocalizations> load(Locale locale) async =>
      await GlobalWidgetsLocalizations.delegate.load(const Locale('es', '')); // Forzamos español

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<WidgetsLocalizations> old,
  ) => false;
}
