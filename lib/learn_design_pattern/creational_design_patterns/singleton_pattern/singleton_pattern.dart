///This way you can use it with dart.
class Singleton {
  //Create a private named constructor to prevent object creation from outside (Singleton class)
  //And this is called lazy initialization
  Singleton._();

  //The object when you want to create an object like a normal way and return the same instance created
  factory Singleton() => _instance;

  static final Singleton _instance = Singleton._();
}
