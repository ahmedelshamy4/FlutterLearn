class LazySingleton {
  static LazySingleton? _instance;

  static LazySingleton getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = LazySingleton();
      return _instance!;
    }
  }
}
