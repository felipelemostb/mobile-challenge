import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/responsiveness/device_screen_information.dart';
import 'package:mobile_challenge/core/themes/app_styles.dart';
import 'package:mobile_challenge/core/themes/app_theme.dart';
import 'package:mobile_challenge/presentation/routes/app_navigator.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late List<Map<String, dynamic>> itemBottom = [
    {
      "name": 'HOME',
      "route": '/homePage',
      "index": 0,
      "icon": const ImageIcon(
        AssetImage("assets/icons/home.png"),
      ),
    },
    {
      "name": 'FAVORITES',
      "route": "/favoritesPage",
      "index": 1,
      "icon": const ImageIcon(
        AssetImage("assets/icons/hearth.png"),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    num screenPerimeter = DeviceScreenInformation.perimeter(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTheme.textStyles.styleText(
        TypeFont.normal,
        AppTheme.colors.black,
        screenPerimeter * 0.004,
        FontWeight.normal,
      ),
      unselectedLabelStyle: AppTheme.textStyles.styleText(
        TypeFont.normal,
        AppTheme.colors.white,
        screenPerimeter * 0.004,
        FontWeight.normal,
      ),
      elevation: 1,
      selectedFontSize: screenPerimeter * 0.005,
      unselectedFontSize: screenPerimeter * 0.005,
      backgroundColor: AppTheme.colors.primaryColor,
      selectedItemColor: AppTheme.colors.black,
      unselectedItemColor: AppTheme.colors.white,
      onTap: (index) {
        AppNavigation.navigateToNamed(
          context,
          itemBottom
              .where((element) => element["index"] == index)
              .first["route"],
          NavigationType.pushReplacementNamed,
        );
      },
      currentIndex: widget.index,
      items: itemBottom
          .map(
            (e) => BottomNavigationBarItem(
              label: e['name'],
              icon: e['icon'],
            ),
          )
          .toList(),
    );
  }
}
