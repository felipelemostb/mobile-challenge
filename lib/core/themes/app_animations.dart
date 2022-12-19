abstract class AppAnimations {
  String get splashScreen;
  String get empty;
}

class AppAnimationsTheme implements AppAnimations {
  @override
  String get splashScreen => "assets/animations/splash.json";

  @override
  String get empty => "assets/animations/empty.json";
}
