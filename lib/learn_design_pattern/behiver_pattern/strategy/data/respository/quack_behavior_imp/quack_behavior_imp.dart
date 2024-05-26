import 'package:flutter_learn/learn_design_pattern/behiver_pattern/strategy/domain/respository/quack_behavior_respository.dart';

class QuackBehaviorRepositoryImp implements QuackBehaviorRepository{
  @override
  void quack() {
    print('Quack!');
  }
}