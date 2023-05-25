class Person {
  String _name; // private instance variable
  int _age; // private instance variable
  Person(this._name, this._age); // constructor
// setters
  set name(String name) => _name = name;

  set age(int age) => _age = age;

  // getters
  String get name => _name;

  int get age => _age;

  // method
  void sayHello() {
    print("Hello, my name is $_name and I am $_age years old.");
  }
}

void main() {
  var person = Person("ahmed", 27);
  person.sayHello();
  person.name = "adel";
  person.age = 60;
  person.sayHello();
}
