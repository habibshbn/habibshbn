import 'package:flutter/material.dart';

class MyStyle {
  static fontPopins({
    double fontSize,
    FontWeight fontWeight,
    Color color,
    FontStyle fontStyle,
    double height,
  }) =>
      TextStyle(
          fontFamily: 'POPPINS',
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          fontStyle: fontStyle);
  static fontMontserrat({
    double fontSize,
    FontWeight fontWeight,
    Color color,
    FontStyle fontStyle,
  }) =>
      TextStyle(
          fontFamily: 'Montserrat',
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle);
}
