import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme{
  const AppTheme._();
  static  ThemeData  mainTheme = _mainTheme;
  static  ThemeData  darkTheme = _darkTheme;
}
ThemeData _mainTheme = ThemeData(
  brightness: Brightness.light,
  textTheme:  GoogleFonts.barlowCondensedTextTheme()
  //appBarTheme: const AppBarTheme(color: AppColor.transparent),
);
ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme:  GoogleFonts.indieFlowerTextTheme()
  //appBarTheme: const AppBarTheme(color: AppColor.transparent),
);