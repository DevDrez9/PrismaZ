import 'dart:async';

import 'package:flutter/material.dart';
import 'package:salud_apps/core/Themes/theme.dart';
import 'package:salud_apps/core/Themes/util.theme.dart';
import 'package:salud_apps/core/widgets/BlurContainer.dart';
import 'package:salud_apps/features/HomePage/HomePage.dart';

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

    return MaterialApp(
      title: 'SaludApps',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: 'splash',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        'splash': (BuildContext context) => SplashScreen(),
        '/': (BuildContext context) => Homepage(),
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
