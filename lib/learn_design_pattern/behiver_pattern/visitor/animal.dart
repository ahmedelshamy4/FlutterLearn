import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal_visitor.dart';

abstract class Animal {
  void accept(AnimalVisitor visitor);
}
