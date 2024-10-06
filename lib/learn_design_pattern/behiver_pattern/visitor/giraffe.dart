import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal_visitor.dart';

class Giraffe implements Animal {
  @override
  void accept(AnimalVisitor visitor) {
    visitor.visitGiraffe(this);
  }
}
