import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megatech/theme/app_color.dart';

abstract class AppTheme{
  const AppTheme._();
  static  ThemeData  mainTheme = _mainTheme;
  static  ThemeData  darkTheme = _darkTheme;
}
ThemeData _mainTheme = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColor.white,
  textTheme:  GoogleFonts.barlowCondensedTextTheme()
 //   textTheme:  GoogleFonts.indieFlowerTextTheme()
  //appBarTheme: const AppBarTheme(color: AppColor.transparent),
);
ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme:  GoogleFonts.indieFlowerTextTheme()
  //appBarTheme: const AppBarTheme(color: AppColor.transparent),
);