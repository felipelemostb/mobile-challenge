typedef InstanceCreator<T extends Object> = T Function();

class _Instances {
  static final appInstances = <Type, Object>{};
}

class DependencyInjector {
  DependencyInjector._private();
  static final _instance = DependencyInjector._private();
  factory DependencyInjector.instance() {
    return _instance;
  }

  void registerDependency<T extends Object>(
      InstanceCreator<T> instanceCreator) {
    if (!_Instances.appInstances.containsKey(T)) {
      _Instances.appInstances[T] = instanceCreator();
    }
  }

  T fetchDependency<T extends Object>([InstanceCreator<T>? instanceCreator]) {
    final Object? instance;
    if (instanceCreator == null) {
      instance = _Instances.appInstances[T];
    } else {
      instance = instanceCreator();
    }

    return instance != null && instance is T
        ? instance
        : throw Exception(
            "ERROR -> The instance of ${T.toString()} was not found");
  }
}
