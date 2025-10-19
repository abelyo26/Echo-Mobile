import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryGreen = Color(0xFF41BF61);
  static const Color darkBackground = Color(0xFF262626);
  static const Color darkSecondary = Color(0xFF2A2A2A);

  // Text Colors
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB8B8B8);

  // Accent Colors
  static const Color accentBlue = Color(0xFF007AFF);
  static const Color greenSuccess = Color(0xFF4CD964);

  // UI Element Colors
  static const Color cardBackground = Color(0xFF2A2A2A);
  static const Color inputBackground = Color(0xFF2A2A2A);

  // ThemeData
  static ThemeData get darkTheme {
    // Create a theme with Roboto Mono font

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primaryGreen,
      fontFamily: GoogleFonts.robotoMono().fontFamily,
      colorScheme: const ColorScheme.dark(
        primary: primaryGreen,
        secondary: primaryGreen,
        background: darkBackground,
        surface: darkSecondary,
        onPrimary: textLight,
        onSecondary: textLight,
        onBackground: textLight,
        onSurface: textLight,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: textLight),
      ),

      // Card Theme
      cardTheme: const CardTheme(
        color: cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.robotoMono(
          color: textLight,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.robotoMono(color: textLight, fontSize: 16),
        bodyMedium: GoogleFonts.robotoMono(color: textLight, fontSize: 14),
        bodySmall: GoogleFonts.robotoMono(color: textSecondary, fontSize: 12),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: textLight,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryGreen,
          textStyle: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputBackground,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryGreen, width: 1),
        ),
        hintStyle: const TextStyle(color: textSecondary),
      ),

      // Tab Bar Theme
      tabBarTheme: const TabBarTheme(
        labelColor: primaryGreen,
        unselectedLabelColor: textSecondary,
        indicatorColor: primaryGreen,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }
}

/* class NoOnesTheme {
  static const Color primary = Color(0xFF41BF61);
  static const Color primaryVariant = Color(0xFF14A670);
  static const Color accent = Color(0xFF52F27A);
  static const Color secondary = Color(0xFF734206);
  static const Color background = Color(0xFF262626);
  static const Color surface = Color(0xFF1D4033);
  static const Color warning = Color(0xFFF2E3B6);
  static const Color textColor = Color(0xFFD9D9D9);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        background: background,
        error: warning,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textColor,
        onBackground: textColor,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        titleTextStyle: TextStyle(color: Color(0xFFD9D9D9), fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: textColor),
        bodyLarge: TextStyle(color: textColor, fontSize: 16),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
} */
