import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/presentation/components/bottom_navigation.dart';
import 'package:mobile_challenge/presentation/routes/app_navigator.dart';

class AppHeaderHome extends StatelessWidget {
  const AppHeaderHome({
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
            showDialog(
              context: context,
              builder: (context) {
                return SizedBox(
                  child: AlertDialog(
                    content: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: AppTheme.colors.black,
                                  size: screenPerimeter * 0.006,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Are you sure you \nwant quit?',
                                style: AppTheme.textStyles.styleText(
                                  TypeFont.normal,
                                  AppTheme.colors.black,
                                  screenPerimeter * 0.009,
                                  FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'You will definitely find the best one to serve you.',
                            style: AppTheme.textStyles.styleText(
                              TypeFont.light,
                              AppTheme.colors.black,
                              screenPerimeter * 0.006,
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () async {
                                AppNavigation.navigateToNamed(
                                  context,
                                  "/fowardPage",
                                  NavigationType.pushNamedAndRemoveUntil,
                                );
                              },
                              child: Text(
                                "Leave app",
                                style: AppTheme.textStyles.styleText(
                                  TypeFont.normal,
                                  AppTheme.colors.primaryColor,
                                  screenPerimeter * 0.008,
                                  FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: AppTheme.textStyles.styleText(
                                  TypeFont.normal,
                                  AppTheme.colors.black,
                                  screenPerimeter * 0.008,
                                  FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
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
        index: 0,
      ),
    );
  }
}
