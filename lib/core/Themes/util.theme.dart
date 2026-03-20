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

/// 2. Tu función de creación de tema actualizada
TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;

  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );

  TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );

  // Combinamos los temas
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
    // Puedes mapear más estilos aquí si los necesitas
  );

  return textTheme;
}
