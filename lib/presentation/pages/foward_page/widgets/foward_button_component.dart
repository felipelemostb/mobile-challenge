import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';

class FowardButtonComponent extends StatelessWidget {
  final Icon? title;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final bool isLoading;
  final bool enabled;
  final Color textColor;

  const FowardButtonComponent({
    Key? key,
    this.title,
    this.width,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.height,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Row(
      children: [
        Text(
          'Enter',
          style: AppTheme.textStyles.styleText(
            TypeFont.normal,
            AppTheme.colors.black,
            screenPerimeter * 0.007,
            FontWeight.w900,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.10),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: enabled && !isLoading ? onPressed : null,
              child: Container(
                height: height ?? 30,
                width: width ?? 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.colors.white,
                  size: screenPerimeter * 0.009,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
