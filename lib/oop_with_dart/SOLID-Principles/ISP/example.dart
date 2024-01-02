abstract class FlyingBird {
  void fly();
}

abstract class SwimmingBird {
  void swim();
}

mixin ChirpingBehavior {
  void chirp() {
    print('Chirp chirp!');
  }
}

class Sparrow implements FlyingBird, ChirpingBehavior {
  @override
  void fly() {
    print('The sparrow is flying.');
  }

  @override
  void chirp() {
    // TODO: implement chirp
  }
}

class Penguin implements SwimmingBird {
  @override
  void swim() {
    print('The penguin is swimming.');
  }
}

void main() {
  final sparrow = Sparrow();
  final penguin = Penguin();

  sparrow.fly(); // Sparrow can fly
  sparrow.chirp(); // Sparrow can chirp

  penguin.swim(); // Penguin can swim
}
