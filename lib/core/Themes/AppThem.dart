import 'package:flutter/material.dart';

class AppTheme {
  static double marginVertical = 50;

  static double mainSize = 315;
  static double medioSize = 155;

  static Color colorVerde = Color(0xff2c8f93);
  static Color colorAmariilo = Color(0xffffde59);
  static Color colorPlomo = Color.fromARGB(255, 40, 0, 56);

  static double getMainWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9; // 90% del ancho de pantalla
  }

  static double getMainWidth80(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8; // 90% del ancho de pantalla
  }

  static double getMainHeight80(BuildContext context) {
    return MediaQuery.of(context).size.height *
        0.8; // 90% del ancho de pantalla
  }

  static double getMainWidth60(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.6; // 90% del ancho de pantalla
  }

  static double getMainWidth30(BuildContext context) {
    return MediaQuery.of(context).size.width *
        0.30; // 90% del ancho de pantalla
  }

  static double getMainWidth25(BuildContext context) {
    return MediaQuery.of(context).size.width *
        0.25; // 90% del ancho de pantalla
  }

  static double getMainWidth40(BuildContext context) {
    return MediaQuery.of(context).size.width *
        0.38; // 90% del ancho de pantalla
  }
}
