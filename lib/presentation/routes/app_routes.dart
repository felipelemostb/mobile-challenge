import 'package:flutter/material.dart';
import 'package:mobile_challenge/core/dependency_injector/dependency_injector.dart';
import 'package:mobile_challenge/presentation/pages/details_page/details_page.dart';
import 'package:mobile_challenge/presentation/pages/favorites_page/favorites_page.dart';
import 'package:mobile_challenge/presentation/pages/foward_page/foward_page.dart';
import 'package:mobile_challenge/presentation/pages/home_page/home_page.dart';
import 'package:mobile_challenge/presentation/pages/splash_page/splash_page.dart';

class RoutesName {
  static Map<String, Widget Function(BuildContext)> routesName(
      DependencyInjector dependencyInjector) {
    return {
      "/homePage": (context) => HomePage(
            dependencyInjector: dependencyInjector,
          ),
      "/detailsPage": (context) => const DetailsPage(),
      "/splashPage": (context) => const SplashPage(),
      "/fowardPage": (context) => const FowardPage(),
      "/favoritesPage": (context) => const FavoritesPage(),
    };
  }
}
