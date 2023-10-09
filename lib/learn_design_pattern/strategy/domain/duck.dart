import 'package:flutter_learn/learn_design_pattern/strategy/domain/respository/fly_behavior_respository.dart';
import 'package:flutter_learn/learn_design_pattern/strategy/domain/respository/quack_behavior_respository.dart';

//Define a Duck class that takes FlyBehavior and QuackBehavior objects as parameters in its constructor:
class Duck {
  final FlyBehaviorRepository flyBehavior;
  final QuackBehaviorRepository quackBehavior;

  Duck({
    required this.flyBehavior,
    required this.quackBehavior,
  });

  void performFly() {
    flyBehavior.fly();
  }

  void performQuack() {
    quackBehavior.quack();
  }
}
