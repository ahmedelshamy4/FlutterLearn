import 'package:flutter_learn/learn_design_pattern/strategy/domain/respository/quack_behavior_respository.dart';

class SqueakBehaviorImp implements QuackBehaviorRepository {
  @override
  void quack() {
    print('Squeak!');
  }
}
