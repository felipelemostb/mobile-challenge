abstract class AppAnimations {
  String get splashScreen;
}

class AppAnimationsTheme implements AppAnimations {
  @override
  String get splashScreen => "assets/animations/splash.json";
}
