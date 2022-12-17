import 'package:mobile_challenge/core/themes/app_animations.dart';
import 'package:mobile_challenge/core/themes/app_colors.dart';
import 'package:mobile_challenge/core/themes/app_images.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';

class AppTheme {
  static AppColors get colors => AppColorsTheme();
  static AppTextStyles get textStyles => AppTextStyleTheme();
  static AppImages get images => AppImagesTheme();
  static AppAnimations get animations => AppAnimationsTheme();
}
