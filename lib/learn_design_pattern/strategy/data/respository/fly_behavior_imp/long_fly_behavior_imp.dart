import 'package:flutter_learn/learn_design_pattern/strategy/domain/respository/fly_behavior_respository.dart';

class LongFlyBehaviorImp implements FlyBehaviorRepository {
  @override
  void fly() {
    print('I can fly long distances.');
  }
}
