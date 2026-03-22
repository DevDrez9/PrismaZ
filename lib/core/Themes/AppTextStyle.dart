import 'package:flutter/material.dart';

class AppTextStyles {
  // 📌 Título Principal (Pantallas o Secciones)
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // 📌 Subtítulos o Secciones Secundarias
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitleDark = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // 📌 Texto Normal / Cuerpo (Datos, información general)
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle bodyDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // 📌 Texto Secundario / Ayuda (Ejemplo: Etiquetas, detalles pequeños)
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle captionDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // 📌 Texto en Botones (Botones Primarios y Secundarios)
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white, // Texto blanco para contraste
  );

  // 📌 Texto en Inputs / Formulario (TextFormField)
  static const TextStyle input = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // 📌 Placeholder en Inputs
  static const TextStyle placeholder = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
