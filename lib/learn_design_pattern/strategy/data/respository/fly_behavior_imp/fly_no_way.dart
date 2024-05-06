import 'package:flutter_learn/learn_design_pattern/strategy/domain/respository/fly_behavior_respository.dart';

class FlyNoWay implements FlyBehaviorRepository {
  @override
  void fly() {
    print("I can't fly!");
  }
}
