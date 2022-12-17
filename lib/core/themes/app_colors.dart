import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;
}

class AppColorsTheme implements AppColors {
  @override
  Color get primaryColor => const Color(0xff01f2f1);
}
