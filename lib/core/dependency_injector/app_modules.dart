import 'package:mobile_challenge/core/dependency_injector/dependency_injector.dart';

class AppModules {
  static DependencyInjector initDependencyInjector() {
    final dependencyInjector = DependencyInjector.instance();
    return dependencyInjector;
  }
}
