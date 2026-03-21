import 'dart:ui';

import 'package:flutter/material.dart';

class GlobalVariables {
  // Hacer que el constructor sea privado.
  GlobalVariables._privateConstructor();

  // Instancia única de la clase.
  static final GlobalVariables _instance =
      GlobalVariables._privateConstructor();

  // Método para obtener la instancia.
  static GlobalVariables get instance => _instance;
}
