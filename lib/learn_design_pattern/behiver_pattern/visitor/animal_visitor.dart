import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/elephant.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/giraffe.dart';
import 'package:flutter_learn/learn_design_pattern/behiver_pattern/visitor/loin.dart';

abstract class AnimalVisitor {
  void visitLoin(Loin loin);
  void visitElephant(Elephant elephant);
  void visitGiraffe(Giraffe giraffe);
}
