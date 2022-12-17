import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;
  Color get black;
  Color get white;
}

class AppColorsTheme implements AppColors {
  @override
  Color get primaryColor => const Color(0xffbad4ce);

  @override
  Color get black => const Color(0xff252525);

  @override
  Color get white => const Color(0xffFFFFFF);
}
