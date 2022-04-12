import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final CustomTheme _instance = CustomTheme._internal();

  factory CustomTheme() {
    return _instance;
  }

  ThemeData _theme = ThemeData();

  CustomTheme._internal() {
    _theme = _buildTheme();
  }

  ThemeData get theme => _theme;

  ThemeData _buildTheme() {
    var textTheme = const TextTheme(headline1: TextStyle());
    var theme = ThemeData.light();
    var bottomNavigationBarThemeData = const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(255, 255, 255, .6),
    );
    var accentColor = const Color.fromRGBO(247, 181, 0, 1);
    return theme.copyWith(
      primaryColor: const Color(0xff000000),
      primaryColorLight: const Color(0xff222222),
      primaryColorDark: Colors.black,
      // ignore: deprecated_member_use
      accentColor: accentColor,
      cardColor: Colors.white,
      highlightColor: Colors.grey[600],
      scaffoldBackgroundColor: Colors.grey[100],
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: textTheme,
      primaryTextTheme: TextTheme(
        headline2: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        headline3: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 18,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 16,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
        overline: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 16,
          color:  Colors.blue,
          fontWeight: FontWeight.w500,
        ),
        headline1: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 24,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
        ),
        bodyText1: GoogleFonts.roboto(
          height: 1.2,
          fontSize: 13,
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: bottomNavigationBarThemeData,
      tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            border: Border(bottom: BorderSide(color: accentColor, width: 2)),
          )),
      appBarTheme: const AppBarTheme(
          color: Color(0xff131313),
          shadowColor: Color(0x99000000),
          elevation: 10),
    );
  }
}
