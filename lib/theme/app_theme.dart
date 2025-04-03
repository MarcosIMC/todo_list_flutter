import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color accentColor = Color(0xFF03DAC5);
  static const Color backgroundColor = Color(0xFFF2F2F2);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: accentColor,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         foregroundColor: Colors.white,
         backgroundColor: primaryColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12)
         ),
         textStyle: TextStyle(
           fontWeight: FontWeight.bold,
           color: Colors.white
         )
       ) 
      )
    );
  }
}