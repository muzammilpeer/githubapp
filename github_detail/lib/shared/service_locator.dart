class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  final Map<Type, dynamic> _factories = {};
  final Map<Type, dynamic> _singletons = {};

  void registerLazySingleton<T>(T Function() factoryMethod) {
    _singletons[T] = factoryMethod;
  }

  void registerFactory<T>(T Function() factoryMethod) {
    _factories[T] = factoryMethod;
  }

  T get<T>() {
    if (_singletons.containsKey(T)) {
      var service = _singletons[T];
      if (service is Function) {
        _singletons[T] = service = service();
      }
      return service;
    } else if (_factories.containsKey(T)) {
      return _factories[T]();
    } else {
      throw Exception("Service of type $T not registered");
    }
  }
}
