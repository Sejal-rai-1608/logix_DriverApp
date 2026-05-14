// =================================
// MAIN.DART
// =================================

import 'package:drivaer_logixapp/onboardingScreen/DriverOnboardingOneScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),

        scaffoldBackgroundColor: const Color(0xffF8F8F8),
      ),

      home: const DriverOnboardingOneScreen(),
    );
  }
}
