import 'package:flutter/material.dart';

class AppTheme {
  static double marginVertical = 50;

  static double mainSize = 315;
  static double medioSize = 155;

  static double getMainWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9; // 90% del ancho de pantalla
  }

  static double getMainWidth80(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8; // 90% del ancho de pantalla
  }

  static double getMainWidth375(BuildContext context) {
    return MediaQuery.of(context).size.width *
        0.375; // 90% del ancho de pantalla
  }
}
