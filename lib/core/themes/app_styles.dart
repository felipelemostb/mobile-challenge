import 'package:flutter/material.dart';

enum TypeFont { small, regular, normal, bold }

abstract class AppTextStyles {
  TextStyle styleText(
      TypeFont typeFont, Color color, double size, FontWeight fontWeight);
}

class AppTextStyleTheme implements AppTextStyles {
  @override
  TextStyle styleText(
      TypeFont typeFont, Color color, double size, FontWeight fontWeight) {
    // TODO: implement styleText
    throw UnimplementedError();
  }
}
