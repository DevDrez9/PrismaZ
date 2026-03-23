import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle textBig = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  // 📌 Título Principal (Pantallas o Secciones)
  static TextStyle title = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // 📌 Subtítulos o Secciones Secundarias
  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitleDark = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // 📌 Texto Normal / Cuerpo (Datos, información general)
  static TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyDark = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // 📌 Texto Secundario / Ayuda (Ejemplo: Etiquetas, detalles pequeños)
  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle captionDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // 📌 Texto en Botones (Botones Primarios y Secundarios)
  static TextStyle button = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white, // Texto blanco para contraste
  );

  // 📌 Texto en Inputs / Formulario (TextFormField)
  static TextStyle input = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // 📌 Placeholder en Inputs
  static TextStyle placeholder = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
