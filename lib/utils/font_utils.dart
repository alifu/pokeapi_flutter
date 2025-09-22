// utils/font_utils.dart
import 'package:flutter/material.dart';

class FontUtils {
  static TextStyle headerHeadline({Color color = Colors.black}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle headerSubtitle1({Color color = Colors.black}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle headerSubtitle2({Color color = Colors.black}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle headerSubtitle3({Color color = Colors.black}) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle body1({Color color = Colors.black}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle body2({Color color = Colors.black}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle body3({Color color = Colors.black}) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle caption({Color color = Colors.black}) => TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.normal,
    color: color,
  );
}
