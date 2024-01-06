import 'package:flutter/material.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

final lightTheme = ThemeData(
  brightness:  Brightness.light,
  primaryColor: Colors.white,
  hintColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
   highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
   textTheme: const TextTheme(
     headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    subtitle1: TextStyle(color: Colors.black),
    subtitle2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    caption: TextStyle(color: Colors.black),
    button: TextStyle(color: Colors.black),
    overline: TextStyle(color: Colors.black),
  )
);

final darkTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
   selectionColor: Colors.white,
  ),
  scaffoldBackgroundColor: HexColor("000000"), //0a090c 001219
  primaryColorDark: Colors.white,
  hintColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
  textTheme: const TextTheme(
     headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
    subtitle2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    caption: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
    overline: TextStyle(color: Colors.white),
  )
);