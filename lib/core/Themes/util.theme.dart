import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 1. Extensión para añadir variantes Bold al TextTheme existente
extension TextThemeBold on TextTheme {
  TextStyle? get bodyLargeBold =>
      bodyLarge?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get bodyMediumBold =>
      bodyMedium?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get bodySmallBold =>
      bodySmall?.copyWith(fontWeight: FontWeight.bold);

  TextStyle? get labelLargeBold =>
      labelLarge?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? get titleMediumBold =>
      titleMedium?.copyWith(fontWeight: FontWeight.bold);
}

TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;

  // Al usar poppinsTextTheme, Flutter aplica automáticamente la fuente a
  // títulos, subtítulos, cuerpo de texto y botones de un solo golpe.
  TextTheme textTheme = GoogleFonts.poppinsTextTheme(baseTextTheme);

  return textTheme;
}
