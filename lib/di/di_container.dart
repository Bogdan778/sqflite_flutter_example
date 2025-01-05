class DiContainer {
  final Map<Type, dynamic> _classes = {};
  static final DiContainer _instance = DiContainer._internal();

  factory DiContainer() => _instance;

  DiContainer._internal();

  void register<T>(T instance) {
    _classes[T] = instance;
  }

  T getDependency<T>() {
    return _classes[T] as T;
  }
}
