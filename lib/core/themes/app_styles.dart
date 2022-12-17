import 'package:flutter/material.dart';

enum TypeFont { normal, light }

abstract class AppTextStyles {
  TextStyle styleText(
      TypeFont typeFont, Color color, double size, FontWeight fontWeight);
}

class AppTextStyleTheme implements AppTextStyles {
  @override
  TextStyle styleText(
    TypeFont typeFont,
    Color color,
    double size,
    FontWeight fontWeight,
  ) {
    switch (typeFont) {
      case TypeFont.normal:
        return TextStyle(
          fontFamily: 'CocoNormal',
          fontWeight: fontWeight,
          fontSize: size,
          color: color,
        );

      case TypeFont.light:
        return TextStyle(
          fontFamily: 'CocoLight',
          fontWeight: fontWeight,
          fontSize: size,
          color: color,
        );
    }
  }
}
