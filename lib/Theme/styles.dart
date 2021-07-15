import 'package:academy_lms/Theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Sans',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color(0xffFF3939),
  hintColor: hintColor,
  dividerColor: textFieldColor,
  appBarTheme: AppBarTheme(
    color: Color(0xffFF3939),
    elevation: 0,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xffFF3939)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        padding: MaterialStateProperty.all(
            EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 12,
        ))),
  ),
  textTheme: TextTheme(
      button: TextStyle(
          color: Color(0xffFF3939),
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w700),
      bodyText1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline1: TextStyle(),
      headline5: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white, fontSize: 18.3),
      bodyText2: TextStyle(),
      subtitle2: TextStyle(color: hintColor)),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
