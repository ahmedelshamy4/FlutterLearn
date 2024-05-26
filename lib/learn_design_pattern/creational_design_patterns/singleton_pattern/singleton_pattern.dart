/// About Singleton Design Pattern.
/// We have 2 ways about create singleton object.
/// This is the first simple way and you can use it with any (Programming Language),
/// .called (initialization Eager).
class Singleton {
  static final Singleton _instance = Singleton();

  static Singleton getInstance() => _instance;
}
/*
  وهنا بنلجأ للحل األكثر مرونة أال وهو
  هنا بنخلي الـInstance نايمة + لما حد يـ Callـها
  يتعملها Activation
ي
 */
///This way you can use it with dart.
class Singleton2 {
  //Create a private named constructor to prevent object creation from outside (Singleton class)
  //And this is called lazy initialization
  Singleton2._();

  //The object when you want to create an object like a normal way and return the same instance created
  factory Singleton2() => _instance;

  static final Singleton2 _instance = Singleton2._();
}
