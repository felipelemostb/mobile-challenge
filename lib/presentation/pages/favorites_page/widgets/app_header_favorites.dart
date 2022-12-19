import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/presentation/components/bottom_navigation.dart';

class AppHeaderFavorites extends StatelessWidget {
  const AppHeaderFavorites({
    super.key,
    required this.child,
    this.icon,
    this.title,
  });
  final Widget child;
  final Icon? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title ?? '',
          style: AppTheme.textStyles.styleText(
            TypeFont.normal,
            AppTheme.colors.black,
            screenPerimeter * 0.008,
            FontWeight.w700,
          ),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: icon ??
              Icon(
                Icons.arrow_back_outlined,
                color: AppTheme.colors.primaryColor,
                size: screenPerimeter * 0.010,
              ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: child,
      bottomNavigationBar: const BottomNavigation(
        index: 1,
      ),
    );
  }
}
