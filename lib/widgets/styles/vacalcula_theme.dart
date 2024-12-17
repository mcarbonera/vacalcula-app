import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VacalculaTheme {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromARGB(255, 243, 255, 224),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 219, 239, 186)),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.agbalumo(
          fontSize: 35,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal
        ),
        titleMedium: GoogleFonts.agbalumo(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal
        ),
        bodyMedium: GoogleFonts.afacad(
          fontSize: 15
        ),
        displayMedium: GoogleFonts.nunitoSans(
          fontSize: 24
        ),
        displaySmall: GoogleFonts.nunitoSans(
          fontSize: 20
        ),
      ),
    );
  }
}