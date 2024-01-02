// Abstraction representing a service
abstract class GreetingService {
  String greet();
}

// Low-level module implementing the service
class EnglishGreetingService implements GreetingService {
  @override
  String greet() {
    return 'Hello!';
  }
}

class SpanishGreetingService implements GreetingService {
  @override
  String greet() {
    return '¡Hola!';
  }
}


/*
// High-level module depending on abstraction (DIP)
class GreetingApp {
  final GreetingService greetingService;

  GreetingApp(this.greetingService);

  String greetUser() {
    return greetingService.greet();
  }
}

 */