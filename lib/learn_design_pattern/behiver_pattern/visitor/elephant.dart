import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal_visitor.dart';

class Elephant implements Animal {
  @override
  void accept(AnimalVisitor visitor) {
    visitor.visitElephant(this);
  }
}
