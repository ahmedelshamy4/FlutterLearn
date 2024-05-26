
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/domain/respository/fly_behavior_respository.dart';

class FlyWithWings implements FlyBehaviorRepository {
  @override
  void fly() {
    print("I'm flying with wings!");
  }
}
