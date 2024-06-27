import 'package:flutter/material.dart';
import 'colors_sizes.dart';


Map<String, ThemeData> themes = {
  'basicTheme': basicTheme,
  'darkTheme': darkTheme,
};

ThemeData basicTheme = ThemeData(
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: basicDisabled,
    cursorColor: basicBaseColor,
    selectionHandleColor: Colors.transparent,
  ),
  fontFamily: 'Manrope',
  scaffoldBackgroundColor: basicBackGroundLight,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  brightness: Brightness.light,
  dividerTheme: const DividerThemeData(color: basicBackGround, thickness: 1),
  primaryColor: primaryColor,
  secondaryHeaderColor: basicGrey,
  dividerColor: Colors.grey.withOpacity(0.2),
  primaryColorLight: primaryColorLight,
  disabledColor: basicDisabled,
  primaryColorDark: basicBaseColor,
  dialogBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: basicBackGroundSwatch)
      .copyWith(background: basicBackGround, onBackground: basicBackGround, brightness: Brightness.light),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: darkDisabled,
    cursorColor: darkBaseColor,
    selectionHandleColor: Colors.transparent,
  ),
  fontFamily: 'SourceSansPro',
  colorScheme: ColorScheme.fromSwatch(primarySwatch: darkBackGroundSwatch)
      .copyWith(background: darkBackGround, onBackground: Colors.black, brightness: Brightness.dark),
  scaffoldBackgroundColor: darkBackGroundLight,
  brightness: Brightness.dark,
  primaryColor: darkBaseColor,
  secondaryHeaderColor: Colors.white24,
  primaryColorLight: Colors.white10,
  dividerTheme: const DividerThemeData(color: basicBackGround, thickness: 1),
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  dividerColor: Colors.white.withOpacity(0.5),
  disabledColor: darkDisabled,
  primaryColorDark: darkBaseColor,
  primarySwatch: darkBackGroundSwatch,
  dialogBackgroundColor: darkBackGround,
);
