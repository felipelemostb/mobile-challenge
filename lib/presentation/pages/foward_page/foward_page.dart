import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/presentation/pages/foward_page/widgets/foward_button_component.dart';
import 'package:mobile_challenge/presentation/routes/app_navigator.dart';

class FowardPage extends StatefulWidget {
  const FowardPage({Key? key}) : super(key: key);

  @override
  State<FowardPage> createState() => _FowardPageState();
}

class _FowardPageState extends State<FowardPage> {
  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return Scaffold(
      backgroundColor: AppTheme.colors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: screenPerimeter * 0.15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppTheme.images.bannerImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Discover and',
                            style: AppTheme.textStyles.styleText(
                              TypeFont.normal,
                              AppTheme.colors.black,
                              screenPerimeter * 0.018,
                              FontWeight.w700,
                            ),
                            children: const [
                              TextSpan(
                                text: '\nbook the best',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: '\nrestaurant',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'An unrivaled selection of restaurants',
                            style: AppTheme.textStyles.styleText(
                              TypeFont.light,
                              AppTheme.colors.black.withOpacity(0.5),
                              screenPerimeter * 0.006,
                              FontWeight.w600,
                            ),
                            children: const [
                              TextSpan(
                                text: '\nfor whatever you want',
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FowardButtonComponent(
                      height: screenPerimeter * 0.030,
                      width: MediaQuery.of(context).size.width * 0.22,
                      textColor: AppTheme.colors.white,
                      onPressed: () {
                        AppNavigation.navigateToNamed(
                          context,
                          "/homePage",
                          NavigationType.pushNamedAndRemoveUntil,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
