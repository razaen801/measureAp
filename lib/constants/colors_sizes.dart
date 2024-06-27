import 'dart:ui';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF003F70);
Color primaryColorLight = const Color(0xFF4D6FE7);
Color secondaryColor = const Color(0xFFf55b15);
Color secondaryColorLight = const Color(0xFFf9bda1);
Color orangeTips = const Color(0xFFFF8E00);
const Color greenProgress = const Color(0xFF44D1BB);
Color redWarning = const Color(0xFF9A0C0C);


//BasicTheme
const basicBackGround = Color(0xFFEDEEF0);
const basicBackGroundLight = basicBackGround;
// const basicBackGroundLight = Color(0xFFFBFBFB);
const basicBaseColor = Color(0xFF1E1E1E);
const basicGrey = Color(0xFF878D96); //Aiden Cool Grey
const basicDisabled = Color(0xFFC1C7CD);
const basicModuleBorderColor = basicBackGroundLight;
var basicBackGroundSwatch = _basicBackGroundSwatch;

final Map<int, Color> _basicBackGround = {
  50: basicBaseColor,
  100: basicBaseColor,
  200: basicBaseColor,
  300: basicBaseColor,
  400: basicBaseColor,
  500: basicBaseColor,
  600: basicBaseColor,
  700: basicBaseColor,
  800: basicBaseColor,
  900: basicBaseColor,
};
final MaterialColor _basicBackGroundSwatch = MaterialColor(basicBaseColor.value, _basicBackGround);

//DarkTheme
const darkBackGround = Color(0xFF21272A); // Aiden Warm Black
const darkBackGroundLight = Color(0xFF121619);
const darkBaseColor = Color(0xFFFFFFFF);
const darkGrey = Color(0xFFD3DAE1); //Aiden Cool Grey
const darkDisabled = Color(0xFF545A6A);
const darkModuleBorderColor = darkBackGroundLight; // Aiden Limelight Green
var darkBackGroundSwatch = _darkBackGroundSwatch;

final Map<int, Color> _darkBackGround = {
  50: darkBackGround,
  100: darkBackGround,
  200: darkBackGround,
  300: darkBackGround,
  400: darkBackGround,
  500: darkBackGround,
  600: darkBackGround,
  700: darkBackGround,
  800: darkBackGround,
  900: darkBackGround,
};
final MaterialColor _darkBackGroundSwatch = MaterialColor(basicBackGround.value, _darkBackGround);
