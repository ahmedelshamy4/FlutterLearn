import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/animal_visitor.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/elephant.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/giraffe.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/loin.dart';

class WeightCalculateVisitor implements AnimalVisitor {
  @override
  void visitElephant(Elephant elephant) {
    print('Elephant weight is: 1000 kg');
  }

  @override
  void visitGiraffe(Giraffe giraffe) {
    print('Giraffe weight is: 800 kg');
  }

  @override
  void visitLoin(Loin loin) {
    print('Loin weight is: 200 kg');
  }
}
