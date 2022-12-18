import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/presentation/components/app_header.dart';
import 'package:mobile_challenge/presentation/pages/home_page/widgets/restaurant_card_widget.dart';
import 'package:mobile_challenge/presentation/pages/home_page/widgets/search_component.dart';
import 'package:mobile_challenge/presentation/routes/app_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return AppHeader(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.08,
                  top: MediaQuery.of(context).size.height * 0.04,
                ),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'What is your',
                        style: AppTheme.textStyles.styleText(
                          TypeFont.normal,
                          AppTheme.colors.black,
                          screenPerimeter * 0.016,
                          FontWeight.w700,
                        ),
                        children: const [
                          TextSpan(
                            text: '\nfavorite food?',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const SearchComponent(),
              RestaurantCardWidget(
                onTap: () {
                  AppNavigation.navigateToNamed(
                    context,
                    "/detailsPage",
                    NavigationType.pushNamed,
                  );
                },
              ),
              RestaurantCardWidget(
                onTap: () {
                  AppNavigation.navigateToNamed(
                    context,
                    "/detailsPage",
                    NavigationType.pushNamed,
                  );
                },
              ),
              RestaurantCardWidget(
                onTap: () {
                  AppNavigation.navigateToNamed(
                    context,
                    "/detailsPage",
                    NavigationType.pushNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
