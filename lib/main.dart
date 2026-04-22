import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/splash_screen_ui.dart';

const _aisPrimary = Color(0xFF7CB518);
const _aisAccent = Color(0xFFD6FF57);
const _appBackground = Color(0xFFF7FAF2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: _aisPrimary,
      brightness: Brightness.light,
    );
    final colorScheme = baseColorScheme.copyWith(
      primary: _aisPrimary,
      onPrimary: const Color(0xFF173000),
      secondary: _aisAccent,
      onSecondary: const Color(0xFF243800),
      tertiary: const Color(0xFF2F855A),
      surface: Colors.white,
      onSurface: const Color(0xFF1E2418),
      surfaceContainerHighest: const Color(0xFFF0F7E3),
      outlineVariant: const Color(0xFFE1E8D5),
    );
    final textTheme = GoogleFonts.kanitTextTheme(
      ThemeData.light().textTheme,
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return MaterialApp(
      title: 'Thai Hotline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: _appBackground,
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: colorScheme.onSurface,
          surfaceTintColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: const Color(0xFF7D8573),
          selectedLabelStyle: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 10,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: colorScheme.onSurface,
          contentTextStyle: textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}
